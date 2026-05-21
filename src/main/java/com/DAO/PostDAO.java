package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.PostModel;
import com.util.DBConfig;

public class PostDAO {
	
	// method to get all post from community ID
	public List<PostModel> getPostByCommunity(int communityId) throws SQLException {
		
		String query = "SELECT p.Post_ID, p.Post_Caption, p.Post_Date, p.Post_Image,"
				+ "       p.User_ID,"
				+ "       u.User_First_Name, u.User_Last_Name, u.User_Profile_Picture,"
				+ "       com.Community_Name,"
				+ "       COUNT(DISTINCT c.Comment_ID)  AS comment_count,"
				+ "       COUNT(DISTINCT v.Vote_ID) AS vote_count,"
				+ "       COUNT(DISTINCT b.Bookmark_ID) AS bookmark_count,"
				+ "       COUNT(DISTINCT r.Report_ID) AS report_count "
				+ "FROM post p "
				+ "LEFT JOIN user u ON p.User_ID  = u.user_ID "
				+ "LEFT JOIN community com ON p.Community_ID = com.Community_ID "
				+ "LEFT JOIN comment c ON p.Post_ID  = c.Post_ID "
				+ "LEFT JOIN vote v ON p.Post_ID  = v.Post_ID "
				+ "LEFT JOIN bookmark b ON p.Post_ID  = b.Post_ID "
				+ "LEFT JOIN user_report r ON p.User_ID  = r.User_ID "
				+ "WHERE p.Community_ID = ? "
				+ "GROUP BY p.Post_ID, p.Post_Caption, p.Post_Date, p.Post_Image,"
				+ "         p.User_ID, u.User_First_Name, u.User_Last_Name, u.User_Profile_Picture, com.Community_Name "
				+ "ORDER BY p.Post_Date DESC";
		
		List<PostModel> postList = new ArrayList<>();
		
		try(
				Connection con = DBConfig.getConnection();
				PreparedStatement ps = con.prepareStatement(query);
			) {
			
				ps.setInt(1, communityId);
				
				try(ResultSet rs = ps.executeQuery();){		
					
					TagDAO tagDAO = new TagDAO();
					
					while(rs.next()) {
						PostModel post = new PostModel();
						
						// post
	                    post.setPostId(rs.getInt("Post_ID"));
	                    post.setCaption(rs.getString("Post_Caption"));
	                    post.setPostDate(rs.getDate("Post_Date"));
	                    post.setPostImage(rs.getBytes("Post_Image"));

	                    // count details
	                    post.setCommentCount(rs.getInt("comment_count"));
	                    post.setVoteCount(rs.getInt("vote_count"));
	                    post.setBookmarkCount(rs.getInt("bookmark_count"));
	                    post.setReportCount(rs.getInt("report_count"));

	                    // user fields
	                    post.setUserId(rs.getInt("User_ID"));
	                    post.setUserFirstName(rs.getString("User_First_Name"));
	                    post.setUserLastName(rs.getString("User_Last_Name"));
	                    post.setUserProfilePic(rs.getBytes("User_Profile_Picture"));
	                    
	                    // community fields
	                    post.setCommunityName(rs.getString("Community_Name"));
	                    
	                    List<String> tags = tagDAO.getTagByPost(post.getPostId());
	                    post.setTags(tags);
	                    
	                    postList.add(post);
					}
				}	
			}
		return postList;
	}
	
	public List<PostModel> getPostByUserId(int userId) throws SQLException {
	    
	    String query = "SELECT p.Post_ID, p.Post_Caption, p.Post_Date, p.Post_Image,"
	            + "       p.User_ID, u.User_First_Name, u.User_Last_Name, u.User_Profile_Picture,"
	            + "       com.Community_Name,"                                  
	            + "       COUNT(DISTINCT c.Comment_ID)  AS comment_count,"
	            + "       COUNT(DISTINCT v.Vote_ID) AS vote_count,"
	            + "       COUNT(DISTINCT b.Bookmark_ID) AS bookmark_count,"
	            + "       COUNT(DISTINCT r.Report_ID) AS report_count "
	            + "FROM post p "
	            + "LEFT JOIN user u ON p.User_ID = u.User_ID "
	            + "LEFT JOIN community com ON p.Community_ID = com.Community_ID "  
	            + "LEFT JOIN comment c ON p.Post_ID = c.Post_ID "
	            + "LEFT JOIN vote v ON p.Post_ID = v.Post_ID "
	            + "LEFT JOIN bookmark b ON p.Post_ID = b.Post_ID "
	            + "LEFT JOIN user_report r ON p.User_ID = r.User_ID "
	            + "WHERE p.User_ID = ? "
	            + "GROUP BY p.Post_ID, p.Post_Caption, p.Post_Date, p.Post_Image,"
	            + "         p.User_ID, u.User_First_Name, u.User_Last_Name, u.User_Profile_Picture,"
	            + "         com.Community_Name "                             
	            + "ORDER BY p.Post_Date DESC";

	    List<PostModel> postList = new ArrayList<>();

	    try (
	            Connection con = DBConfig.getConnection();
	            PreparedStatement ps = con.prepareStatement(query);
	    ) {
	        ps.setInt(1, userId);

	        try (ResultSet rs = ps.executeQuery()) {

	            TagDAO tagDAO = new TagDAO();

	            while (rs.next()) {
	                PostModel post = new PostModel();

					// post
                    post.setPostId(rs.getInt("Post_ID"));
                    post.setCaption(rs.getString("Post_Caption"));
                    post.setPostDate(rs.getDate("Post_Date"));
                    post.setPostImage(rs.getBytes("Post_Image"));

                    // count details
                    post.setCommentCount(rs.getInt("comment_count"));
                    post.setVoteCount(rs.getInt("vote_count"));
                    post.setBookmarkCount(rs.getInt("bookmark_count"));
                    post.setReportCount(rs.getInt("report_count"));

                    // user fields
                    post.setUserId(rs.getInt("User_ID"));
                    post.setUserFirstName(rs.getString("User_First_Name"));
                    post.setUserLastName(rs.getString("User_Last_Name"));
                    post.setUserProfilePic(rs.getBytes("User_Profile_Picture"));
                    
                    // community fields
                    post.setCommunityName(rs.getString("Community_Name"));  

	                List<String> tags = tagDAO.getTagByPost(post.getPostId());
	                post.setTags(tags);

	                postList.add(post);
	            }
	        }
	    }
	    return postList;
	}
	
	// method to get post by postID
	public PostModel getPostById(int postId) throws SQLException {

	    String query = "SELECT p.Post_ID, p.Post_Caption, p.Post_Date, p.Post_Image,"
	            + "       p.User_ID, u.User_First_Name, u.User_Last_Name, u.User_Profile_Picture,"
	            + "       com.Community_Name,"
	            + "       COUNT(DISTINCT c.Comment_ID) AS comment_count,"
	            + "       COUNT(DISTINCT v.Vote_ID) AS vote_count,"
	            + "       COUNT(DISTINCT b.Bookmark_ID) AS bookmark_count,"
	            + "       COUNT(DISTINCT r.Report_ID) AS report_count "
	            + "FROM post p "
	            + "LEFT JOIN user u ON p.User_ID = u.user_ID "
	            + "LEFT JOIN community com ON p.Community_ID = com.Community_ID "
	            + "LEFT JOIN comment c ON p.Post_ID = c.Post_ID "
	            + "LEFT JOIN vote v ON p.Post_ID = v.Post_ID "
	            + "LEFT JOIN bookmark b ON p.Post_ID = b.Post_ID "
	            + "LEFT JOIN user_report r ON p.User_ID = r.User_ID "
	            + "WHERE p.Post_ID = ? "
	            + "GROUP BY p.Post_ID, p.Post_Caption, p.Post_Date, p.Post_Image,"
	            + "         p.User_ID, u.User_First_Name, u.User_Last_Name, u.User_Profile_Picture,"
	            + "         com.Community_Name";

	    try (
	        Connection con = DBConfig.getConnection();
	        PreparedStatement ps = con.prepareStatement(query)
	    ) {
	        ps.setInt(1, postId);

	        try (ResultSet rs = ps.executeQuery()) {
	            if (rs.next()) {
	                PostModel post = new PostModel();

	                post.setPostId(rs.getInt("Post_ID"));
	                post.setCaption(rs.getString("Post_Caption"));
	                post.setPostDate(rs.getDate("Post_Date"));
	                post.setPostImage(rs.getBytes("Post_Image"));

	                post.setCommentCount(rs.getInt("comment_count"));
	                post.setVoteCount(rs.getInt("vote_count"));
	                post.setBookmarkCount(rs.getInt("bookmark_count"));
	                post.setReportCount(rs.getInt("report_count"));

	                post.setUserId(rs.getInt("User_ID"));
	                post.setUserFirstName(rs.getString("User_First_Name"));
	                post.setUserLastName(rs.getString("User_Last_Name"));
	                post.setUserProfilePic(rs.getBytes("User_Profile_Picture"));

	                post.setCommunityName(rs.getString("Community_Name"));

	                TagDAO tagDAO = new TagDAO();
	                post.setTags(tagDAO.getTagByPost(post.getPostId()));

	                return post;
	            }
	        }
	    }
	    return null; // post not found
	}
	
	// mthod to filter post with search bar
	public List<PostModel> getPostFromSearch(String msg) throws SQLException {
	    
	    String query =     "SELECT p.Post_ID, p.Post_Caption, p.Post_Date, p.Post_Image, " +
	    	    "       p.User_ID, u.User_First_Name, u.User_Last_Name, u.User_Profile_Picture, " +
	    	    "       com.Community_Name, " +
	    	    "       COUNT(DISTINCT c.Comment_ID) AS comment_count, " +
	    	    "       COUNT(DISTINCT v.Vote_ID) AS vote_count, " +
	    	    "       COUNT(DISTINCT b.Bookmark_ID) AS bookmark_count, " +
	    	    "       COUNT(DISTINCT r.Report_ID) AS report_count " +
	    	    "FROM post p " +
	    	    "LEFT JOIN user u ON p.User_ID = u.User_ID " +
	    	    "LEFT JOIN community com ON p.Community_ID = com.Community_ID " +
	    	    "LEFT JOIN comment c ON p.Post_ID = c.Post_ID " +
	    	    "LEFT JOIN vote v ON p.Post_ID = v.Post_ID " +
	    	    "LEFT JOIN bookmark b ON p.Post_ID = b.Post_ID " +
	    	    "LEFT JOIN user_report r ON p.User_ID = r.User_ID " +
	    	    "WHERE p.Post_Caption LIKE CONCAT('%', ?, '%') " +
	    	    "GROUP BY p.Post_ID, p.Post_Caption, p.Post_Date, p.Post_Image, " +
	    	    "         p.User_ID, u.User_First_Name, u.User_Last_Name, u.User_Profile_Picture, " +
	    	    "         com.Community_Name " +
	    	    "ORDER BY p.Post_Date DESC";

	    List<PostModel> postList = new ArrayList<>();

	    try (
	            Connection con = DBConfig.getConnection();
	            PreparedStatement ps = con.prepareStatement(query);
	    ) {
	        ps.setString(1, msg);

	        try (ResultSet rs = ps.executeQuery()) {

	            TagDAO tagDAO = new TagDAO();

	            while (rs.next()) {
	                PostModel post = new PostModel();

					// post
                    post.setPostId(rs.getInt("Post_ID"));
                    post.setCaption(rs.getString("Post_Caption"));
                    post.setPostDate(rs.getDate("Post_Date"));
                    post.setPostImage(rs.getBytes("Post_Image"));

                    // count details
                    post.setCommentCount(rs.getInt("comment_count"));
                    post.setVoteCount(rs.getInt("vote_count"));
                    post.setBookmarkCount(rs.getInt("bookmark_count"));
                    post.setReportCount(rs.getInt("report_count"));

                    // user fields
                    post.setUserId(rs.getInt("User_ID"));
                    post.setUserFirstName(rs.getString("User_First_Name"));
                    post.setUserLastName(rs.getString("User_Last_Name"));
                    post.setUserProfilePic(rs.getBytes("User_Profile_Picture"));
                    
                    // community fields
                    post.setCommunityName(rs.getString("Community_Name"));  

	                List<String> tags = tagDAO.getTagByPost(post.getPostId());
	                post.setTags(tags);

	                postList.add(post);
	            }
	        }
	    }
	    return postList;
	}
	
	
	// method to create post
	public int createPost(PostModel post) throws SQLException {
	    String query = "INSERT INTO post (Community_ID, User_ID, Post_Image, Post_Date, Post_Caption) "
	                 + "VALUES (?, ?, ?, CURDATE(), ?)";

	    try (
	        Connection con = DBConfig.getConnection();
	        PreparedStatement ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)
	    ) {
	        ps.setInt(1, post.getCommunityId());
	        ps.setInt(2, post.getUserId());
	        ps.setBytes(3, (post.getPostImage() != null ? post.getPostImage() : null));
	        ps.setString(4, (post.getCaption() != null && !post.getCaption().trim().isEmpty()) ? post.getCaption().trim() : null);

	        ps.executeUpdate();

	        ResultSet rs = ps.getGeneratedKeys();
	        if (rs.next()) {
	            return rs.getInt(1);
	        }

	        return -1;
	    }
	}
	
	
}
