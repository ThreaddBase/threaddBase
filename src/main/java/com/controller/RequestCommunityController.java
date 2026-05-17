package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import com.model.RequestCommunityModel;
import com.service.RequestCommunityService;
import com.util.SessionUtil;

/**
 * Servlet implementation class RequestCommunityController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/community/request" })
public class RequestCommunityController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequestCommunityController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    RequestCommunityService requestService = new RequestCommunityService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String showModal = request.getParameter("showModal");
		
        if (showModal != null) {
            request.setAttribute("showModal", showModal);
        }
        response.sendRedirect(request.getContextPath() + "/community?showModal=requestCommunity");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("do post reached");
		
		int userId = SessionUtil.getUserId(request);
		String communityName = request.getParameter("communityName");
		String communityDescription = request.getParameter("communityDescription");
		
		System.out.println("communityName:" + communityName);
		System.out.println("communityDescription:" + communityDescription);
		
		RequestCommunityModel requestCommunity = new RequestCommunityModel();
		
		requestCommunity.setCommunityName(communityName);
		requestCommunity.setCommunityDescription(communityDescription);
		requestCommunity.setUserId(userId);
		
		try {
	        String error = requestService.validateRequest(requestCommunity);
	        if (error != null) {
	            response.sendRedirect(request.getContextPath()
	                + "/community?showModal=requestCommunity&error=" 
	                + java.net.URLEncoder.encode(error, "UTF-8"));
	            return;
	        }
	        response.sendRedirect(request.getContextPath() + "/community?success=true");

	    } catch (SQLException e) {
	        throw new ServletException("Database error saving community request", e);
	    }
		
	}

}
