package com.service;

import java.sql.SQLException;
import java.util.List;

import com.DAO.BookmarkDAO;
import com.model.BookmarkModel;

public class BookmarkService {
	
	public BookmarkDAO bookmarkDAO = new BookmarkDAO();
	
	// get all bookmark based on userID
		public List<BookmarkModel> getbookmarkByUserId(int userId) throws SQLException {
			return bookmarkDAO.getbookmarkByUserId(userId);
		}
	
    // Toggle bookmark
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
