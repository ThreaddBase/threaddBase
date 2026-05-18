package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.model.NotificationModal;
import com.service.NotificationService;

@WebServlet("/admin/notification")
public class AdminNotificationController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String message = request.getParameter("message");
        System.out.println("Message received: " + message); // ← check Tomcat console

        if (message != null && !message.trim().isEmpty()) {
            NotificationService service = new NotificationService();
            service.sendNotification(message.trim(), 1); // hardcoded adminId=1 for now
            System.out.println("Notification saved successfully");
        } else {
            System.out.println("Message was null or empty");
        }

        response.sendRedirect(request.getContextPath() + "/admin/dashboard");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/admin/dashboard");
    }
}