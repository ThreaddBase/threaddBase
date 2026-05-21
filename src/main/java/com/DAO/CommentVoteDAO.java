package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.util.DBConfig;

public class CommentVoteDAO {

    /**
     * Insert a new upvote for a comment.
     *
     * @param userId    the ID of the user voting
     * @param commentId the ID of the comment being voted on
     * @return true if insert was successful, false otherwise
     */
    public boolean insertCommentVote(int userId, int commentId) throws SQLException {
        String query = "INSERT INTO Comment_Vote (Comment_ID, User_ID, vote_type) VALUES (?, ?, ?)";
        try (
            Connection con = DBConfig.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
        ) {
            ps.setInt(1, commentId);
            ps.setInt(2, userId);
            ps.setInt(3, 1); // hardcoded upvote
            return ps.executeUpdate() > 0;
        }
    }

    /**
     * Check if a user has already upvoted a specific comment.
     * Useful to prevent duplicate votes.
     *
     * @param userId    the ID of the user
     * @param commentId the ID of the comment
     * @return true if vote already exists, false otherwise
     */
    public boolean hasUserVoted(int userId, int commentId) throws SQLException {
        String query = "SELECT Comment_Vote_ID FROM Comment_Vote WHERE User_ID = ? AND Comment_ID = ?";
        try (
            Connection con = DBConfig.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
        ) {
            ps.setInt(1, userId);
            ps.setInt(2, commentId);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next(); // true if vote exists
            }
        }
    }

    /**
     * Insert upvote only if user hasn't already voted.
     * This is the recommended method to call from your service/controller.
     *
     * @param userId    the ID of the user voting
     * @param commentId the ID of the comment being voted on
     * @return true if vote was inserted, false if already voted or error
     */
    public boolean upvoteComment(int userId, int commentId) throws SQLException {
        if (hasUserVoted(userId, commentId)) {
            return false;
        }
        return insertCommentVote(userId, commentId);
    }

    /**
     * Get total upvote count for a specific comment.
     *
     * @param commentId the ID of the comment
     * @return total number of upvotes
     */
    public int getUpvoteCount(int commentId) throws SQLException {
        String query = "SELECT COUNT(*) FROM Comment_Vote WHERE Comment_ID = ? AND vote_type = 1";
        try (
            Connection con = DBConfig.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
        ) {
            ps.setInt(1, commentId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
                return 0;
            }
        }
    }
}