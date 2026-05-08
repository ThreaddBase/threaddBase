package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.util.DBConfig;

public class VoteDAO {
	
	// method that check ff user has already voted
	public boolean hasVoted(int postID, int userID) throws SQLException {
		
		String query = "SELECT Vote_ID FROM vote WHERE Post_ID = ? AND User_ID = ?";
		
		try (
				Connection con = DBConfig.getConnection();
				PreparedStatement ps = con.prepareStatement(query);
			) {
			
			ps.setInt(1, postID);
			ps.setInt(2, userID);
			
			try (ResultSet rs = ps.executeQuery()) { return rs.next();}
		}
	}
	
	// method to insert vote
	public void insertVote(int postID, int userID) throws SQLException {
		
		String query = "INSERT INTO vote (Post_ID, User_ID) VALUES (?, ?)";
		
		try (
				Connection con = DBConfig.getConnection();
				PreparedStatement ps = con.prepareStatement(query);
			) {
			
			ps.setInt(1, postID);
			ps.setInt(2, userID);
			ps.executeUpdate();
		}
	}
	
	// method to insert vote
	public void deleteVote(int postID, int userID) throws SQLException {
		
		String query = "DELETE FROM vote WHERE Post_ID = ? AND User_ID = ?";
		
		try (
				Connection con = DBConfig.getConnection();
				PreparedStatement ps = con.prepareStatement(query);
			) {
			
			ps.setInt(1, postID);
			ps.setInt(2, userID);
			ps.executeUpdate();
		}
	}
}
