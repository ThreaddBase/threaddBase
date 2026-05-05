package com.service;

import com.DAO.RegisterDAO;
import com.util.PasswordUtil;

public class RegisterService {
	public void registerUser(String firstName, String lastName, String dob, String username,
            String email, String password, byte[] profilePic) throws Exception {

		System.out.println("--- register service ---");

        // Hash the password
        String hashedPassword = PasswordUtil.getHashPassword(password);

        RegisterDAO dao = new RegisterDAO();
        dao.registerUser(firstName, lastName, dob, username, email, hashedPassword, profilePic);
    }
}
