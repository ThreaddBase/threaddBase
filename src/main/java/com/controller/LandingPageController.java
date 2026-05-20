package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.util.CookieUtil;

/**
 * Servlet implementation class Home
 */
@WebServlet(asyncSupported = true, name = "HomeController", urlPatterns = { "/home" })
public class LandingPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public LandingPageController() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String showLogin = request.getParameter("showLogin");
        if ("true".equals(showLogin)) {
            request.setAttribute("showLogin", true);
        }

        // ── Read remember me cookie and pass to JSP ──
        Cookie rememberedUser = CookieUtil.getCookie(request, "rememberedUser");
        if (rememberedUser != null) {
            request.setAttribute("rememberedUsername", rememberedUser.getValue());
        }

        request.getRequestDispatcher("/WEB-INF/Pages/home.jsp").forward(request, response);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
