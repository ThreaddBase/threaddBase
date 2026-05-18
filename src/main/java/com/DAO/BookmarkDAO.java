package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.BookmarkModel;
import com.util.DBConfig;

public class BookmarkDAO {
	
	// get all bookmark based on userID
	public List<BookmarkModel> getbookmarkByUserId(int userId) throws SQLException {
		
		String query = "SELECT " 
                + "    b.Bookmark_ID, " 
                + "    b.User_ID, " 
                + "    p.Post_Id, " 
                + "    p.Post_Image, " 
                + "    p.Post_Caption, " 
                + "    u.User_First_Name, " 
                + "    u.User_Last_Name " 
                + "FROM Bookmark b " 
                + "JOIN Post p ON b.Post_ID = p.Post_Id " 
                + "JOIN User u ON b.User_ID = u.user_ID " 
                + "WHERE b.User_ID = ?";
		
		try(
				Connection con = DBConfig.getConnection();
				PreparedStatement ps = con.prepareStatement(query);
				
			) {
			
			ps.setInt(1, userId);
			
			try(ResultSet rs = ps.executeQuery()) {
				List<BookmarkModel> bookmarkList = new ArrayList<>();
				while (rs.next()) {
					BookmarkModel bookmark = new BookmarkModel();
					
                    bookmark.setBookmarkId(rs.getInt("Bookmark_ID"));
                    bookmark.setUserId(rs.getInt("User_ID"));
                    bookmark.setPostId(rs.getInt("Post_Id"));
                    bookmark.setPostImage(rs.getBytes("Post_Image"));
                    bookmark.setPostCaption(rs.getString("Post_Caption"));
                    bookmark.setUserFirstName(rs.getString("User_First_Name"));
                    bookmark.setUserLastName(rs.getString("User_Last_Name"));
                    
                    bookmarkList.add(bookmark);
                }
				return bookmarkList;
			}
		}
	}
	
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
