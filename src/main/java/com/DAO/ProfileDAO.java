package com.DAO;


import com.model.UserModel;
import com.util.DBConfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProfileDAO {
	
	public UserModel  getUserById(int id) throws Exception {

        String sql = "SELECT User_ID, User_First_Name, User_Last_Name, User_DOB, Username, User_Bio, User_email, user_Role, User_Profile_Picture, Created_At, Password, user_Status FROM user WHERE User_ID = ?";
        
        try (Connection conn = DBConfig.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql)) {;
        
        ps.setInt(1, id);
        
        ResultSet resultSet = ps.executeQuery();
        
        if(resultSet.next()) {
        	UserModel user = new UserModel();
        	 user.setId(resultSet.getInt("User_ID"));
             user.setFirstName(resultSet.getString("User_First_Name"));
             user.setLastName(resultSet.getString("User_Last_Name"));
             user.setDob(resultSet.getString("User_DOB"));
             user.setUsername(resultSet.getString("Username"));
             user.setBio(resultSet.getString("User_Bio"));
             user.setEmail(resultSet.getString("User_Email"));
             user.setStatus(resultSet.getString("user_Status"));
             user.setRole(resultSet.getString("user_Role"));
             user.setCreated_At(resultSet.getString("Created_At"));
             user.setProfilePicture(resultSet.getBytes("User_Profile_Picture"));
             user.setPassword(resultSet.getString("Password"));
             return user;
        	
        }
        
        }
        return null;
	}
        

    // UPDATE profile info
	public boolean updateProfile(int id, String firstName, String lastName,
            String username,
            String dob, String bio) throws SQLException {
			
			String sql = "UPDATE user SET User_First_Name=?, User_Last_Name=?, " +
			"Username=?, User_DOB=?, User_Bio=? " +
			"WHERE User_ID=?";
			
			try (Connection con = DBConfig.getConnection();
			PreparedStatement ps = con.prepareStatement(sql)) {
			
			ps.setString(1, firstName);
			ps.setString(2, lastName);
			ps.setString(3, username);
			ps.setString(4, dob);
			ps.setString(5, bio);
			ps.setInt(6, id);
			
			int rows = ps.executeUpdate();
			
			System.out.println("Rows Updated = " + rows);
			
			return rows > 0;
			}
		}

    // ── UPDATE profile picture ────────────────────────────
    public boolean updateProfilePicture(int id, byte[] picture) throws SQLException {

        String sql = "UPDATE user SET User_Profile_Picture=? WHERE User_ID=?";

        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setBytes(1, picture);
            ps.setInt(2, id);
            return ps.executeUpdate() > 0;
        }
    }

    // ── UPDATE password ───────────────────────────────────
    public boolean updatePassword(int id, String newHashedPassword) throws SQLException {

    	String sql = "UPDATE user SET Password=? WHERE User_ID=?";

        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, newHashedPassword);
            ps.setInt(2, id);

            int rows = ps.executeUpdate();

            System.out.println("Password rows updated = " + rows);

            return rows > 0;
        }
    }
    
    public boolean verifyPassword(int id, String hashedPassword) throws SQLException {

        String sql = "SELECT COUNT(*) FROM user WHERE User_ID=? AND Password=?";

        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.setString(2, hashedPassword);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        }

        return false;
    }
    
    

}