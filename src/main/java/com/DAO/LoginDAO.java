package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.model.LoginModel;
import com.util.DBConfig;

public class LoginDAO {

    public LoginModel getUser(String username) throws Exception {

        String sql = "SELECT * FROM user WHERE username = ?";

        // All three closed automatically — even if an exception occurs
        try (Connection con = DBConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, username);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new LoginModel(
                        rs.getString("Username"),
                        rs.getString("Password")
                    );
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }
}