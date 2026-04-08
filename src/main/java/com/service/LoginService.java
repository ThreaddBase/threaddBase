package com.service;

import org.mindrot.jbcrypt.BCrypt;

import com.DAO.LoginDAO;
import com.model.LoginModel;

public class LoginService {
	
	private LoginDAO loginDAO = new LoginDAO();

    public boolean authenticate(String username, String password) throws Exception {

        if (username == null || username.trim().isEmpty()) {
            return false;
        }
        if (password == null || password.trim().isEmpty()) {
            return false;
        }

        LoginModel user = loginDAO.getUser(username.trim());

        if (user == null) {
            return false;
        }

        boolean passwordMatches = BCrypt.checkpw(password, user.getPassword());
        return passwordMatches;
    }
}
