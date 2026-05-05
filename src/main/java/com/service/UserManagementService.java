package com.service;

import java.sql.SQLException;
import java.util.List;

import com.DAO.UserManagementDAO;
import com.model.UserModel;

public class UserManagementService {
	
	public UserManagementDAO userDAO = new UserManagementDAO();
	
	// method that calls userDAO method getAllUsers
	public List<UserModel> getAllUsers() throws SQLException {
		return userDAO.getAllUsers();
	}
}
