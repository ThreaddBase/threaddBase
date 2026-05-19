package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.service.NotificationService;
import com.util.SessionUtil;

/**
 * Servlet implementation class AdminNotificationController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/admin/notification" })
public class AdminNotificationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNotificationController() {
        super();
        // TODO Auto-generated constructor stub
    }

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
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String message = request.getParameter("message");
        System.out.println("Message received: " + message);
        int adminId = SessionUtil.getUserId(request);
        
        if (message != null && !message.trim().isEmpty()) {
            NotificationService service = new NotificationService();
            service.sendNotification(message.trim(), adminId);
            System.out.println("Notification saved successfully");
        } else {
            System.out.println("Message was null or empty");
        }

        response.sendRedirect(request.getContextPath() + "/admin/dashboard");
    }
}
