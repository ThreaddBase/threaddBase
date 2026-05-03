package com.DAO;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.model.UserModel;

import java.sql.Connection;

import com.util.DBConfig;

public class UpdateDAO {

    /**
     * Updates first name, last name, bio, and dob for the given username.
     * Returns true on success, false on failure.
     */
    public boolean updateUserProfile(UserModel user) {
        String sql = "UPDATE users SET first_name = ?, last_name = ?, bio = ?, dob = ? WHERE username = ?";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getBio());
            ps.setString(4, user.getDob());
            ps.setString(5, user.getUsername());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}