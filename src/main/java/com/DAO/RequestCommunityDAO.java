package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
    
    public List<RequestCommunityModel> getTopRequestedCommunityNames() throws SQLException {
        String sql = "SELECT Request_ID, Community_Name, COUNT(*) AS request_count " +
                "FROM Community_Request " +
                "WHERE Community_Name LIKE '%' " +
                "GROUP BY Request_ID, Community_Name " +
                "ORDER BY request_count DESC " +
                "LIMIT 5";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            List<RequestCommunityModel> results = new ArrayList<>();
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                RequestCommunityModel model = new RequestCommunityModel();
                model.setRequestId(rs.getInt("Request_ID"));
                model.setCommunityName(rs.getString("Community_Name"));
                results.add(model);
            }
            return results;
        }
    }
    
}