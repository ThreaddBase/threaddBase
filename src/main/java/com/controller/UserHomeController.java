package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.model.CommunityModel;
import com.model.LoginModel;
import com.model.NotificationModel;
import com.model.PostModel;
import com.model.TagModel;
import com.model.UserModel;
import com.service.NotificationService;
import com.service.UserHomeService;
import com.util.SessionUtil;

/**
 * Servlet implementation class UserHomeController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/user/home" })
public class UserHomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserHomeController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    // service Objects
    UserHomeService userService = new UserHomeService();
    NotificationService notifService = new NotificationService();
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        int loggedInUserId = SessionUtil.getUserId(request);
        String action = request.getParameter("action");

        // In UserHomeController
        List<NotificationModel> latestNotifications = notifService.getUnreadNotifications();

        if ("markRead".equals(action)) {
            notifService.markAllAsRead();
            response.sendRedirect(request.getContextPath() + "/user/home");
            return;
        }

        List<TagModel> tagList = new ArrayList<>();
        List<PostModel> postList = new ArrayList<>();
        List<CommunityModel> communityList = new ArrayList<>();

        String idParam = request.getParameter("id");
        int tagId = (idParam != null && !idParam.isEmpty()) ? Integer.parseInt(idParam) : 0;

        try {
            tagList = userService.getTag();
            communityList = userService.getTopCommunitiesNotJoined(loggedInUserId);

            if (tagId == 0) {
                postList = userService.getAllPost();
            } else {
                postList = userService.filterPostByTag(tagId);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        LoginModel userInfo = SessionUtil.getLoggedUser(request); 
        
        request.setAttribute("tagList", tagList);
        request.setAttribute("postList", postList);
        request.setAttribute("communityList", communityList);
        request.setAttribute("notificationList", latestNotifications);
        request.setAttribute("userInfo", userInfo);
        request.setAttribute("today", LocalDate.now().toString());

        request.getRequestDispatcher("/WEB-INF/Pages/userHome.jsp").forward(request, response);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
