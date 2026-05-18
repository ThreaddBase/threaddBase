package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.model.CommunityModel;
import com.model.UserModel;
import com.service.ProfileService;
import com.util.SessionUtil;

/**
 * Servlet implementation class BookmarkController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/user/bookmark" })
public class ProfileBookmarkController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileBookmarkController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    ProfileService profileService = new ProfileService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int loggedInUserId = SessionUtil.getUserId(request);
		
        try {
            
            UserModel user = profileService.getUserById(loggedInUserId);
            
            request.setAttribute("user", user);
            request.setAttribute("loggedInUserId", loggedInUserId);
        } catch (Exception e) {
            e.printStackTrace();
        }
		
		request.getRequestDispatcher("/WEB-INF/Pages/bookmark.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
