//package com.service;
//
//import java.sql.SQLException;
//import java.util.List;
//
//import com.DAO.PostDAO;
//import com.model.PostModel;
//
//public class PostService {
//	
//	PostDAO postDAO = new PostDAO();
//	
//	public List<PostModel> getPostByCommunity(int communityId) 
//	        throws SQLException {
//	    return postDAO.getPostByCommunity(communityId);
//	}
//}


//package com.service;
//
//import com.DAO.PostDAO;
//import com.model.PostModel;
//
//import java.util.List;
//
//public class PostService {
//
//    private PostDAO postDAO = new PostDAO();
//
//    public List<PostModel> getPostByUser(int userId) throws Exception {
//        return postDAO.getPostByUser(userId);
//    }
//
//	public List<PostModel> getPostByCommunity(int communityId) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//}



package com.service;

import com.DAO.PostDAO;
import com.model.PostModel;

import java.sql.SQLException;
import java.util.List;

public class PostService {

    private PostDAO postDAO = new PostDAO();

    public List<PostModel> getUserPosts(int userId) throws SQLException {
        return postDAO.getPostsByUserId(userId);
    }

    public List<PostModel> getPostByCommunity(int communityId) throws SQLException {
        return postDAO.getPostsByCommunityId(communityId);
    }
}