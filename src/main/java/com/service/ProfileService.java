package com.service;

import com.DAO.ProfileDAO;
import com.model.UserModel;
import com.util.PasswordUtil;
import jakarta.servlet.http.Part;

public class ProfileService {
    public ProfileDAO dao = new ProfileDAO();

    public UserModel getUserById(int id) throws Exception {
        return dao.getUserById(id);
    }

    public String validateProfile(String firstName, String lastName, String username, String dob, String bio) {

        if (firstName == null || firstName.trim().isEmpty())
            return "First Name is required.";
        if (firstName.length() > 50)
            return "First name must be under 50 characters.";

        if (lastName == null || lastName.trim().isEmpty())
            return "Last Name is required.";
        if (lastName.length() > 50)
            return "Last name must be under 50 characters.";

        if (username == null || username.trim().isEmpty())
            return "Username is required.";
        if (username.length() < 4)
            return "Username must be at least 4 characters.";
        if (username.length() > 30)
            return "Username must be under 30 characters.";
        if (!username.matches("^[a-zA-Z0-9._]+$"))
            return "Username can only contain letters, numbers, dots, and underscores.";

        if (dob == null || dob.trim().isEmpty())
            return "Date of Birth is required.";
        try {
            java.time.LocalDate birthDate = java.time.LocalDate.parse(dob);
            if (birthDate.isAfter(java.time.LocalDate.now()))
                return "Date of birth cannot be in the future.";
            if (java.time.Period.between(birthDate, java.time.LocalDate.now()).getYears() < 13)
                return "You must be at least 13 years old.";
        } catch (Exception e) {
            return "Invalid date format.";
        }

        if (bio != null && bio.length() > 300)
            return "Bio must be under 300 characters.";

        return null;
    }

    public String validateProfilePicture(Part picPart) {
        if (picPart == null || picPart.getSize() == 0)
            return null; // optional, skip if not uploaded

        String contentType = picPart.getContentType();
        if (contentType == null || !contentType.startsWith("image/"))
            return "Uploaded file must be an image.";

        if (picPart.getSize() > 5 * 1024 * 1024)
            return "Image must be under 5MB.";

        return null;
    }

    public boolean updateProfile(int id, String firstName, String lastName,
            String username, String dob, String bio) throws Exception {
        return dao.updateProfile(id, firstName, lastName, username, dob, bio);
    }

    public boolean updateProfilePicture(int id, byte[] picture) throws Exception {
        return dao.updateProfilePicture(id, picture);
    }

    public String changePassword(int id, String currentPass, String newPass, String retypePass) throws Exception {

        if (newPass == null || newPass.trim().isEmpty())
            return "Password is required.";
        if (newPass.length() < 8)
            return "Password must be at least 8 characters.";
        if (!newPass.matches(".*[A-Z].*"))
            return "Password must contain at least one uppercase letter.";
        if (!newPass.matches(".*[0-9].*"))
            return "Password must contain at least one number.";
        if (!newPass.matches(".*[!@#$%^&*()_+\\-={}:;\"'<>?,./].*"))
            return "Password must contain at least one special character.";
        if (!newPass.equals(retypePass))
            return "Passwords do not match.";

        UserModel user = dao.getUserById(id);
        if (user == null)
            return "User not found.";
        if (!PasswordUtil.checkPassword(currentPass, user.getPassword()))
            return "Current password is incorrect.";

        dao.updatePassword(id, PasswordUtil.hash(newPass));
        return "success";
    }
}