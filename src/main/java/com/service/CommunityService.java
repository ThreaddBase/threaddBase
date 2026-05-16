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
	
	public List<CommunityModel> getJoinedComunity(int userId) throws SQLException {
		return communityDAO.getJoinedComunity(userId);
	}
	
	public List<CommunityModel> getAllCommunity(int userId) throws SQLException {
		return communityDAO.getAllCommunity(userId);
	}
	
	public boolean joinCommunity(int userId, int communityId) throws SQLException {
		return communityDAO.joinCommunity(userId, communityId);
	}

	public boolean leaveCommunity(int userId, int communityId) throws SQLException{
		return communityDAO.leaveCommunity(userId, communityId);
	}
}
