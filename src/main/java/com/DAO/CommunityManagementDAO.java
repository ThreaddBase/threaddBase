package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.CommunityModel;
import com.util.DBConfig;

public class CommunityManagementDAO {
	
	// get all the community
	public List<CommunityModel> getAllCommunity() throws SQLException {
		
		String query = "Select Community_ID, Community_Name, Community_Profile_Picture, Community_Description, Created_At from community";
		
		try (
				Connection con = DBConfig.getConnection();
				PreparedStatement ps = con.prepareStatement(query);
				ResultSet rs = ps.executeQuery();
			){
			
			List<CommunityModel> communityList = new ArrayList<>();
			
			while (rs.next()) {
				
				CommunityModel community = new CommunityModel();
				community.setId(rs.getInt("Community_ID"));
				community.setName(rs.getString("Community_Name"));
				community.setCommunityProfile(rs.getBytes("Community_Profile_Picture"));
				community.setDescription(rs.getString("Community_Description"));
				community.setCreatedAt(rs.getDate("Created_At"));
				
				communityList.add(community);
			}
			return communityList;
		}
	}
	
	// create community without request ID
	public boolean createCommunity(int createdBy, CommunityModel community) throws SQLException {

	    String query = "INSERT INTO Community "
	            + "(Created_By, Community_Name, Community_Profile_Picture, Community_Description, Created_At) "
	            + "VALUES (?, ?, ?, ?, CURDATE())";

	    try (
	            Connection con = DBConfig.getConnection();
	            PreparedStatement ps = con.prepareStatement(query);
	        ) {

	        ps.setInt(1, createdBy);
	        ps.setString(2, community.getName());

	        if (community.getCommunityProfile() != null && community.getCommunityProfile().length > 0) {
	            ps.setBytes(3, community.getCommunityProfile());
	        } else {
	            ps.setNull(3, java.sql.Types.BLOB);
	        }

	        ps.setString(4, community.getDescription());

	        return ps.executeUpdate() > 0;
	    }
	}
	
	// create a new Community with requestID
	public boolean createCommunityWithRequestID(int createdBy ,CommunityModel community) throws SQLException {
		
		String query = "INSERT INTO Community "
				+ "(Created_By, Community_Request_ID, Community_Name, Community_Profile_Picture, Community_Description, Created_At) "
				+ "VALUES (?, ?, ?, ?, ?, CURDATE())";
		
		try (
				Connection con = DBConfig.getConnection();
				PreparedStatement ps = con.prepareStatement(query);
			) {
				
	        ps.setInt(1, createdBy);
	        ps.setInt(2, community.getRequestID());
	        ps.setString(3, community.getName());
	        
			// save image bytes to BLOB
	        if (community.getCommunityProfile() != null && community.getCommunityProfile().length > 0) {
	            ps.setBytes(4, community.getCommunityProfile());  //  bytes go into MEDIUMBLOB
	        } else {
	            ps.setNull(4, java.sql.Types.BLOB); //  null if no image
	        }
	        
	        ps.setString(5, community.getDescription());

	        return ps.executeUpdate() > 0;
			
		}
	}
	
	// delete community
	public boolean deleteCommunity(int communityId) throws SQLException {
		
		String query = "DELETE FROM Community WHERE community_ID = ?"; 
		
		try (
				Connection con = DBConfig.getConnection();
				PreparedStatement ps = con.prepareStatement(query);
			) {
			
			ps.setInt(1, communityId);
			return ps.executeUpdate() > 0;
		}
	}
	
	public boolean updateCommunity(CommunityModel community) throws SQLException {

	    try (Connection con = DBConfig.getConnection()) {

	        if (community.getCommunityProfile() != null && community.getCommunityProfile().length > 0) {
	            // Update everything including image
	            String query = "UPDATE Community "
	                    + "SET Community_Name = ?, "
	                    + "    Community_Description = ?, "
	                    + "    Community_Profile_Picture = ? "
	                    + "WHERE Community_ID = ?";

	            try (PreparedStatement ps = con.prepareStatement(query)) {
	                ps.setString(1, community.getName());
	                ps.setString(2, community.getDescription());
	                ps.setBytes(3, community.getCommunityProfile());
	                ps.setInt(4, community.getId());
	                return ps.executeUpdate() > 0;
	            }

	        } else {
	            // No new image — preserve existing picture
	            String query = "UPDATE Community "
	                    + "SET Community_Name = ?, "
	                    + "    Community_Description = ? "
	                    + "WHERE Community_ID = ?";

	            try (PreparedStatement ps = con.prepareStatement(query)) {
	                ps.setString(1, community.getName());
	                ps.setString(2, community.getDescription());
	                ps.setInt(3, community.getId());
	                return ps.executeUpdate() > 0;
	            }
	        }
	    }
	}
}
