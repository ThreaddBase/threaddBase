package com.service;

import com.DAO.RegisterDAO;
import com.util.PasswordUtil;

public class RegisterService {
	
	public String registerUser(String firstName, String lastName, String dob,
	        String username, String email, String password,
	        String confirmPassword, byte[] profilePic) throws Exception {

	    if (firstName == null || firstName.trim().isEmpty())
	        return "First Name is required";
	    if (lastName == null || lastName.trim().isEmpty())
	        return "Last Name is required";
	    if (dob == null || dob.trim().isEmpty())
	        return "Date of Birth is required";
	    if (username == null || username.trim().isEmpty())
	        return "Username is required";
	    if (username.length() < 4)
	        return "Username must be at least 4 characters";
	    if (email == null || email.trim().isEmpty())
	        return "Email is required";
	    if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$"))
	        return "Invalid Email Address";
	    if (password == null || password.trim().isEmpty())
	        return "Password is required";
	    if (password.length() < 8)
	        return "Password must be at least 8 characters";
	    if (!password.matches(".*[A-Z].*"))
	        return "Password must contain at least one uppercase letter";
	    if (!password.matches(".*[0-9].*"))
	        return "Password must contain at least one number";
	    if (!password.matches(".*[!@#$%^&*()_+\\-={}:;\"'<>?,./].*"))
	        return "Password must contain at least one special character";

	    if (confirmPassword == null || !password.equals(confirmPassword))
	        return "Passwords do not match";

	    // profile is not required can be edited later.
		/*
		 * if (profilePic == null || profilePic.length == 0) return
		 * "Profile picture is required";
		 */

	    String hashedPassword = PasswordUtil.getHashPassword(password);
	    new RegisterDAO().registerUser(firstName, lastName, dob, username, email, hashedPassword, profilePic);
	    return null;
	}
}
