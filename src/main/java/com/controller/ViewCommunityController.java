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

@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024,
	    maxFileSize = 5 * 1024 * 1024,
	    maxRequestSize = 10 * 1024 * 1024
	)
@WebServlet(asyncSupported = true, urlPatterns = { "/community/view" })
public class ViewCommunityController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Service objects
    private CommunityService communityService = new CommunityService();
    private CommunityManagementService communityManageService = new CommunityManagementService();
    private PostService postService = new PostService();
    private TagService tagService = new TagService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	String showModal = request.getParameter("showModal");
    	if (showModal != null) {
    		request.setAttribute("showModal", showModal);
    	}
    	
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
            List<TagModel> tagList = tagService.getCommunityByID(communityId);
            
            
            // pass to JSP
            request.setAttribute("community", community);
            request.setAttribute("postList", postList);
            request.setAttribute("tagList", tagList);
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
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("communityId");
        if (idParam == null || idParam.isEmpty()) {
        	System.out.println(idParam+ "not found");
            response.sendRedirect(request.getContextPath() + "/error");
            return;
        }

        try {
            int communityId    = Integer.parseInt(idParam);
            String name        = request.getParameter("communityName");
            String description = request.getParameter("communityDescription");
            Part imagePart     = request.getPart("communityImage");
            
            System.out.println(communityId);
            System.out.println(name);
            System.out.println(description);
            System.out.println(imagePart);
            
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

            String updated = communityManageService.updateCommunity(community);

            response.sendRedirect(request.getContextPath()
                + "/community/view?id=" + communityId);

        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/error");
        } catch (SQLException e) {
            throw new ServletException("DB error updating community", e);
        }
    }
    
}