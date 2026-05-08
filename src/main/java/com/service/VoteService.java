package com.service;

import java.sql.SQLException;

import com.DAO.VoteDAO;

public class VoteService {
	
	public VoteDAO voteDAO = new VoteDAO();
	
    // Toggle vote
    public boolean toggleVote(int postId, int userId) throws SQLException {
        if (voteDAO.hasVoted(postId, userId)) {
        		voteDAO.deleteVote(postId, userId);
        		return false; // voted removed
        } else {
        	voteDAO.insertVote(postId, userId);
            return true;  // vote added
        }
    }
}
