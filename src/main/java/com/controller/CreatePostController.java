package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.sql.SQLException;

import com.model.PostModel;
import com.service.CreatePostService;
import com.service.PostService;
import com.util.SessionUtil;

/**
 * Servlet implementation class PostController
 */
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024,
	    maxFileSize = 5 * 1024 * 1024,
	    maxRequestSize = 10 * 1024 * 1024
	)
@WebServlet(asyncSupported = true, urlPatterns = { "/post/create" })
public class CreatePostController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreatePostController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    String showModal = request.getParameter("showModal"); // "image" or "thread"
	    System.out.println(showModal);

	    // safely parse communityId
	    String communityIdParam = request.getParameter("communityId");
	    int communityId = 0;
	    if (communityIdParam != null && !communityIdParam.trim().isEmpty()) {
	        try {
	            communityId = Integer.parseInt(communityIdParam);
	        } catch (NumberFormatException e) {
	            communityId = 0;
	        }
	    }

	    int userId = SessionUtil.getUserId(request);
	    String postCaption = request.getParameter("postCaption");
	    String postTags = request.getParameter("postTags");

	    PostModel post = new PostModel();
	    post.setCommunityId(communityId);
	    post.setUserId(userId);
	    post.setCaption(postCaption);
	    post.setPostType(showModal); // "image" or "thread"

	    if ("image".equals(showModal)) {
	        handleImagePost(request, response, post, postTags);
	    } else if ("thread".equals(showModal)) {
	        handleThreadPost(request, response, post, postTags);
	    } else {
	        response.sendRedirect(request.getContextPath() + "/user/home");
	    }
	}

	private void handleImagePost(HttpServletRequest request, HttpServletResponse response, PostModel post, String postTags) throws IOException, ServletException {

	    try {
	        Part imagePart = request.getPart("postImage");
	        byte[] postImage = (imagePart != null && imagePart.getSize() > 0)
	                ? imagePart.getInputStream().readAllBytes()
	                : new byte[0];
	        post.setPostImage(postImage);

	        String error = new CreatePostService().validatePost(post, postTags);
	        if (error != null) {
	            response.sendRedirect(request.getContextPath() + "/user/home?showModal=image&error=" + java.net.URLEncoder.encode(error, "UTF-8"));
	            return;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        response.sendRedirect(request.getContextPath()
	                + "/user/home?showModal=image&error="
	                + java.net.URLEncoder.encode("Something went wrong. Please try again.", "UTF-8"));
	        return;
	    }

	    response.sendRedirect(request.getContextPath() + "/user/home");
	}

	private void handleThreadPost(HttpServletRequest request, HttpServletResponse response,
	        PostModel post, String postTags) throws IOException {

	    try {
	        post.setPostImage(null); // no image for thread

	        String error = new CreatePostService().validateTextPost(post, postTags);
	        if (error != null) {
	            response.sendRedirect(request.getContextPath() + "/user/home?showModal=thread&error=" + java.net.URLEncoder.encode(error, "UTF-8"));
	            return;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        response.sendRedirect(request.getContextPath()
	                + "/user/home?showModal=thread&error="
	                + java.net.URLEncoder.encode("Something went wrong. Please try again.", "UTF-8"));
	        return;
	    }

	    response.sendRedirect(request.getContextPath() + "/user/home");
	}

}
