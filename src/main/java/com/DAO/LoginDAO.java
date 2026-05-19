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

        try (
            Connection con = DBConfig.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {
            ps.setString(1, username);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    LoginModel user = new LoginModel(
                        rs.getInt("user_ID"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getString("user_Role")
                    );
                    user.setUserProfilePic(rs.getBytes("User_Profile_Picture"));
                    return user;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}