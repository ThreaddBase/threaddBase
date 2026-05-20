package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.service.PostReportService;
import com.util.SessionUtil;

/**
 * Servlet implementation class PostReport
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/post/report" })
public class PostReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostReportController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    PostReportService postReportService = new PostReportService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (!SessionUtil.isLoggedIn(request)) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        // fetch data
        String subject = request.getParameter("subject");
        String description = request.getParameter("description");
        String reportedIdParam  = request.getParameter("reportedPostId");
        
        int reportedPostId = 0;
        if (reportedIdParam != null && !reportedIdParam.isEmpty()) {
            try {
            	reportedPostId = Integer.parseInt(reportedIdParam);
            } catch (NumberFormatException e) {
                response.sendRedirect(request.getContextPath() + "/home");
                return;
            }
        }
        
        String redirectUrl = request.getContextPath() + "/user/home";

        // submit report
        String error = postReportService.addReport(reportedPostId, subject, description);

        if (error != null) {
            request.getSession().setAttribute("reportError", error);
        } else {
            request.getSession().setAttribute("reportSuccess", "Report submitted successfully.");
        }

        // redirect back to the reported user's profile
        response.sendRedirect(redirectUrl);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
