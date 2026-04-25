package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.util.SessionUtil;
import com.service.LoginService;


/**
 * Servlet implementation class LoginController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/login" })
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/Pages/login.jsp").include(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// get username and password from Login form from LoginUI
		String username = request.getParameter("Username");
		String password = request.getParameter("Password");
		
		
		try {
			LoginService service = new LoginService();
			boolean userStatus = service.authenticate(username, password); // return true if user exists

			if (userStatus) {
				
				// Session 
				// calling SetAttribute method from SessionUtil package
				SessionUtil.setAttribute(request, "loggedUser", username);
	            response.sendRedirect(request.getContextPath() + "/home");
	            
	        } else {
	            request.setAttribute("errorMessage", "Invalid username or password.");
	            request.getRequestDispatcher("/WEB-INF/Pages/login.jsp").forward(request, response);
	        }
			
		} catch (Exception e) { 
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
