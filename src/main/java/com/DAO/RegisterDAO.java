package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import com.util.DBConfig;


public class RegisterDAO {
	public void registerUser(String firstName, String lastName, String dob, String username, String email, String password)
	throws Exception {

		Connection con = DBConfig.getConnection();
		
		String sql = "INSERT INTO user (User_First_Name, User_Last_Name, User_DOB, Username, User_Email, Password) "
		           + "VALUES (?, ?, ?, ?, ?, ?)";
		
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1, firstName);
		pst.setString(2, lastName);
		pst.setString(3, dob);
		pst.setString(4, username);
		pst.setString(5, email);
		pst.setString(6, password);
		
		pst.executeUpdate();
		pst.close();
		con.close();
	}
}
