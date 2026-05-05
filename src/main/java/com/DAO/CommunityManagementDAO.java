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
}
