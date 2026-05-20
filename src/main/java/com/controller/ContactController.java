package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import com.model.ContactModel;
import com.service.ContactService;

/**
 * Servlet implementation class ContactController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/contact" })
public class ContactController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    ContactService contactService = new ContactService();
    
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// Access form value
	    request.getRequestDispatcher("/WEB-INF/Pages/contact.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ContactModel contact = new ContactModel();
		contact.setFirstName(request.getParameter("First_name"));
		contact.setLastName(request.getParameter("Last_name"));
		contact.setEmail(request.getParameter("email"));
		contact.setPhoneNumber(request.getParameter("Phone_number"));
		contact.setDescription(request.getParameter("descreption"));
		
		String message = null;
		try {
			message = contactService.addContact(contact);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if(message != null){
			request.setAttribute("message", message);
		}
		else{
			request.setAttribute("success", "Message Sent Successfully");
		}
		
		request.getRequestDispatcher("/WEB-INF/Pages/contact.jsp").forward(request, response);
		
	}

}
