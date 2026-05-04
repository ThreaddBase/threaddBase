package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import java.util.Date;
import com.model.UserModel;
import com.util.DBConfig;

public class UserDAO {
	
	public ArrayList<UserModel> getUser() throws Exception {

        String sql = "SELECT User_ID, User_First_Name, User_Last_Name, User_DOB, Username, User_Email, Created_At  FROM user";
        
        Connection conn = DBConfig.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        
        ArrayList<UserModel> userList = new ArrayList<>();
        
        ResultSet resultSet = ps.executeQuery();
        while(resultSet.next()) {
        	int id = resultSet.getInt("User_ID");
        	String fname = resultSet.getString("User_First_Name");
        	String lname = resultSet.getString("User_Last_Name");
        	String DOB = resultSet.getString("User_DOB");
        	String username = resultSet.getString("username");
        	String email = resultSet.getString("User_Email");
        	String bio = resultSet.getString("User_Bio");
        	String role = resultSet.getString("user_Role");
        	String createdAt = resultSet.getString("Created_AT");
        	
        }
        return userList;
    }
}