package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.model.CommentModel;
import com.util.DBConfig;

public class CommentDAO {
	public List<CommentModel> getCommentsByPostId(int postId) throws SQLException {

        String query = "SELECT c.Comment_ID, c.Post_ID, c.User_ID, c.Comment_Message, "
                + "       c.Comment_Date, c.Parent_Comment_ID, "
                + "       u.Username, u.User_Profile_Picture, "
                + "       COUNT(cv.Comment_Vote_ID) AS vote_count "
                + "FROM comment c "
                + "JOIN user u ON c.User_ID = u.user_ID "
                + "LEFT JOIN comment_vote cv ON c.Comment_ID = cv.Comment_ID AND cv.vote_type = 1 "
                + "WHERE c.Post_ID = ? "
                + "GROUP BY c.Comment_ID, c.Post_ID, c.User_ID, c.Comment_Message, "
                + "         c.Comment_Date, c.Parent_Comment_ID, "
                + "         u.Username, u.User_Profile_Picture "
                + "ORDER BY c.Comment_Date ASC";

        // Use LinkedHashMap to preserve insertion order
        Map<Integer, CommentModel> commentMap = new LinkedHashMap<>();

        try (
            Connection con = DBConfig.getConnection();
            PreparedStatement ps = con.prepareStatement(query)
        ) {
            ps.setInt(1, postId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    CommentModel comment = new CommentModel();

                    comment.setCommentId(rs.getInt("Comment_ID"));
                    comment.setPostId(rs.getInt("Post_ID"));
                    comment.setUserId(rs.getInt("User_ID"));
                    comment.setCommentMessage(rs.getString("Comment_Message"));
                    comment.setCommentDate(rs.getTimestamp("Comment_Date"));
                    comment.setVoteCount(rs.getInt("vote_count"));
                    comment.setUsername(rs.getString("Username"));
                    comment.setUserProfilePicture(rs.getBytes("User_Profile_Picture"));

                    // handle nullable Parent_Comment_ID
                    int parentId = rs.getInt("Parent_Comment_ID");
                    comment.setParentCommentId(rs.wasNull() ? null : parentId);

                    comment.setReplies(new ArrayList<>());
                    commentMap.put(comment.getCommentId(), comment);
                }
            }
        }

        // Group: attach replies to their parent
        List<CommentModel> topLevel = new ArrayList<>();
        for (CommentModel comment : commentMap.values()) {
            if (comment.getParentCommentId() == null) {
                topLevel.add(comment);
            } else {
            	CommentModel parent = commentMap.get(comment.getParentCommentId());
                if (parent != null) {
                    parent.getReplies().add(comment);
                }
            }
        }

        return topLevel;
    }

    // Insert a new comment (works for both top-level and replies)
    public void addComment(CommentModel comment) throws SQLException {

        String query = "INSERT INTO comment (Post_ID, User_ID, Comment_Message, Parent_Comment_ID) "
                + "VALUES (?, ?, ?, ?)";

        try (
            Connection con = DBConfig.getConnection();
            PreparedStatement ps = con.prepareStatement(query)
        ) {
            ps.setInt(1, comment.getPostId());
            ps.setInt(2, comment.getUserId());
            ps.setString(3, comment.getCommentMessage());

            // if null it's a top-level comment, otherwise it's a reply
            if (comment.getParentCommentId() == null) {
                ps.setNull(4, java.sql.Types.INTEGER);
            } else {
                ps.setInt(4, comment.getParentCommentId());
            }

            ps.executeUpdate();
        }
    }
}
