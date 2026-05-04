package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.CommunityModel;
import com.util.DBConfig;

public class DashboardDAO {
	
	// method to get total number of Member form database
	public int getTotalUser() throws SQLException {
		
		String query = "Select COUNT(*) FROM user WHERE user_Role = 'Member'";
		try (
				Connection con = DBConfig.getConnection(); // establish connection
        		PreparedStatement ps = con.prepareStatement(query); // prepare query
        		ResultSet rs = ps.executeQuery(); // store result in rs as resultSet
			) {
				if(rs.next()) {
					return rs.getInt(1);
				}
		}
		return 0;
	}
	
	
	// method to get total number of Community form database
	public int getTotalCommunity() throws SQLException {
		String query = "SELECT Count(*) from community";
		try (
				Connection con =  DBConfig.getConnection();
				PreparedStatement ps = con.prepareStatement(query);
				ResultSet rs = ps.executeQuery();
			) {
			if(rs.next()) {
				return rs.getInt(1);
			}
			return 0;
		}
	}
	
	// method to get top 4 communities
	public List<CommunityModel> getTopCommunity() throws SQLException {
		
		// sql query that gets top 4 community based on user count
		String query = "Select c.Community_ID, c.Community_Name, Count(j.Joined_Members) as user_count "
				+ "FROM community c LEFT JOIN user_community j ON c.Community_ID = j.Community_ID "
				+ "Group by c.community_ID, c.Community_Name "
				+ "Order by user_count DESC "
				+ "LIMIT 4";
        
        List<CommunityModel> communityList = new ArrayList<>();
        
        try (
        		Connection con = DBConfig.getConnection();
        		PreparedStatement ps = con.prepareStatement(query);
        		ResultSet rs = ps.executeQuery();
        	) {
        	
        	while(rs.next()) {
        		CommunityModel community = new CommunityModel();
        		community.setId(rs.getInt("Community_ID"));
        		community.setName(rs.getString("Community_Name"));
        		community.setUserCount(rs.getInt("user_count"));
        		
        		communityList.add(community);
        	}
        	return communityList;
        }
	}
	
	// method to get all communities
	public List<CommunityModel> getAllCommunity() throws SQLException {
		String query = "Select c.Community_ID, c.Community_Name, Count(j.Joined_Members) as user_count"
				+ " FROM community c LEFT JOIN "
				+ "user_community j ON c.Community_ID = j.Community_ID"
				+ " Group by c.community_ID, c.Community_Name";

		
		List<CommunityModel> communityList = new ArrayList<>();
		
		try(
				Connection con = DBConfig.getConnection();
				PreparedStatement ps = con.prepareStatement(query);
				ResultSet rs = ps.executeQuery();
			) {
			
			while(rs.next()) {
				CommunityModel community = new CommunityModel();
        		community.setId(rs.getInt("Community_ID"));
        		community.setName(rs.getString("Community_Name"));
        		community.setUserCount(rs.getInt("user_count"));
        		
        		communityList.add(community);
			}
			return communityList;
		}
	}
}
