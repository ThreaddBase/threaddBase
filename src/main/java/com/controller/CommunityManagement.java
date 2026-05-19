package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.model.CommunityModel;
import com.service.CommunityManagementService;
import com.util.SessionUtil;

@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,
    maxFileSize = 5 * 1024 * 1024,
    maxRequestSize = 10 * 1024 * 1024
)
@WebServlet(asyncSupported = true, urlPatterns = { "/admin/community" })
public class CommunityManagement extends HttpServlet {
    private static final long serialVersionUID = 1L;

    CommunityManagementService communityService = new CommunityManagementService();
    CommunityModel community = new CommunityModel();

    public CommunityManagement() {
        super();
    }
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Read URL param e.g. ?showModal=newCommunity
            String showModal = request.getParameter("showModal");
            
            String communityIdParam = request.getParameter("communityId");
            Boolean result = (Boolean) request.getSession().getAttribute("result");
            if (result != null) {
                request.setAttribute("result", result);
                request.getSession().removeAttribute("result"); // clear so it doesn't reappear on refresh
            }
            if (communityIdParam != null && !communityIdParam.trim().isEmpty()) {
            	
            	
                request.setAttribute("communityId", Integer.parseInt(communityIdParam));
            }
            
            if (showModal != null) {
                request.setAttribute("showModal", showModal);
            }
            
            String filterCommunity = request.getParameter("filterCommunity");
            if (filterCommunity == null) filterCommunity = "all";

            List<CommunityModel> communities = communityService.getFilteredCommunities(filterCommunity);
            request.setAttribute("communityList", communities);
            request.setAttribute("selectedFilter", filterCommunity);
            request.getRequestDispatcher("/WEB-INF/Pages/communityManagement.jsp").forward(request, response);

        } catch (SQLException e) {
            throw new ServletException("Database error in CommunityManagementController", e);
        }
        
       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Route to correct handler based on hidden action field
        String action = request.getParameter("action");
        String filterCommunity = request.getParameter("filterCommunity");

        if (filterCommunity != null) {
            doGet(request, response);          // filter dropdown → reload with sort
        } else if ("delete".equals(action)) {
            deleteCommunity(request, response);
        } else {
            createCommunity(request, response);
        }
    }
    
    
    
    private void createCommunity(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
         int createdBy = SessionUtil.getUserId(request);

         community.setName(request.getParameter("communityName"));
         community.setDescription(request.getParameter("communityDescription"));

         // Image upload
         try {
             Part filePart = request.getPart("communityImage");
             if (filePart != null && filePart.getSize() > 0) {
                 community.setCommunityProfile(filePart.getInputStream().readAllBytes());
             }
         } catch (IOException e) {
             communityCreationError(request, response, "Failed to read uploaded image."); // fixed: was doGet
             return;
         }

         try {
             String error;
             if (community.getRequestID() > 0) {
                 error = communityService.createCommunityWithRequestID(createdBy, community);
             } else {
                 error = communityService.createCommunity(createdBy, community);
             }

             if (error != null) {
             	communityCreationError(request, response, error);
                 return;
             }

             response.sendRedirect(request.getContextPath() + "/admin/community");

         } catch (SQLException e) {
             throw new ServletException("Database error creating community.", e);
         }
    }
    
    private void deleteCommunity(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int communityId = Integer.parseInt(request.getParameter("communityId"));
            boolean result = communityService.deleteCommunity(communityId);
            request.getSession().setAttribute("result", result);
            response.sendRedirect(request.getContextPath() + "/admin/community");

        } catch (NumberFormatException e) {
            throw new ServletException("Invalid community ID for deletion.", e);
        } catch (SQLException e) {
            throw new ServletException("Database error deleting community.", e);
        }
    }

    // Forwards back to the page with modal open and error visible in class
    private void communityCreationError(HttpServletRequest request, HttpServletResponse response, String error) throws ServletException, IOException {
        try {
            List<CommunityModel> communities = communityService.getAllCommunity();
            request.setAttribute("communityList", communities);
        } catch (SQLException e) {
            throw new ServletException("Database error reloading communities.", e);
        }

        request.setAttribute("error", error);
        request.setAttribute("showModal", "newCommunity");
        request.getRequestDispatcher("/WEB-INF/Pages/communityManagement.jsp").forward(request, response);
    }
    
}