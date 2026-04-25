package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;


/**
 * Servlet implementation class AdminEditController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/adminEdit" })
public class AdminEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminEditController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/Pages/adminEdit.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// IMAGE upload
		
		Part filePart = request.getPart("image");
		
		String fileName = (filePart != null) ? filePart.getSubmittedFileName() : null;
		String imagePath;

		if (fileName != null && !fileName.isEmpty()) {
		    imagePath = "uploads/" + fileName;
		} else {
		    imagePath = "uploads/default.png";
		}
		
	}

}
