package com.service;

import java.sql.SQLException;
import java.util.List;

import com.DAO.TagDAO;
import com.model.TagModel;

public class TagService {
	
	public TagDAO tagDAO = new TagDAO();
	
	// method to get tag from community
	public List<TagModel> getCommunityByID(int communityID) throws SQLException {
		
		return tagDAO.getCommunityPostTag(communityID);
		
	}
	
	// method to get tag from Post
    public List<String> getTagsByPost(int postId) throws SQLException {
        return tagDAO.getTagByPost(postId);
    }
}