package com.service;

import com.DAO.ProfileDAO;

import com.model.UserModel;
import com.util.PasswordUtil;

import java.sql.SQLException;

public class ProfileService {

    public ProfileDAO dao = new ProfileDAO();

    public UserModel getUserById(int id) throws Exception {
    	return dao.getUserById(id);
    }

    public boolean updateProfile(int id, String firstName, String lastName,
            String username,
            String dob, String bio) throws Exception {
return dao.updateProfile(id, firstName, lastName, username, dob, bio);
}

public boolean updateProfilePicture(int id, byte[] picture) throws Exception {
return dao.updateProfilePicture(id, picture);
}

public String changePassword(int id, String currentPass,
            String newPass, String retypePass) throws Exception {
if (!newPass.equals(retypePass))
return "Passwords do not match";

if (newPass.length() < 4)
return "Password must be at least 4 characters";

// verify current password against stored hash
UserModel user = dao.getUserById(id);
if (user == null)
    return "User not found";

// use checkPassword not hash
if (!PasswordUtil.checkPassword(currentPass, user.getPassword()))
    return "Current password is incorrect";



dao.updatePassword(id, PasswordUtil.hash(newPass));
return "success";
}

}