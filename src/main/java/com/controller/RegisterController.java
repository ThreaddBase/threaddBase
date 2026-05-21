package com.controller;

import java.io.IOException;
import com.service.RegisterService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/register")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,
    maxFileSize = 5 * 1024 * 1024,
    maxRequestSize = 10 * 1024 * 1024
)
public class RegisterController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            
            String terms = request.getParameter("terms");
            if (terms == null) {
                request.getSession().setAttribute("message", "You must accept the Terms and Conditions");
                response.sendRedirect(request.getContextPath() + "/home#register");
                return;
            }

            // Text fields
            String firstName  = request.getParameter("first_name");
            String lastName   = request.getParameter("last_name");
            String dob        = request.getParameter("dob");
            String username   = request.getParameter("username");
            String email      = request.getParameter("email");
            String password   = request.getParameter("password");
            String confirmPw  = request.getParameter("confirm_password");

            // Profile picture
            byte[] profilePic = null;
            Part filePart = request.getPart("profile_pic");
            if (filePart != null && filePart.getSize() > 0) {
                profilePic = filePart.getInputStream().readAllBytes();
            }

            // Call service
            RegisterService service = new RegisterService();
            String message = service.registerUser(
                firstName, lastName, dob, username,
                email, password, confirmPw, profilePic
            );

            if (message != null) {
                // ✅ Validation error from service
                request.getSession().setAttribute("message", message);
                response.sendRedirect(request.getContextPath() + "/home#register");
            } else {
                // ✅ Success
                request.getSession().setAttribute("success", "Registration Successful!");
                response.sendRedirect(request.getContextPath() + "/home#register");
            }

        } catch (Exception e) {
            e.printStackTrace();
            // ✅ Use session + redirect so the response isn't already committed
            request.getSession().setAttribute("message", "Registration failed: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/home#register");
        }
    }
}