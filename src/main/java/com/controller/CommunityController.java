package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.model.CommunityModel;
import com.service.CommunityService;
import com.util.SessionUtil;

/**
 * Servlet implementation class MainController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/community" })
public class CommunityController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunityController() {
        super();
        // TODO Auto-generated constructor stub
    }

    CommunityService communityService = new CommunityService();
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = SessionUtil.getUserId(request);
        String communityIdParam = request.getParameter("communityId");

        try {
            // Always load communities list
            List<CommunityModel> communities = communityService.getCommunityNotJoined(userId);
            request.setAttribute("communities", communities);

            // Only join if communityId is provided
            if (communityIdParam != null && !communityIdParam.isEmpty()) {
                int communityId = Integer.parseInt(communityIdParam);
                boolean result = communityService.joinCommunity(userId, communityId);

                if (result) {
                    request.setAttribute("result", "Joined Community");
                } else {
                    request.setAttribute("result", "Community cannot be joined");
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher("/WEB-INF/Pages/community.jsp").forward(request, response);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/Pages/home.jsp").forward(request, response);
	}

}
