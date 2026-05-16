package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.TagModel;
import com.util.DBConfig;

public class TagDAO {
	// method to get top 5 tags from community posts
	public List<TagModel> getCommunityPostTag(int communityID) throws SQLException {
		
		String query = "SELECT t.Tag_ID, t.Tag_Name, COUNT(t.Tag_ID) AS tag_count "
				+ "FROM tag t "
				+ "LEFT JOIN post p ON t.Post_ID = p.Post_ID "
				+ "WHERE p.Community_ID = ? "
				+ "GROUP BY t.Tag_Name "
				+ "ORDER BY tag_count DESC "
				+ "LIMIT 5";
		
		List<TagModel> TagList = new ArrayList<>();
		
		try (
				Connection con = DBConfig.getConnection();
				PreparedStatement ps = con.prepareStatement(query);
			) {
				
				ps.setInt(1, communityID); // set communityID
				
				try(ResultSet rs = ps.executeQuery();) {
					
					while(rs.next()) {
						
						TagModel tagModel = new TagModel();
						tagModel.setTagID(rs.getInt("Tag_ID"));
						tagModel.setName(rs.getString("Tag_Name"));
						tagModel.setTagCount(rs.getInt("Tag_count"));
						
						TagList.add(tagModel);
					}
				}
		}
		
		return TagList;
	}
	
	// method to get tag from post
	public List<String> getTagByPost(int postID) throws SQLException {
		
		String query = "Select Tag_Name from Tag where Post_ID = ?";
		List<String> tagName = new ArrayList<>();
		
		try (
				Connection con = DBConfig.getConnection();
				PreparedStatement ps = con.prepareStatement(query);
			) {
			ps.setInt(1, postID);
			
			try(ResultSet rs = ps.executeQuery()) {
				while(rs.next()) {
					tagName.add(rs.getString("Tag_Name"));
				}
			}
		}
		return tagName;
	}
	
	// insert new tag
	public void insertTag(TagModel tag) throws SQLException {
	    String query = "INSERT INTO tag (Tag_Name, Post_ID) VALUES (?, ?)";
	    try (
	        Connection con = DBConfig.getConnection();
	        PreparedStatement ps = con.prepareStatement(query)
	    ) {
	        ps.setString(1, tag.getName());
	        ps.setInt(2, tag.getPostId());
	        ps.executeUpdate();
	    }
	}
}
