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
 * Servlet implementation class CommunityController
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
        String task = request.getParameter("task");
        String communityIdParam = request.getParameter("communityId");

        try {
            if (communityIdParam != null && !communityIdParam.isEmpty()) {
                int communityId = Integer.parseInt(communityIdParam);

                if ("join".equals(task)) {
                    handleJoin(request, userId, communityId);
                } else if ("leave".equals(task)) {
                    handleLeave(request, userId, communityId);
                }
            }

            List<CommunityModel> communities = communityService.getAllCommunity(userId);
            request.setAttribute("communities", communities);
            request.setAttribute("selectedFilter", "all");

        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher("/WEB-INF/Pages/community.jsp").forward(request, response);
    }

    /**
     * Handles joining a community
     * @param request HttpServletRequest
     * @param userId the logged in user's ID
     * @param communityId the community to join
     */
    private void handleJoin(HttpServletRequest request, int userId, int communityId) throws SQLException {
        boolean result = communityService.joinCommunity(userId, communityId);
        request.setAttribute("result", result ? "Joined Community" : "Community cannot be joined");
    }

    /**
     * Handles leaving a community
     * @param request HttpServletRequest
     * @param userId the logged in user's ID
     * @param communityId the community to leave
     */
    private void handleLeave(HttpServletRequest request, int userId, int communityId) throws SQLException {
        boolean result = communityService.leaveCommunity(userId, communityId);
        request.setAttribute("result", result ? "Left Community" : "Community cannot be left");
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = SessionUtil.getUserId(request);
        String filterCommunity = request.getParameter("filterCommunity");

        try {
            if (filterCommunity.equals("all")) {
                request.setAttribute("communities", communityService.getAllCommunity(userId));
            } else if (filterCommunity.equals("joined")) {
                request.setAttribute("communities", communityService.getJoinedComunity(userId));
            } else if (filterCommunity.equals("notJoined")) {
                request.setAttribute("communities", communityService.getCommunityNotJoined(userId));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("selectedFilter", filterCommunity);
        request.getRequestDispatcher("/WEB-INF/Pages/community.jsp").forward(request, response);
    }
}