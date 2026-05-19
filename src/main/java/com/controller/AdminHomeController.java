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
import com.service.DashboardService;
import com.util.SessionUtil;

import java.time.LocalDate;


/**
 * Servlet implementation class AdminHomeController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/admin/dashboard" })
public class AdminHomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminHomeController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    // object of DashboardService
    private DashboardService dashboardService = new DashboardService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			// get data from service
			int totalUser = dashboardService.getTotalUser();
			int totalCommunity = dashboardService.getTotalCommunities();
			List<CommunityModel> topCommunity = dashboardService.getTopCommunities();
			List<CommunityModel> allCommunity = dashboardService.getAllCommunities();
			List<String> topRequestedNames = dashboardService.getTopRequestedCommunityNames();
			
			// set data in key pair value
			request.setAttribute("totalUser", totalUser);
			request.setAttribute("totalCommunity", totalCommunity);
			request.setAttribute("topCommunity", topCommunity);
			request.setAttribute("allCommunity", allCommunity);
			request.setAttribute("topRequestedNames", topRequestedNames);
			request.setAttribute("AdminName", SessionUtil.getLoggedUser(request).getUsername());
			request.setAttribute("today", LocalDate.now().toString());
			
			
			request.getRequestDispatcher("/WEB-INF/Pages/adminHome.jsp").forward(request, response);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new ServletException("Database error in AdminController", e);
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