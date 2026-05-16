package com.service;

import java.util.List;
import java.sql.SQLException;

import com.DAO.CommunityDAO;
import com.model.CommunityModel;

public class CommunityService {
	
	public CommunityDAO communityDAO = new CommunityDAO();
	
	public CommunityModel getCommunityByID(int communityID) throws SQLException {
		return communityDAO.getCommunityByID(communityID);
	}
	
	public List<CommunityModel> getCommunityNotJoined(int userId) throws SQLException {
		return communityDAO.getCommunityNotJoined(userId);
	}
	
	public boolean joinCommunity(int userID, int communityID) throws SQLException {
		return communityDAO.joinCommunity(userID, communityID);
	}
}
