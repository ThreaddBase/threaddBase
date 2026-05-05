 package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import com.util.DBConfig;


public class RegisterDAO {
	public void registerUser(String firstName, String lastName, String dob, String username, String email, String password, byte[] profilePic)
	throws Exception {
		System.out.println("Reached register dao");
		Connection con = DBConfig.getConnection();
		
		String sql = "INSERT INTO user (User_First_Name, User_Last_Name, User_DOB, Username, User_Email, Password, User_Profile_Picture)"
		           + "VALUES (?, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1, firstName);
		pst.setString(2, lastName);
		pst.setString(3, dob);
		pst.setString(4, username);
		pst.setString(5, email);
		pst.setString(6, password);
		
		// ─── save image bytes to BLOB ──────────────────
        if (profilePic != null && profilePic.length > 0) {
            pst.setBytes(7, profilePic);  //  bytes go into MEDIUMBLOB
        } else {
            pst.setNull(7, java.sql.Types.BLOB); //  null if no image
        }
		
		pst.executeUpdate();
		System.out.println("register data added to database");
		pst.close();
		con.close();
	}
}
