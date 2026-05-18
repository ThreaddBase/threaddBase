package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.model.BookmarkModel;
import com.model.CommunityModel;
import com.model.UserModel;
import com.service.BookmarkService;
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
    BookmarkService bookmarkService = new BookmarkService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int loggedInUserId = SessionUtil.getUserId(request);
		
		String postParamId = request.getParameter("postId");
	    if (postParamId != null && !postParamId.isEmpty()) {
	        try {
	            int postId = Integer.parseInt(postParamId);
	            bookmarkService.toggleBookmark(postId, loggedInUserId);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        // Redirect after remove to avoid re-triggering on refresh
	        response.sendRedirect(request.getContextPath() + "/user/bookmark");
	        return;
	    }
	    
	    try {
	        UserModel user = profileService.getUserById(loggedInUserId);
	        List<BookmarkModel> bookmarkList = bookmarkService.getbookmarkByUserId(loggedInUserId);

	        request.setAttribute("user", user);
	        request.setAttribute("loggedInUserId", loggedInUserId);
	        request.setAttribute("bookmarkList", bookmarkList);
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
