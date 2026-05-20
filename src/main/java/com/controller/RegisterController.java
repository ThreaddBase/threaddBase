package com.controller;

import java.io.File;
import java.io.IOException;

import com.service.RegisterService;
import com.util.ImageUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/register")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,      // 1MB
    maxFileSize = 5 * 1024 * 1024,  // 5MB
    maxRequestSize = 10 * 1024 * 1024  // 10MB
)
public class RegisterController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Text fields
            String firstName = request.getParameter("first_name");
            String lastName = request.getParameter("last_name");
            String dob = request.getParameter("dob");
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String confirmPw = request.getParameter("confirm_password");
            String terms = request.getParameter("terms");

            // Profile picture upload
            byte[] profilePic = null;
            Part filePart = request.getPart("profile_pic");
            
            if (filePart != null && filePart.getSize() > 0) {
            	
                // reads raw binary from HTTP request
            	profilePic = filePart.getInputStream().readAllBytes();
            }
            

            // Register the user
            RegisterService service = new RegisterService();

            String message = service.registerUser(
                    firstName, lastName, dob, username,
                    email, password, confirmPw, profilePic
                );
            
            
            if (terms == null) {
                request.getSession().setAttribute("message", "You must accept the Terms and Conditions");
                response.sendRedirect(request.getContextPath() + "/home#register");
                return;
            }
            
            if (message != null) {
                request.getSession().setAttribute("message", message);
                response.sendRedirect(request.getContextPath() + "/home#register");
            } else {
                request.getSession().setAttribute("success", "Registration Successful!");
                response.sendRedirect(request.getContextPath() + "/home#register");
            }
            

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Registration failed. Please try again.");
            request.getRequestDispatcher("/WEB-INF/Pages/home.jsp").forward(request, response);
        }
    }
}