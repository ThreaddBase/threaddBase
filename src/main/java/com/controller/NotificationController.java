package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.model.CommunityModel;
import com.model.NotificationModel;
import com.model.UserModel;
import com.service.NotificationService;
import com.service.ProfileService;
import com.util.SessionUtil;

/**
 * Servlet implementation class NotificationController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/user/notification" })
public class NotificationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NotificationController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    ProfileService profileService = new ProfileService();
    NotificationService notificationService = new NotificationService();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int loggedInUserId = SessionUtil.getUserId(request);
		
        try {
            List<NotificationModel> notificationList = notificationService.getNotifications();
            UserModel user = profileService.getUserById(loggedInUserId);
            
            request.setAttribute("user", user);
            request.setAttribute("loggedInUserId", loggedInUserId);
            request.setAttribute("notificationList", notificationList);
        } catch (Exception e) {
            e.printStackTrace();
        }
		
		request.getRequestDispatcher("/WEB-INF/Pages/notification.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
