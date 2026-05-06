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
import com.model.PostModel;
import com.service.CommunityService;
import com.service.PostService;
import com.util.SessionUtil;

@WebServlet(asyncSupported = true, urlPatterns = { "/community/view" })
public class ViewCommunityController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Service Ibjects
    private CommunityService communityService = new CommunityService();
    private PostService postService = new PostService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // check role
        String role = (String) SessionUtil.getRole(request);

        // get community ID by URL (Guess)
        String idParam = request.getParameter("id");
        System.out.println("Community ID: " + idParam);

        // validation
        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/error");
            return;
        }

        try {
            int communityId = Integer.parseInt(idParam);

            // fetch community
            CommunityModel community = communityService.getCommunityByID(communityId);

            if (community == null) {
                response.sendRedirect(request.getContextPath() + "/error");
                return;
            }

            // fetch posts
            List<PostModel> postList = postService.getPostByCommunity(communityId);
            System.out.println("Posts found: " + postList.size());
            
            // fetch tags

            // pass to JSP
            request.setAttribute("community", community);
            request.setAttribute("postList", postList);
            request.setAttribute("role", role);

            request.getRequestDispatcher("/WEB-INF/Pages/viewCommunity.jsp")
                   .forward(request, response);

        } catch (NumberFormatException e) {
            System.out.println("Invalid community ID: " + idParam);
            response.sendRedirect(request.getContextPath() + "/error");

        } catch (SQLException e) {
            throw new ServletException("Database error in ViewCommunityController", e);
        }
    }
}