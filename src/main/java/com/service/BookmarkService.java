package com.service;

import java.sql.SQLException;

import com.DAO.BookmarkDAO;

public class BookmarkService {
	
	public BookmarkDAO bookmarkDAO = new BookmarkDAO();
	
    // ─── Toggle bookmark ───────────────────────────────────
    public boolean toggleBookmark(int postId, int userId) throws SQLException {
        if (bookmarkDAO.hasBookmarked(postId, userId)) {
        	bookmarkDAO.deleteBookmark(postId, userId);
            return false; // bookmark removed
        } else {
        	bookmarkDAO.insertBookmark(postId, userId);
            return true;  // bookmark added
        }
    }
}
