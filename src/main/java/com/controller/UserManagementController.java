package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.model.UserModel;
import com.service.UserManagementService;

/**
 * Servlet implementation class UserManagementController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/admin/userManagement" })
public class UserManagementController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserManagementController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public UserManagementService userMangementService = new UserManagementService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			List<UserModel> userList = userMangementService.getAllUsers();
			request.setAttribute("userList", userList);
			
			request.getRequestDispatcher("/WEB-INF/Pages/userMonitor.jsp").forward(request, response);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new ServletException("Database error in UserManagementController", e);
		}
		
		
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
