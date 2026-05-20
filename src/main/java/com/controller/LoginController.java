package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.util.CookieUtil;
import com.util.SessionUtil;
import com.model.LoginModel;
import com.model.UserModel;
import com.service.LoginService;


/**
 * Servlet implementation class LoginController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/login" })
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		SessionUtil.getAttribute(request, "loggeduser");
		request.getRequestDispatcher("/WEB-INF/Pages/login.jsp").include(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	        throws ServletException, IOException {

	    String username = request.getParameter("Username");
	    String password = request.getParameter("Password");
	    String rememberMe = request.getParameter("rememberMe"); // "on" if checked, null if not

	    try {
	        LoginService service = new LoginService();
	        LoginModel user = service.authenticate(username, password);

	        if (user != null) {
	            SessionUtil.setLoggedUser(request, user);

	            // Remember Me cookie logic
	            if ("on".equals(rememberMe)) {
	                CookieUtil.addCookie(response, "rememberedUser", username, 30 * 24 * 60 * 60);
	            } else {
	                CookieUtil.deleteCookie(response, "rememberedUser");
	            }

	            redirectByRole(request, response);

	        } else {
	            // Login failed — go back to home with popup open
	            request.setAttribute("loginError", true);
	            request.setAttribute("showLogin", true);
	            request.getRequestDispatcher("/WEB-INF/Pages/home.jsp").forward(request, response);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        request.setAttribute("loginError", true);
	        request.setAttribute("showLogin", true);
	        request.getRequestDispatcher("/WEB-INF/Pages/home.jsp").forward(request, response);
	    }
	}
	
	private void redirectByRole(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String base = request.getContextPath();
        if (SessionUtil.hasRole(request, SessionUtil.ROLE_ADMIN)) {
            response.sendRedirect(base + "/admin/dashboard");
        } else {
            response.sendRedirect(base + "/user/home");
        }
    }

}
