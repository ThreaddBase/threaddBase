//package com.DAO;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
//
//import com.model.PostModel;
//import com.util.DBConfig;
//
//public class PostDAO {
//	
//	// method to get all bost from community ID
//	public List<PostModel> getPostByCommunity(int communityId) throws SQLException {
//		
//		String query = "SELECT p.Post_ID, p.Post_Caption, p.Post_Date,"
//				+ "       p.User_ID,"
//				+ "       u.User_First_Name, u.User_Last_Name,"
//				+ "       COUNT(DISTINCT c.Comment_ID)  AS comment_count,"
//				+ "       COUNT(DISTINCT v.Vote_ID) AS vote_count,"
//				+ "       COUNT(DISTINCT b.Bookmark_ID) AS bookmark_count,"
//				+ "       COUNT(DISTINCT r.Report_ID) AS report_count "
//				+ "FROM post p "
//				+ "LEFT JOIN user u ON p.User_ID  = u.user_ID "
//				+ "LEFT JOIN comment c ON p.Post_ID  = c.Post_ID "
//				+ "LEFT JOIN vote v ON p.Post_ID  = v.Post_ID "
//				+ "LEFT JOIN bookmark b ON p.Post_ID  = b.Post_ID "
//				+ "LEFT JOIN user_report r ON p.User_ID  = r.User_ID "
//				+ "WHERE p.Community_ID = ? "
//				+ "GROUP BY p.Post_ID, p.Post_Caption, p.Post_Date,"
//				+ "         p.User_ID, u.User_First_Name, u.User_Last_Name "
//				+ "ORDER BY p.Post_Date DESC";
//		
//		List<PostModel> postList = new ArrayList<>();
//		
//		try(
//				Connection con = DBConfig.getConnection();
//				PreparedStatement ps = con.prepareStatement(query);
//			) {
//			
//				ps.setInt(1, communityId);
//				
//				try(ResultSet rs = ps.executeQuery();){					
//					while(rs.next()) {
//						PostModel post = new PostModel();
//						
//						// post
//	                    post.setPostId(rs.getInt("Post_ID"));
//	                    post.setCaption(rs.getString("Post_Caption"));
//	                    post.setPostDate(rs.getDate("Post_Date"));
//	                    post.setPostImage(rs.getBytes("Post_Image"));
//
//	                    // count details
//	                    post.setCommentCount(rs.getInt("comment_count"));
//	                    post.setVoteCount(rs.getInt("vote_count"));
//	                    post.setBookmarkCount(rs.getInt("bookmark_count"));
//	                    post.setReportCount(rs.getInt("report_count"));
//
//	                    // user fields
//	                    post.setUserId(rs.getInt("User_ID"));
//	                    post.setUserFirstName(rs.getString("User_First_Name"));
//	                    post.setUserLastName(rs.getString("User_Last_Name"));
//	                    post.setUserProfilePic(rs.getBytes("User_Profile_Picture"));
//
//	                    postList.add(post);
//					}
//				}	
//			}
//		return postList;
//	}
//}



//package com.DAO;
//
//import java.sql.*;
//import java.util.ArrayList;
//import java.util.List;
//
//import com.model.PostModel;
//import com.util.DBConfig;
//
//public class PostDAO {
//
//    public List<PostModel> getPostByUser(int userId) throws SQLException {
//
//        String query =
//            "SELECT p.Post_ID, p.Post_Caption, p.Post_Date, p.Post_Image, " +
//            "p.User_ID, u.User_First_Name, u.User_Last_Name, " +
//            "COUNT(DISTINCT c.Comment_ID) AS comment_count, " +
//            "COUNT(DISTINCT v.Vote_ID) AS vote_count, " +
//            "COUNT(DISTINCT b.Bookmark_ID) AS bookmark_count, " +
//            "COUNT(DISTINCT r.Report_ID) AS report_count " +
//            "FROM post p " +
//            "LEFT JOIN user u ON p.User_ID = u.User_ID " +
//            "LEFT JOIN comment c ON p.Post_ID = c.Post_ID " +
//            "LEFT JOIN vote v ON p.Post_ID = v.Post_ID " +
//            "LEFT JOIN bookmark b ON p.Post_ID = b.Post_ID " +
//            "LEFT JOIN user_report r ON p.User_ID = r.User_ID " +
//            "WHERE p.User_ID = ? " +
//            "GROUP BY p.Post_ID, p.Post_Caption, p.Post_Date, p.Post_Image, " +
//            "p.User_ID, u.User_First_Name, u.User_Last_Name " +
//            "ORDER BY p.Post_Date DESC";
//
//        List<PostModel> list = new ArrayList<>();
//
//        try (
//            Connection con = DBConfig.getConnection();
//            PreparedStatement ps = con.prepareStatement(query);
//        ) {
//            ps.setInt(1, userId);
//
//            ResultSet rs = ps.executeQuery();
//
//            while (rs.next()) {
//                PostModel post = new PostModel();
//
//                post.setPostId(rs.getInt("Post_ID"));
//                post.setCaption(rs.getString("Post_Caption"));
//                post.setPostDate(rs.getDate("Post_Date"));
//                post.setPostImage(rs.getBytes("Post_Image"));
//
//                post.setUserId(rs.getInt("User_ID"));
//                post.setUserFirstName(rs.getString("User_First_Name"));
//                post.setUserLastName(rs.getString("User_Last_Name"));
//
//                post.setCommentCount(rs.getInt("comment_count"));
//                post.setVoteCount(rs.getInt("vote_count"));
//                post.setBookmarkCount(rs.getInt("bookmark_count"));
//                post.setReportCount(rs.getInt("report_count"));
//
//                list.add(post);
//            }
//        }
//
//        return list;
//    }
//}



package com.DAO;

import com.model.PostModel;
import com.util.DBConfig;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDAO {

    public List<PostModel> getPostsByUserId(int userId) throws SQLException {
        List<PostModel> posts = new ArrayList<>();

        String sql =
            "SELECT p.Post_ID, p.Community_ID, p.User_ID, p.Post_Image, " +
            "p.Post_Date, p.Post_Caption, c.Community_Name, " +
            "(SELECT COUNT(*) FROM vote v WHERE v.Post_ID = p.Post_ID) AS likeCount, " +
            "(SELECT COUNT(*) FROM comment cm WHERE cm.Post_ID = p.Post_ID) AS commentCount " +
            "FROM post p " +
            "LEFT JOIN community c ON p.Community_ID = c.Community_ID " +
            "WHERE p.User_ID = ? " +
            "ORDER BY p.Post_Date DESC";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                posts.add(mapRow(rs));
            }
        }
        return posts;
    }

    public List<PostModel> getPostsByCommunityId(int communityId) throws SQLException {
        List<PostModel> posts = new ArrayList<>();

        String sql =
            "SELECT p.Post_ID, p.Community_ID, p.User_ID, p.Post_Image, " +
            "p.Post_Date, p.Post_Caption, c.Community_Name, " +
            "(SELECT COUNT(*) FROM vote v WHERE v.Post_ID = p.Post_ID) AS likeCount, " +
            "(SELECT COUNT(*) FROM comment cm WHERE cm.Post_ID = p.Post_ID) AS commentCount " +
            "FROM post p " +
            "LEFT JOIN community c ON p.Community_ID = c.Community_ID " +
            "WHERE p.Community_ID = ? " +
            "ORDER BY p.Post_Date DESC";

        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, communityId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                posts.add(mapRow(rs));
            }
        }
        return posts;
    }

    public PostModel getPostById(int postId) throws SQLException {
        String sql = "SELECT * FROM post WHERE Post_ID = ?";
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, postId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                PostModel post = new PostModel();
                post.setPostId(rs.getInt("Post_ID"));
                post.setPostImage(rs.getBytes("Post_Image"));
                return post;
            }
        }
        return null;
    }

    private PostModel mapRow(ResultSet rs) throws SQLException {
        PostModel post = new PostModel();
        post.setPostId(rs.getInt("Post_ID"));
        post.setCommunityId(rs.getInt("Community_ID"));
        post.setUserId(rs.getInt("User_ID"));
        post.setPostImage(rs.getBytes("Post_Image"));
        post.setPostDate(rs.getDate("Post_Date"));
        post.setPostCaption(rs.getString("Post_Caption"));
        post.setCommunityName(rs.getString("Community_Name"));
        post.setLikeCount(rs.getInt("likeCount"));
        post.setCommentCount(rs.getInt("commentCount"));
        return post;
    }
}