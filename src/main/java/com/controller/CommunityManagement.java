package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.model.CommunityModel;
import com.service.CommunityManagementService;

/**
 * Servlet implementation class CommunityManagement
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/admin/community" })
public class CommunityManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunityManagement() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    CommunityManagementService communityService = new CommunityManagementService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			List<CommunityModel> community = communityService.getAllCommunity();
			
			request.setAttribute("communityList", community);
			request.getRequestDispatcher("/WEB-INF/Pages/communityManagement.jsp").forward(request, response);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new ServletException("Database error in CommunityManagementController", e);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
