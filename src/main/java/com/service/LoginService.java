package com.service;

import org.mindrot.jbcrypt.BCrypt;

import com.DAO.LoginDAO;
import com.model.LoginModel;

public class LoginService {
	
	private LoginDAO loginDAO = new LoginDAO();

    public LoginModel authenticate(String username, String password) throws Exception {

        if (username == null || username.trim().isEmpty()) return null;
        if (password == null || password.trim().isEmpty()) return null;

        LoginModel user = loginDAO.getUser(username.trim());
        if (user == null) return null;

        return BCrypt.checkpw(password, user.getPassword()) ? user : null;
    }
}
