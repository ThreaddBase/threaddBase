package com.service;

import java.sql.SQLException;
import java.util.List;

import com.DAO.CommunityManagementDAO;
import com.model.CommunityModel;

public class CommunityManagementService {
	
	public CommunityManagementDAO communityDAO = new CommunityManagementDAO();
	
	// get all community list
	public List<CommunityModel> getAllCommunity() throws SQLException {
		return communityDAO.getAllCommunity();
	}
	
    // create without request ID
    public String createCommunity(int createdBy, CommunityModel community) throws SQLException {
 
        String error = validateCreatedBy(createdBy);
        if (error != null) return error;
 
        error = validateCommunity(community);
        if (error != null) return error;
 
        boolean success = communityDAO.createCommunity(createdBy, community);
        return success ? null : "Failed to create community. Please try again.";
    }
    
    
    
    // update community
    public String updateCommunity(CommunityModel community) throws SQLException {
    	String error = validateCommunity(community);
    	if (error != null) return error;
    	
    	boolean success = communityDAO.updateCommunity(community);
    	return success ? null : "Failed to update community";
    }
    
    
    // delete community method
    public boolean deleteCommunity(int communityId) throws SQLException {
    	return communityDAO.deleteCommunity(communityId);
    }
    
    
 // validation and create with requestID
    public String createCommunityWithRequestID(int createdBy, CommunityModel community) throws SQLException {
    	 
        String error = validateCreatedBy(createdBy);
        if (error != null) return error;
 
        error = validateCommunity(community);
        if (error != null) return error;
 
        if (community.getRequestID() <= 0) {
            return "Invalid community request selected.";
        }
 
        boolean success = communityDAO.createCommunityWithRequestID(createdBy, community);
        return success ? null : "Failed to create community. Please try again.";
    }
	
	
	// validation code for new community fieldes
    public String validateCommunity(CommunityModel community) {
    	 
        // Name
        if (community.getName() == null || community.getName().trim().isEmpty()) {
            return "Community name is required.";
        }
        if (community.getName().trim().length() < 3) {
            return "Community name must be at least 3 characters.";
        }
        if (community.getName().trim().length() > 25) {
            return "Community name must not exceed 25 characters.";
        }
 
        // Description
        if (community.getDescription() == null || community.getDescription().trim().isEmpty()) {
            return "Community description is required.";
        }
        if (community.getDescription().trim().length() < 10) {
            return "Description must be at least 10 characters.";
        }
        if (community.getDescription().trim().length() > 255) {
            return "Description must not exceed 255 characters.";
        }
 
        // Profile picture — optional but size-checked if present
        if (community.getCommunityProfile() != null && community.getCommunityProfile().length > 0) {
            int maxSizeBytes = 5 * 1024 * 1024; // 5MB
            if (community.getCommunityProfile().length > maxSizeBytes) {
                return "Profile picture must not exceed 5MB.";
            }
        }
 
        return null;
    }
 
    // validate createdBy
    public String validateCreatedBy(int createdBy) {
        if (createdBy <= 0) {
            return "Invalid user. Please log in again.";
        }
        return null;
    }
}
