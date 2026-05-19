package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.service.UserReportService;
import com.util.SessionUtil;

/**
 * Servlet implementation class UserReportController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/user/report" })
public class UserReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserReportController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    UserReportService userReportService = new UserReportService();
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// check session
        if (!SessionUtil.isLoggedIn(request)) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        // fetch data
        String subject = request.getParameter("subject");
        String description = request.getParameter("description");
        String reportedIdParam = request.getParameter("reportedUserId");
        
        int reportedUserId = 0;
        if (reportedIdParam != null && !reportedIdParam.isEmpty()) {
            try {
                reportedUserId = Integer.parseInt(reportedIdParam);
            } catch (NumberFormatException e) {
                response.sendRedirect(request.getContextPath() + "/home");
                return;
            }
        }
        
        String redirectUrl = request.getContextPath() + "/user?id=" + reportedUserId;

        // submit report
        String error = userReportService.addReport(reportedUserId, subject, description);

        if (error != null) {
            request.getSession().setAttribute("reportError", error);
        } else {
            request.getSession().setAttribute("reportSuccess", "Report submitted successfully.");
        }

        // redirect back to the reported user's profile
        response.sendRedirect(redirectUrl);
        
	}

}
