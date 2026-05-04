package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;

import com.DAO.UpdateDAO;
import com.model.UserModel;
import com.service.RegisterService;
import com.service.UpdateService;
import com.util.SessionUtil;


/**
 * Servlet implementation class AdminEditController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/admin/edit" })
public class AdminEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminEditController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/Pages/adminEdit.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    try {
	        String username = request.getParameter("username");
	        String firstname = request.getParameter("f-name");
	        String lastname = request.getParameter("l-name");
	        String bio = request.getParameter("bio");
	        String dob = request.getParameter("dob");

	        UpdateService userService = new UpdateService();
	        String error = userService.updateProfile(username, firstname, lastname, bio, dob);

	        if (error != null) {
	            request.setAttribute("errorMessage", error);
	            request.getRequestDispatcher("/WEB-INF/Pages/adminEdit.jsp").forward(request, response);
	        } else {
	            request.setAttribute("successMessage", "Profile updated successfully.");
	            request.getRequestDispatcher("/WEB-INF/Pages/adminEdit.jsp").forward(request, response);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        request.setAttribute("errorMessage", "Error: Update failed. Please try again.");
	        request.getRequestDispatcher("/WEB-INF/Pages/adminEdit.jsp").forward(request, response);
	    }
	}

}
