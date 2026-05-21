package com.service;

import java.sql.SQLException;
import java.util.List;

import com.DAO.PostDAO;
import com.model.PostModel;

public class PostService {
	
	PostDAO postDAO = new PostDAO();
	
	public List<PostModel> getPostByCommunity(int communityId) 
	        throws SQLException {
	    return postDAO.getPostByCommunity(communityId);
	}
	
	public List<PostModel> getPostByUserId(int userId) throws SQLException {
		return postDAO.getPostByUserId(userId);
	}
	
	public PostModel getPostById(int postId) throws SQLException {
		return postDAO.getPostById(postId);
	}
	
	public List<PostModel> getPostFromSearch(String msg) throws SQLException {
	    
	    if (msg == null) {
	        throw new IllegalArgumentException("Search keyword cannot be null.");
	    }

	    msg = msg.trim();

	    if (msg.isEmpty()) {
	        throw new IllegalArgumentException("Search keyword cannot be empty.");
	    }
	    
	    if (msg.length() > 255) {
	        throw new IllegalArgumentException("Search keyword cannot exceed 255 characters.");
	    }

	    return postDAO.getPostFromSearch(msg);
	}
}