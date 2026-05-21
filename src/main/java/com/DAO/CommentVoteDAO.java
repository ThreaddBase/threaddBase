package com.DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.util.DBConfig;

public class CommentVoteDAO {

    // method to check if user has already voted on a comment
    public boolean hasVoted(int commentId, int userId) throws SQLException {
        String query = "SELECT Comment_Vote_ID FROM Comment_Vote WHERE Comment_ID = ? AND User_ID = ?";
        try (
            Connection con = DBConfig.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
        ) {
            ps.setInt(1, commentId);
            ps.setInt(2, userId);
            try (ResultSet rs = ps.executeQuery()) { return rs.next(); }
        }
    }

    // method to insert comment vote
    public void insertVote(int commentId, int userId) throws SQLException {
        String query = "INSERT INTO Comment_Vote (Comment_ID, User_ID, vote_type) VALUES (?, ?, 1)";
        try (
            Connection con = DBConfig.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
        ) {
            ps.setInt(1, commentId);
            ps.setInt(2, userId);
            ps.executeUpdate();
        }
    }

    // method to delete comment vote
    public void deleteVote(int commentId, int userId) throws SQLException {
        String query = "DELETE FROM Comment_Vote WHERE Comment_ID = ? AND User_ID = ?";
        try (
            Connection con = DBConfig.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
        ) {
            ps.setInt(1, commentId);
            ps.setInt(2, userId);
            ps.executeUpdate();
        }
    }
}