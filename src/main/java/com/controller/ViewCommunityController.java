package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;

import com.model.CommunityModel;
import com.model.PostModel;
import com.model.TagModel;
import com.service.CommunityManagementService;
import com.service.CommunityService;
import com.service.PostService;
import com.service.TagService;
import com.util.SessionUtil;

/**
 * Controller for viewing and managing a single community page.
 * Handles GET requests for viewing, joining, and leaving communities,
 * and POST requests for editing community details.
 */
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,
    maxFileSize = 5 * 1024 * 1024,
    maxRequestSize = 10 * 1024 * 1024
)
@WebServlet(asyncSupported = true, urlPatterns = { "/community/view" })
public class ViewCommunityController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final CommunityService communityService = new CommunityService();
    private final CommunityManagementService communityManageService = new CommunityManagementService();
    private final PostService postService = new PostService();
    private final TagService tagService = new TagService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int userId = SessionUtil.getUserId(request);
        String task = request.getParameter("task");
        String communityIdParam = request.getParameter("communityId");
        String idParam = request.getParameter("id");

        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/error");
            return;
        }

        try {
            int communityId = Integer.parseInt(idParam);

            // Handle join/leave before loading page data
            if (communityIdParam != null && !communityIdParam.isEmpty()) {
                int actionCommunityId = Integer.parseInt(communityIdParam);
                handleMembership(request, task, userId, actionCommunityId);
            }

            loadCommunityPage(request, response, userId, communityId);

        } catch (NumberFormatException e) {
            System.out.println("Invalid community ID: " + idParam);
            response.sendRedirect(request.getContextPath() + "/error");

        } catch (SQLException e) {
            throw new ServletException("Database error in ViewCommunityController", e);
        }
    }

    /**
     * Delegates join/leave actions based on the task parameter.
     */
    private void handleMembership(HttpServletRequest request, String task, int userId, int communityId)
            throws SQLException {
        if ("join".equals(task)) {
            boolean success = communityService.joinCommunity(userId, communityId);
            request.setAttribute("result", success ? "Joined Community" : "Community cannot be joined");

        } else if ("leave".equals(task)) {
            boolean success = communityService.leaveCommunity(userId, communityId);
            request.setAttribute("result", success ? "Left Community" : "Community cannot be left");
        }
    }

    /**
     * Fetches all data required to render the community page and forwards to the JSP.
     */
    private void loadCommunityPage(HttpServletRequest request, HttpServletResponse response,
                                   int userId, int communityId)
            throws SQLException, ServletException, IOException {

        CommunityModel community = communityService.getCommunityByID(communityId);
        if (community == null) {
            response.sendRedirect(request.getContextPath() + "/error");
            return;
        }

        List<PostModel> postList = postService.getPostByCommunity(communityId);
        List<TagModel> tagList = tagService.getCommunityByID(communityId);
        boolean isJoined = communityService.getJoinedCommunityById(userId, communityId);
        String role = (String) SessionUtil.getRole(request);

        // Pass modal trigger if present (e.g. ?showModal=editCommunity)
        String showModal = request.getParameter("showModal");
        if (showModal != null) {
            request.setAttribute("showModal", showModal);
        }

        request.setAttribute("community", community);
        request.setAttribute("postList", postList);
        request.setAttribute("tagList", tagList);
        request.setAttribute("isJoined", isJoined);
        request.setAttribute("role", role);

        request.getRequestDispatcher("/WEB-INF/Pages/viewCommunity.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("communityId");
        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/error");
            return;
        }

        try {
            int communityId = Integer.parseInt(idParam);

            CommunityModel community = buildCommunityFromRequest(request, communityId);

            String error = communityManageService.updateCommunity(community);
            if (error != null) {
                reloadPageWithError(request, response, communityId, error);
                return;
            }

            response.sendRedirect(request.getContextPath() + "/community/view?id=" + communityId);

        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/error");

        } catch (SQLException e) {
            throw new ServletException("Database error updating community", e);
        }
    }

    /**
     * Builds a CommunityModel from the POST request parameters.
     */
    private CommunityModel buildCommunityFromRequest(HttpServletRequest request, int communityId)
            throws IOException, ServletException {

        String name = request.getParameter("communityName");
        String description = request.getParameter("communityDescription");
        Part imagePart = request.getPart("communityImage");

        byte[] imageBytes = null;
        if (imagePart != null && imagePart.getSize() > 0) {
            try (InputStream is = imagePart.getInputStream()) {
                imageBytes = is.readAllBytes();
            }
        }

        CommunityModel community = new CommunityModel();
        community.setId(communityId);
        community.setName(name);
        community.setDescription(description);
        community.setCommunityProfile(imageBytes);

        return community;
    }

    /**
     * Reloads the community page with an error message and the edit modal open.
     * Used when community update validation fails.
     */
    private void reloadPageWithError(HttpServletRequest request, HttpServletResponse response,
                                     int communityId, String error)
            throws ServletException, IOException {
        try {
            CommunityModel community = communityService.getCommunityByID(communityId);
            List<PostModel> postList = postService.getPostByCommunity(communityId);
            List<TagModel> tagList = tagService.getCommunityByID(communityId);

            request.setAttribute("community", community);
            request.setAttribute("postList", postList);
            request.setAttribute("tagList", tagList);

        } catch (SQLException e) {
            throw new ServletException("Database error reloading community", e);
        }

        request.setAttribute("error", error);
        request.setAttribute("showModal", "editCommunity");
        request.setAttribute("role", SessionUtil.getRole(request));

        request.getRequestDispatcher("/WEB-INF/Pages/viewCommunity.jsp").forward(request, response);
    }
}