package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.CommunityModel;
import com.model.PostModel;
import com.model.TagModel;
import com.util.DBConfig;

public class UserHomeDAO {
	
	// method to get top 12 tag
	public List<TagModel> getTag() throws SQLException {
		
		List<TagModel> tagList = new ArrayList<>();
		
		String query = "SELECT Tag_ID, Tag_Name, COUNT(Tag_ID) AS tag_count from tag GROUP BY Tag_Name ORDER BY tag_count DESC LIMIT 12";
		
		try (
				Connection con = DBConfig.getConnection();
				PreparedStatement ps = con.prepareStatement(query);
				ResultSet rs = ps.executeQuery();
			){
			while(rs.next()) {
				TagModel tag = new TagModel();
				tag.setTagID(rs.getInt("Tag_ID"));
				tag.setName(rs.getString("Tag_Name"));
				tag.setTagCount(rs.getInt("tag_count"));
				
				tagList.add(tag);
			}
		}
		
		return tagList;
	}
	
	// method to get all post
	public List<PostModel> getAllPost() throws SQLException {
		
		String query = "SELECT p.Post_ID, p.Post_Caption, p.Post_Date, p.Post_Image,"
				+ "       p.User_ID,"
				+ "       u.User_First_Name, u.User_Last_Name, u.User_Profile_Picture,"
				+ "       COUNT(DISTINCT c.Comment_ID)  AS comment_count,"
				+ "       COUNT(DISTINCT v.Vote_ID) AS vote_count,"
				+ "       COUNT(DISTINCT b.Bookmark_ID) AS bookmark_count,"
				+ "       COUNT(DISTINCT r.Report_ID) AS report_count "
				+ "FROM post p "
				+ "LEFT JOIN user u ON p.User_ID  = u.user_ID "
				+ "LEFT JOIN comment c ON p.Post_ID  = c.Post_ID "
				+ "LEFT JOIN vote v ON p.Post_ID  = v.Post_ID "
				+ "LEFT JOIN bookmark b ON p.Post_ID  = b.Post_ID "
				+ "LEFT JOIN user_report r ON p.User_ID  = r.User_ID "
				+ "GROUP BY p.Post_ID, p.Post_Caption, p.Post_Date, p.Post_Image,"
				+ "         p.User_ID, u.User_First_Name, u.User_Last_Name, u.User_Profile_Picture "
				+ "ORDER BY p.Post_Date DESC";
		
		List<PostModel> postList = new ArrayList<>();
		
		try(
				Connection con = DBConfig.getConnection();
				PreparedStatement ps = con.prepareStatement(query);
				ResultSet rs = ps.executeQuery();
			) {
					
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
                    
                    List<String> tags = tagDAO.getTagByPost(post.getPostId());
                    post.setTags(tags);
                    
                    postList.add(post);
					
				}	
			}
		return postList;
	}
	
	// method to get top community that user hasent join
	public List<CommunityModel> getTopCommunitiesNotJoined(int userId) {
		
		List<CommunityModel> communityList = new ArrayList<>();
	    
	    String sql = "SELECT c.Community_ID, c.Community_Name, c.Community_Profile_Picture, c.Community_Description, "
	    		+ "		COUNT(uc.Joined_Members) AS Member_Count "
	    		+ "FROM Community c "
	    		+ "LEFT JOIN User_Community uc ON c.Community_ID = uc.Community_ID "
	    		+ "WHERE c.Community_ID NOT IN ( "
	    		+ "    SELECT Community_ID "
	    		+ "    FROM User_Community "
	    		+ "    WHERE Joined_Members = ? "
	    		+ ") "
	    		+ "GROUP BY c.Community_ID, c.Community_Name, c.Community_Profile_Picture, c.Community_Description "
	    		+ "ORDER BY Member_Count DESC "
	    		+ "LIMIT 4";

	    try (Connection conn = DBConfig.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {

	        ps.setInt(1, userId);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            CommunityModel community = new CommunityModel();
	            community.setId(rs.getInt("Community_ID"));
	            community.setName(rs.getString("Community_Name"));
	            community.setCommunityProfile(rs.getBytes("Community_Profile_Picture"));
	            community.setDescription(rs.getString("Community_Description"));
	            community.setUserCount(rs.getInt("Member_Count"));
	            
	            communityList.add(community);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return communityList;
	}
	
	// filter post by tag
	public List<PostModel> filterPostByTag(int tagId) throws SQLException {
	    String query = "SELECT p.Post_ID, p.Post_Caption, p.Post_Date, p.Post_Image,"
	            + "       p.User_ID,"
	            + "       u.User_First_Name, u.User_Last_Name, u.User_Profile_Picture,"
	            + "       COUNT(DISTINCT c.Comment_ID)  AS comment_count,"
	            + "       COUNT(DISTINCT v.Vote_ID) AS vote_count,"
	            + "       COUNT(DISTINCT b.Bookmark_ID) AS bookmark_count,"
	            + "       COUNT(DISTINCT r.Report_ID) AS report_count "
	            + "FROM post p "
	            + "LEFT JOIN user u ON p.User_ID = u.user_ID "
	            + "LEFT JOIN comment c ON p.Post_ID = c.Post_ID "
	            + "LEFT JOIN vote v ON p.Post_ID = v.Post_ID "
	            + "LEFT JOIN bookmark b ON p.Post_ID = b.Post_ID "
	            + "LEFT JOIN user_report r ON p.User_ID = r.User_ID "
	            + "INNER JOIN tag t ON p.Post_ID = t.Post_ID "
	            + "WHERE t.Tag_ID = ? "
	            + "GROUP BY p.Post_ID, p.Post_Caption, p.Post_Date, p.Post_Image,"
	            + "         p.User_ID, u.User_First_Name, u.User_Last_Name, u.User_Profile_Picture "
	            + "ORDER BY p.Post_Date DESC";

	    List<PostModel> postList = new ArrayList<>();

	    try (
	            Connection con = DBConfig.getConnection();
	            PreparedStatement ps = con.prepareStatement(query);
	        ) {
	            ps.setInt(1, tagId);

	            try (ResultSet rs = ps.executeQuery()) {
	                TagDAO tagDAO = new TagDAO();

	                while (rs.next()) {
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

	                    List<String> tags = tagDAO.getTagByPost(post.getPostId());
	                    post.setTags(tags);

	                    postList.add(post);
	                }
	            }
	        }
	    return postList;
	}

}
