package com.service;
import java.sql.SQLException;
import com.DAO.CommentVoteDAO;

public class CommentVoteService {

    public CommentVoteDAO commentVoteDAO = new CommentVoteDAO();

    // Toggle comment vote
    public boolean toggleVote(int commentId, int userId) throws SQLException {
        if (commentVoteDAO.hasVoted(commentId, userId)) {
            commentVoteDAO.deleteVote(commentId, userId);
            return false; // vote removed
        } else {
            commentVoteDAO.insertVote(commentId, userId);
            return true;  // vote added
        }
    }
}