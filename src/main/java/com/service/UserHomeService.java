package com.service;

import java.sql.SQLException;
import java.util.List;

import com.DAO.UserHomeDAO;
import com.model.CommunityModel;
import com.model.PostModel;
import com.model.TagModel;

public class UserHomeService {
	
	UserHomeDAO userHomeDAO = new UserHomeDAO();
	
	public List<TagModel> getTag() throws SQLException {
			return userHomeDAO.getTag();
	}
	
	public List<PostModel> getAllPost() throws SQLException {
		return userHomeDAO.getAllPost();
	}
	
	public List<CommunityModel> getTopCommunitiesNotJoined(int userId) {
		return userHomeDAO.getTopCommunitiesNotJoined(userId);
	}
	
	public List<PostModel> filterPostByTag(int tagId) throws SQLException {
		return userHomeDAO.filterPostByTag(tagId);
	}
}
