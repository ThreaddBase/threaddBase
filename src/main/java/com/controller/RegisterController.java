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

        System.out.println("--- RegisterController doPost reached ---");

        try {
            // Text fields
            String firstName = request.getParameter("first_name");
            String lastName = request.getParameter("last_name");
            String dob = request.getParameter("dob");
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String password = request.getParameter("password");


            // Profile picture upload
            String profilePicPath = null;
            Part filePart = request.getPart("profile_pic");

            if (filePart != null && filePart.getSize() > 0) {
                ImageUtil imageUtil = new ImageUtil();
                String rootPath  = getServletContext().getRealPath("/uploads");
                String saveFolder = "profile_pics";

                // uploadImage now returns the saved filename, or null on failure
                String savedFileName = imageUtil.uploadImage(filePart, rootPath, saveFolder);

                if (savedFileName == null) {
                    throw new Exception("Image upload failed");
                }

                // Build the relative path to store in DB
                profilePicPath = "uploads/" + saveFolder + "/" + savedFileName;
            }

            System.out.println("profilePicPath: " + profilePicPath);

            // Register the user
            RegisterService service = new RegisterService();
            service.registerUser(firstName, lastName, dob, username, email, password, profilePicPath);

            System.out.println("registerUser done — redirecting to home");
            response.sendRedirect(request.getContextPath() + "/home");

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Registration Failed");
            request.setAttribute("errorMessage", "Registration failed. Please try again.");
            request.getRequestDispatcher("/WEB-INF/Pages/home.jsp").forward(request, response);
        }
    }
}