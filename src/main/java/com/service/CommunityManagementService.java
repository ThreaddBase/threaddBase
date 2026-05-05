package com.service;

import java.sql.SQLException;
import java.util.List;

import com.DAO.CommunityManagementDAO;
import com.model.CommunityModel;

public class CommunityManagementService {
	
	public CommunityManagementDAO communityDAO = new CommunityManagementDAO();
	
	public List<CommunityModel> getAllCommunity() throws SQLException {
		return communityDAO.getAllCommunity();
	}
}
