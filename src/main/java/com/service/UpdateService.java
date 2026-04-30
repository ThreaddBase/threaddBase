package com.service;

import com.DAO.UpdateDAO;
import com.model.UserModel;

public class UpdateService {

    private UpdateDAO updateModel;

    public UpdateService() {
        this.updateModel = new UpdateDAO();
    }

    /**
     * Validates and updates user profile info (name, bio, dob).
     * Returns null on success, or an error message string on failure.
     */
    public String updateProfile(String username, String firstname, String lastname, String bio, String dob) {

        // Basic validation
        if (username == null || username.trim().isEmpty()) {
            return "Username is required.";
        }
        if (firstname == null || firstname.trim().isEmpty()) {
            return "First name is required.";
        }
        if (lastname == null || lastname.trim().isEmpty()) {
            return "Last name is required.";
        }

        // Build model
        UserModel user = new UserModel();
        user.setUsername(username.trim());
        user.setFirstName(firstname.trim());
        user.setLastName(lastname.trim());
        user.setBio(bio != null ? bio.trim() : "");
        user.setDob(dob != null ? dob.trim() : "");

        // Delegate to DAO
        boolean success = updateModel.updateUserProfile(user);

        if (!success) {
            return "Database error: could not update profile.";
        }

        return null; // null = success
    }
}