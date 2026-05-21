package com.service;

import java.sql.SQLException;

import com.DAO.CommentVoteDAO;

public class CommentVoteService {
	
	private final CommentVoteDAO commentVoteDAO = new CommentVoteDAO();
	 
    /**
     * Upvote a comment if the user hasn't already voted.
     *
     * @param userId    the ID of the user voting
     * @param commentId the ID of the comment being voted on
     * @return true if upvote was successful, false if already voted
     */
    public boolean upvoteComment(int userId, int commentId) {
        try {
            return commentVoteDAO.upvoteComment(userId, commentId);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
 
    /**
     * Check if a user has already upvoted a specific comment.
     *
     * @param userId    the ID of the user
     * @param commentId the ID of the comment
     * @return true if the user has already voted, false otherwise
     */
    public boolean hasUserVoted(int userId, int commentId) {
        try {
            return commentVoteDAO.hasUserVoted(userId, commentId);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
 
    /**
     * Get total upvote count for a specific comment.
     *
     * @param commentId the ID of the comment
     * @return total number of upvotes, 0 on error
     */
    public int getUpvoteCount(int commentId) {
        try {
            return commentVoteDAO.getUpvoteCount(commentId);
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }
}
