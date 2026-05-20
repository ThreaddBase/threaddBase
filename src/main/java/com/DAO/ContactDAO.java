package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.model.ContactModel;
import com.util.DBConfig;

public class ContactDAO {
	
	public void insertContact(ContactModel contact) throws SQLException {
		
		String query = "INSERT INTO contact "
	             + "(first_name, last_name, email, phone_number, message) "
	             + "VALUES (?, ?, ?, ?, ?)";
		
		try (
				Connection con = DBConfig.getConnection();
				PreparedStatement ps = con.prepareStatement(query);
			) {
			
			ps.setString(1, contact.getFirstName());
			ps.setString(2, contact.getLastName());
			ps.setString(3, contact.getEmail());
			ps.setString(4, contact.getPhoneNumber());
			ps.setString(5, contact.getDescription());
			
			ps.executeUpdate();
		}
	}
}
