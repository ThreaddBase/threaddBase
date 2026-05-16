package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import com.model.LoginModel;
import com.service.BookmarkService;
import com.service.UserManagementService;
import com.util.SessionUtil;

/**
 * Servlet implementation class BookmarkController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/bookmark" })
public class BookmarkController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	public BookmarkService bookmarkService = new BookmarkService();
	public UserManagementService userService = new UserManagementService();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookmarkController() {
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
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

		LoginModel user = SessionUtil.getLoggedUser(request);
		String username = user.getUsername();

	    if (username == null) {
	        response.sendRedirect(request.getContextPath() + "/login");
	        return;
	    }

	    String postIdParam = request.getParameter("postId");

	    if (postIdParam == null) {
	        response.sendRedirect(request.getContextPath() + "/error");
	        return;
	    }

	    try {
	        int postId = Integer.parseInt(postIdParam);
	        int userId = userService.getUserIdByUsername(username);

	        if (userId == -1) {
	            response.sendRedirect(request.getContextPath() + "/error");
	            return;
	        }

	        boolean bookmarked = bookmarkService.toggleBookmark(postId, userId);
	        System.out.println("Bookmark: " + bookmarked + " | Post: " + postId);

	        // ✅ redirect back to whatever page user came from
	        String referer = request.getHeader("Referer");
	        if (referer != null) {
	            response.sendRedirect(referer);
	        } else {
	            response.sendRedirect(request.getContextPath() + "/user/home");
	        }

	    } catch (NumberFormatException e) {
	        response.sendRedirect(request.getContextPath() + "/error");
	    } catch (SQLException e) {
	        throw new ServletException("Database error in BookmarkController", e);
	    }
	}

}
