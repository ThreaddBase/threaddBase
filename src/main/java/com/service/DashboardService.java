package com.service;

import java.sql.SQLException;
import java.util.List;

import com.DAO.DashboardDAO;
import com.DAO.RequestCommunityDAO;
import com.model.CommunityModel;
import com.model.RequestCommunityModel;

public class DashboardService {
	// call DashboardDAO
	DashboardDAO dashboardDAO = new DashboardDAO();
	RequestCommunityDAO requestCommunityDAO = new RequestCommunityDAO();
	
	public int getTotalUser() throws SQLException {
		return dashboardDAO.getTotalUser();
	}
	
	public int getTotalCommunities() throws SQLException {
		return dashboardDAO.getTotalCommunity();
	}
	
	public List<CommunityModel> getTopCommunities() throws SQLException {
		return dashboardDAO.getTopCommunity();
	}
	
	public List<CommunityModel> getAllCommunities() throws SQLException {
		return dashboardDAO.getAllCommunity();
	}
    
    public List<RequestCommunityModel> getTopRequestedCommunityNames() throws SQLException {
        return requestCommunityDAO.getTopRequestedCommunityNames();
    }
}
