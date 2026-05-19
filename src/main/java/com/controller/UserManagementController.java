package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;


import com.model.UserModel;
import com.service.UserManagementService;


@WebServlet(asyncSupported = true, urlPatterns = { "/admin/userManagement" })
public class UserManagementController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UserManagementService userManagementService = new UserManagementService();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
        	String filterStatus = request.getParameter("filterStatus");
        	
            if (filterStatus == null) filterStatus = "all";

            List<UserModel> userList = userManagementService.getFilteredUsers(filterStatus);
            request.setAttribute("userList", userList);
            request.setAttribute("selectedFilter", filterStatus);

            request.getRequestDispatcher("/WEB-INF/Pages/userMonitor.jsp")
                   .forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Database error in UserManagementController", e);
        
        }
       
    }
        
       
       
       

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("updateStatus".equals(action)) {
            String userId = request.getParameter("userId");
            String status = request.getParameter("status");

           // to handle when no user and status
            if (userId == null || status == null || userId.isBlank() || status.isBlank()) {
                response.sendRedirect(request.getContextPath() + "/admin/userManagement");
                return;
            }

            //  select value and DB value
            String statusValue;
            switch (status.toLowerCase()) {
                case "active": statusValue = "Active"; break;
                case "banned": statusValue = "Banned"; break;
                default:
                    response.sendRedirect(request.getContextPath() + "/admin/userManagement");
                    return;
            }

            
            try {
                int user_Id = Integer.parseInt(userId);
                boolean success = userManagementService.updateStatus(user_Id, statusValue);
                request.getSession().setAttribute("statusMessage",
                    success
                        ? "User status updated to " + statusValue + "."
                        : "Failed to update status.");
            } catch (NumberFormatException e) {
                throw new ServletException("Invalid userId: " + userId, e);
            } catch (SQLException e) {
                throw new ServletException("Database error updating user status", e);
            }

            response.sendRedirect(request.getContextPath() + "/admin/userManagement");
            return;
        }

        doGet(request, response);
    }
}