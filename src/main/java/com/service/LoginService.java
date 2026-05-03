package com.service;

import org.mindrot.jbcrypt.BCrypt;

import com.DAO.LoginDAO;
import com.model.LoginModel;

public class LoginService {
	
	private LoginDAO loginDAO = new LoginDAO();

    public String authenticate(String username, String password) throws Exception {
    	
    	// validation
        if (username == null || username.trim().isEmpty()) {
        	return null;
        }
        
        if (password == null || password.trim().isEmpty()) {
        	return null;
        }

        LoginModel user = loginDAO.getUser(username.trim());
        
        if (user == null) {
        	return null;
        }

        boolean passwordMatches = BCrypt.checkpw(password, user.getPassword());
        return passwordMatches ? user.getUserRole() : null;
    }
}
