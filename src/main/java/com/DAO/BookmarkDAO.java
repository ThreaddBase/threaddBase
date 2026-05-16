package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.util.DBConfig;

public class BookmarkDAO {
	// Check if user has bookmark or not
    public boolean hasBookmarked(int postId, int userId) throws SQLException {
        String query = "SELECT Bookmark_ID FROM bookmark WHERE Post_ID = ? AND User_ID = ?";
        try (
            Connection con = DBConfig.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
        ) {
            ps.setInt(1, postId);
            ps.setInt(2, userId);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next(); // true if bookmark exists
            }
        }
    }

    // Insert Bookmark
    public void insertBookmark(int postId, int userId) throws SQLException {
        String query = "INSERT INTO bookmark (User_ID, Post_ID) VALUES (?, ?)";
        try (
            Connection con = DBConfig.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
        ) {
            ps.setInt(1, userId);
            ps.setInt(2, postId);
            ps.executeUpdate();
            System.out.println("Bookmark added for post: " + postId);
        }
    }

    // delete Bookmark
    public void deleteBookmark(int postId, int userId) throws SQLException {
        String query = "DELETE FROM bookmark WHERE Post_ID = ? AND User_ID = ?";
        try (
            Connection con = DBConfig.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
        ) {
            ps.setInt(1, postId);
            ps.setInt(2, userId);
            ps.executeUpdate();
            System.out.println("Bookmark removed for post: " + postId);
        }
    }
}
