package com.service;

import java.sql.SQLException;
import java.util.List;

import com.DAO.CommentDAO;
import com.model.CommentModel;

public class CommentService {

    private final CommentDAO commentDAO;

    public CommentService() {
        this.commentDAO = new CommentDAO();
    }

    // GET — returns null on success, error string on failure
    public List<CommentModel> getCommentsByPostId(int postId, int userId) throws SQLException {
        if (postId <= 0) {
            return null;
        }
        return commentDAO.getCommentsByPostId(postId, userId);
    }

    // POST — returns null on success, error string on failure
    public String addComment(int postId, int userId, String message, Integer parentCommentId)throws SQLException {

        // validation checks — return error string immediately if anything fails
        if (postId <= 0) {
            return "Invalid post.";
        }
        if (userId <= 0) {
            return "You must be logged in to comment.";
        }
        if (message == null || message.trim().isEmpty()) {
            return "Comment cannot be empty.";
        }
        if (message.trim().length() > 255) {
            return "Comment is too long (max 255 characters).";
        }

        try {
            CommentModel comment = new CommentModel();
            comment.setPostId(postId);
            comment.setUserId(userId);
            comment.setCommentMessage(message.trim());
            comment.setParentCommentId(parentCommentId);

            commentDAO.addComment(comment);
            return null; // null = success

        } catch (SQLException e) {
            e.printStackTrace();
            return "Something went wrong, please try again.";
        }
    }
}