package com.service;

import java.sql.SQLException;

import com.DAO.CommunityDAO;
import com.model.CommunityModel;

public class CommunityService {
	
	public CommunityDAO communityDAO = new CommunityDAO();
	
	public CommunityModel getCommunityByID(int communityID) throws SQLException {
		return communityDAO.getCommunityByID(communityID);
	}
}
