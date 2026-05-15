package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;

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
		
		String postTitle = request.getParameter("postTitle"); 
		String postCaption = request.getParameter("postCaption"); 
		int communityId = Integer.parseInt(request.getParameter("communityId"));
		String postTags = request.getParameter("postTags");
		
		
	    Part imagePart = request.getPart("postImage");
	    byte[] postImage = imagePart.getInputStream().readAllBytes();
	    
	    System.out.println("Title: " + postTitle);
	    System.out.println("Caption: " + postCaption);
	    System.out.println("Tags: " + postTags);
	    System.out.println("Community ID: " + communityId);
	    System.out.println("Image size: " + postImage.length);
	    
	    response.sendRedirect(request.getContextPath() + "/user/home");
	}

}
