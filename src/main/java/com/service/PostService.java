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
}