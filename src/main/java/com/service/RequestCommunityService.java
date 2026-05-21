package com.service;

import java.sql.SQLException;
import java.util.List;

import com.DAO.RequestCommunityDAO;
import com.model.RequestCommunityModel;

public class RequestCommunityService {
	
	RequestCommunityDAO requestDAO = new RequestCommunityDAO();
	
	public String validateRequest(RequestCommunityModel requestCommunity) throws SQLException {

	    if (requestCommunity.getCommunityName() == null || requestCommunity.getCommunityName().trim().isEmpty()) {
	        return "Community name cannot be empty.";
	    }

	    if (requestCommunity.getCommunityName().trim().length() < 3) {
	        return "Community name must be at least 3 characters.";
	    }

	    if (requestCommunity.getCommunityName().trim().length() > 50) {
	        return "Community name cannot exceed 50 characters.";
	    }

	    if (requestCommunity.getCommunityDescription() == null || requestCommunity.getCommunityDescription().trim().isEmpty()) {
	        return "Community description cannot be empty.";
	    }

	    if (requestCommunity.getCommunityDescription().trim().length() < 10) {
	        return "Description must be at least 10 characters.";
	    }

	    if (requestCommunity.getCommunityDescription().trim().length() > 255) {
	        return "Description cannot exceed 255 characters.";
	    }

	    requestDAO.insertRequest(requestCommunity);
	    return null;
	}
	
	public List<RequestCommunityModel> getTopRequestedCommunityNames() throws SQLException {
		return requestDAO.getTopRequestedCommunityNames();
	}
}
