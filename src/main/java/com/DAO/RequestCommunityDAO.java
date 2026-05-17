package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.model.RequestCommunityModel;
import com.util.DBConfig;

public class RequestCommunityDAO {

    /**
     * Inserts a new community request into the Community_Request table.
     *
     * @param requestCommunity the model containing userId, community name and description
     * @throws SQLException if the insert fails
     */
    public void insertRequest(RequestCommunityModel requestCommunity) throws SQLException {

        String sql = "INSERT INTO Community_Request (User_ID, Community_Name, Community_Description, Request_Date) VALUES (?, ?, ?, CURDATE())";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, requestCommunity.getUserId());
            ps.setString(2, requestCommunity.getCommunityName().trim());
            ps.setString(3, requestCommunity.getCommunityDescription().trim());
            ps.executeUpdate();
        }
    }
}