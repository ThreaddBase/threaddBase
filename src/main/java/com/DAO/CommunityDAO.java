package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.CommunityModel;
import com.util.DBConfig;

public class CommunityDAO {
	
	// method to get community object by ID
	public CommunityModel getCommunityByID(int communityID) throws SQLException {
		
		String query = "SELECT c.Community_ID, c.Community_Name, "
                + "c.Community_Description, c.Community_Profile_Picture, "
                + "c.Created_At, COUNT(uc.Joined_Members) AS member_count "
                + "FROM community c "
                + "LEFT JOIN user_community uc "
                + "ON c.Community_ID = uc.Community_ID "
                + "WHERE c.Community_ID = ? "
                + "GROUP BY c.Community_ID";
		
		try (
				Connection con = DBConfig.getConnection();
				PreparedStatement ps = con.prepareStatement(query);
				
			){
				ps.setInt(1, communityID); // community id sent by jsp through URL (Guess)
				
				try(ResultSet rs = ps.executeQuery()) {
					
					if (rs.next()) {
						
						CommunityModel community = new CommunityModel();
						community.setId(rs.getInt("Community_ID"));
						community.setName(rs.getString("Community_Name"));
						community.setDescription(rs.getString("Community_Description"));
						community.setCreatedAt(rs.getDate("Created_At"));
						community.setUserCount(rs.getInt("member_count"));
						community.setCommunityProfile(rs.getBytes("Community_Profile_Picture"));
						
						return community;
				}
			}	
		}
		return null; // returns null if communityID is not found
	}
	
	// method to get all community 
	public List<CommunityModel> getAllCommunity(int userId) throws SQLException {
	    
	    String query = "SELECT c.Community_ID, c.Community_Name, c.Community_Description, c.Community_Profile_Picture, c.Created_At, "
	            + "COUNT(uc.Joined_Members) AS Member_Count, "
	            + "(SELECT COUNT(*) FROM User_Community WHERE Community_ID = c.Community_ID AND Joined_Members = ?) AS is_joined "
	            + "FROM Community c "
	            + "LEFT JOIN User_Community uc "
	            + "ON c.Community_ID = uc.Community_ID "
	            + "GROUP BY c.Community_ID, c.Community_Name, c.Community_Description, c.Community_Profile_Picture, c.Created_At";
	    
	    try (
	            Connection con = DBConfig.getConnection();
	            PreparedStatement ps = con.prepareStatement(query);
	        ){
	            ps.setInt(1, userId);
	            
	            List<CommunityModel> communityList = new ArrayList<>();
	            try(ResultSet rs = ps.executeQuery()) {
	                while (rs.next()) {
	                    
	                    CommunityModel community = new CommunityModel();
	                    community.setId(rs.getInt("Community_ID"));
	                    community.setName(rs.getString("Community_Name"));
	                    community.setDescription(rs.getString("Community_Description"));
	                    community.setCreatedAt(rs.getDate("Created_At"));
	                    community.setUserCount(rs.getInt("Member_Count"));
	                    community.setCommunityProfile(rs.getBytes("Community_Profile_Picture"));
	                    community.setIsJoined(rs.getInt("is_joined") > 0);
	                    
	                    communityList.add(community);
	                }
	            }
	            return communityList;
	    }
	}
	
	// method to get all community user Joined
	public List<CommunityModel> getJoinedComunity(int userId) throws SQLException {
		
		String query = "SELECT c.Community_ID, c.Community_Name, c.Community_Description, c.Community_Profile_Picture, c.Created_At, "
				+ "    COUNT(uc.Joined_Members) AS Member_Count FROM Community c "
				+ "LEFT JOIN User_Community uc "
				+ "    ON c.Community_ID = uc.Community_ID "
				+ "WHERE c.Community_ID IN ( "
				+ "    SELECT Community_ID "
				+ "    FROM User_Community "
				+ "    WHERE Joined_Members = ? "
				+ ") "
				+ "GROUP BY c.Community_ID, c.Community_Name, c.Community_Description, c.Community_Profile_Picture, c.Created_At";
		
		try (
				Connection con = DBConfig.getConnection();
				PreparedStatement ps = con.prepareStatement(query);
				
			){
				ps.setInt(1, userId);
				List<CommunityModel> communityList = new ArrayList<>();
				try(ResultSet rs = ps.executeQuery()) {
					while (rs.next()) {
						
						CommunityModel community = new CommunityModel();
						community.setId(rs.getInt("Community_ID"));
						community.setName(rs.getString("Community_Name"));
						community.setDescription(rs.getString("Community_Description"));
						community.setCreatedAt(rs.getDate("Created_At"));
						community.setUserCount(rs.getInt("member_count"));
						community.setCommunityProfile(rs.getBytes("Community_Profile_Picture"));
						community.setIsJoined(true);
						
						communityList.add(community);
				}
			}	
			return communityList;
		}
	}
	
	// method to get community which user not joined
	public List<CommunityModel> getCommunityNotJoined(int userId) throws SQLException {
		
		String query = "SELECT c.Community_ID, c.Community_Name, c.Community_Description, c.Community_Profile_Picture, c.Created_At, "
				+ "    COUNT(uc.Joined_Members) AS Member_Count FROM Community c "
				+ "LEFT JOIN User_Community uc "
				+ "    ON c.Community_ID = uc.Community_ID "
				+ "WHERE c.Community_ID NOT IN ( "
				+ "    SELECT Community_ID "
				+ "    FROM User_Community "
				+ "    WHERE Joined_Members = ? "
				+ ") "
				+ "GROUP BY c.Community_ID, c.Community_Name, c.Community_Description, c.Community_Profile_Picture, c.Created_At";
		
		try (
				Connection con = DBConfig.getConnection();
				PreparedStatement ps = con.prepareStatement(query);
				
			){
				ps.setInt(1, userId);
				
				List<CommunityModel> communityList = new ArrayList<>();
				try(ResultSet rs = ps.executeQuery()) {
					while (rs.next()) {
						
						CommunityModel community = new CommunityModel();
						community.setId(rs.getInt("Community_ID"));
						community.setName(rs.getString("Community_Name"));
						community.setDescription(rs.getString("Community_Description"));
						community.setCreatedAt(rs.getDate("Created_At"));
						community.setUserCount(rs.getInt("member_count"));
						community.setCommunityProfile(rs.getBytes("Community_Profile_Picture"));
						community.setIsJoined(false);
						communityList.add(community);
				}
			}	
			return communityList;
		}
	}
	
	// method to join community
	public boolean joinCommunity(int userId, int communityId) throws SQLException {
		
		String query = "Insert into user_community values(?, ?)";
		
		try (
				Connection con = DBConfig.getConnection();
				PreparedStatement ps = con.prepareStatement(query);
			) {
			
			ps.setInt(1, communityId);
			ps.setInt(2, userId);
			
			return ps.executeUpdate() > 0;
			
		}
	}

	public boolean leaveCommunity(int userId, int communityId) throws SQLException {
		String query = "Delete from user_community where Joined_Members = ? and Community_ID = ?";
				
		try (
				Connection con = DBConfig.getConnection();
				PreparedStatement ps = con.prepareStatement(query);
			) {
			
			ps.setInt(1, userId);
			ps.setInt(2, communityId);
			
			return ps.executeUpdate() > 0;
			
		}
	}

	public boolean getJoinedCommunityById(int userId, int communityId) throws SQLException {
	    String query = "SELECT joined_Members, community_ID FROM user_community WHERE joined_Members = ? AND community_ID = ?";

	    try (
	        Connection con = DBConfig.getConnection();
	        PreparedStatement ps = con.prepareStatement(query);
	    ) {
	        ps.setInt(1, userId);
	        ps.setInt(2, communityId);

	        ResultSet rs = ps.executeQuery();
	        return rs.next();
	    }
	}
	
}
