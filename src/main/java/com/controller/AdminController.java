
package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import com.model.UserModel;
import com.service.UserService;
import com.service.CommunityService;
import com.DAO.UserDAO;
import com.DAO.CommunityDAO;

import com.util.SessionUtil;

/**
 * Servlet implementation class AdminController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/admin" })
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final UserService service = new UserService();
	CommunityService communityService = new CommunityService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// TODO Auto-generated method stub
		
		// Check user role == admin
		if (!SessionUtil.hasRole(request, SessionUtil.ROLE_ADMIN)) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
		
		
		try {
		    // 
		    int adminId = SessionUtil.getUserId(request);
		    UserModel admin = service.getUserById(adminId);
		    request.setAttribute("user", admin);

		 
		    ArrayList<UserModel> userList = service.getAllusers();
		    request.setAttribute("userList", userList);

		    request.getRequestDispatcher("/WEB-INF/Pages/adminPortal.jsp")
		           .forward(request, response);

		} catch (Exception e) {
		    throw new ServletException("DB Error: " + e.getMessage(), e);
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
