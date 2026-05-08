package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import com.DAO.UserManagementDAO;
import com.DAO.VoteDAO;
import com.service.UserManagementService;
import com.service.VoteService;
import com.util.SessionUtil;

/**
 * Servlet implementation class VoteController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/vote" })
public class VoteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public UserManagementService userService = new UserManagementService();
	public VoteService voteService = new VoteService();
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VoteController() {
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
		// TODO Auto-generated method stub
		
		// get username from session util
		String username = SessionUtil.getLoggedUser(request);
		
        if (username == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        // get post id and community id from jsp
        String postIdParam = request.getParameter("postId");
        String communityId = request.getParameter("communityId");
        
        if (postIdParam == null) {
            response.sendRedirect(request.getContextPath() + "/error");
            return;
        }
        
        try {
        	
        	// get post id from jsp
        	// get user id from userService -> userDAO -> database
        	int postID = Integer.parseInt(postIdParam);
			int userID = userService.getUserIdByUsername(username);
			
			if (userID == -1) {
				 response.sendRedirect(request.getContextPath() + "/error");
	             return;
			}
			
			// get true if vote added
			// get false if vote removed
			
			boolean voted = voteService.toggleVote(postID, userID);
			System.out.println("Vote toggled: " + voted + " | Post: " + postID + " | User: " + userID); // print for debugging
			
			String referer = request.getHeader("Referer");
			
			// redirected to referer page and any error redirected to home
	        if (referer != null) {
	            response.sendRedirect(referer);
	        } else {
	            response.sendRedirect(request.getContextPath() + "/home");
	        }
			 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new ServletException("Database error in VoteController", e);
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath() + "/error");
		}
        
	}

}
