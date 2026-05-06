package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
}
