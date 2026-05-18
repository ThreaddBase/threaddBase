package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.model.CommunityModel;
import com.model.PostModel;
import com.model.UserModel;
import com.service.CommunityService;
import com.service.ProfileService;
import com.util.SessionUtil;

/**
 * Servlet implementation class JoinedCommunities
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/user/joined" })
public class JoinedController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinedController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    ProfileService profileService = new ProfileService();
    CommunityService communityService = new CommunityService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int loggedInUserId = SessionUtil.getUserId(request);
		
        try {
            List<CommunityModel> communityList = communityService.getJoinedComunity(loggedInUserId);
            List<CommunityModel> reCommendedList = communityService.getCommunityNotJoined(loggedInUserId);
            
            UserModel user = profileService.getUserById(loggedInUserId);
            
            request.setAttribute("user", user);
            request.setAttribute("communityList", communityList);
            request.setAttribute("loggedInUserId", loggedInUserId);
            request.setAttribute("reCommendedList", reCommendedList);
        } catch (Exception e) {
            e.printStackTrace();
        }
		
		request.getRequestDispatcher("/WEB-INF/Pages/joined.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
