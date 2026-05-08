package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.UserModel;
import com.util.DBConfig;

public class UserManagementDAO {
	
	// get userID by userName
	public int getUserIdByUsername(String username) throws SQLException {
	    String query = "SELECT user_ID FROM user WHERE Username = ?";
	    try (
	        Connection con = DBConfig.getConnection();
	        PreparedStatement ps = con.prepareStatement(query);
	    ) {
	        ps.setString(1, username);
	        try (ResultSet rs = ps.executeQuery()) {
	            if (rs.next()) {
	                return rs.getInt("user_ID");
	            }
	        }
	    }
	    return -1; // user not found
	}
	
	// mthod to get all user information and return a list containing obj of userModel
	public List<UserModel> getAllUsers() throws SQLException {
		
		String query = "SELECT u.user_ID, u.User_First_Name, u.User_Last_Name, " +
	               "u.User_Email, u.User_Profile_Picture, u.user_Status, " +
	               "COUNT(DISTINCT p.Post_ID) AS post_count, " +
	               "COUNT(DISTINCT c.Comment_ID) AS comment_count, " +
	               "COUNT(DISTINCT r.Report_ID) AS report_count " +
	               "FROM user u " +
	               "LEFT JOIN post p ON u.user_ID = p.User_ID " +
	               "LEFT JOIN comment c ON u.user_ID = c.User_ID " +
	               "LEFT JOIN user_report r ON u.user_ID = r.User_ID " +
	               "WHERE u.user_Role = 'Member' " +
	               "GROUP BY u.user_ID, u.User_First_Name, u.User_Last_Name, " +
	               "u.User_Email, u.User_Profile_Picture, u.user_Status";
		
		try (
				Connection con = DBConfig.getConnection();
				PreparedStatement ps = con.prepareStatement(query);
				ResultSet rs = ps.executeQuery();
			) {
			
			List<UserModel> userList = new ArrayList<>();
			
			while(rs.next()) {
				
                UserModel user = new UserModel();
                
                user.setId(rs.getInt("user_ID"));
                user.setFirstName(rs.getString("User_First_Name"));
                user.setLastName(rs.getString("User_Last_Name"));
                user.setEmail(rs.getString("User_Email"));
                user.setStatus(rs.getString("user_Status"));
                user.setPostCount(rs.getInt("post_count"));
                user.setCommentCount(rs.getInt("comment_count"));
                user.setReportCount(rs.getInt("report_count"));
                user.setProfilePicture(rs.getBytes("User_Profile_Picture"));
                
                userList.add(user);
			}
			return userList;
		}
		
	}
}
