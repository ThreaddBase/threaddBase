package com.util;

import com.model.LoginModel;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class SessionUtil {
	
    public static final String ROLE_ADMIN = "ADMIN";
    public static final String ROLE_USER  = "USER";
    public static final String ROLE_MEMBER = "MEMBER";
	
	public static void setAttribute(HttpServletRequest request, String key, Object value) {
        HttpSession session = request.getSession();
        session.setAttribute(key, value);
    }

    public static Object getAttribute(HttpServletRequest request, String key) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            return session.getAttribute(key);
        }
        return null;
    }

    public static void invalidate(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        
        if (session != null) {
            session.invalidate();
        }
    }
    
    public static void setLoggedUser(HttpServletRequest request, LoginModel user) {
        HttpSession old = request.getSession(false);
        if (old != null) old.invalidate();
        HttpSession session = request.getSession(true);
        session.setAttribute("loggedUser", user); // store full object
        session.setMaxInactiveInterval(30 * 60);
    }

    public static LoginModel getLoggedUser(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null) return null;
        return (LoginModel) session.getAttribute("loggedUser");
    }

    public static int getUserId(HttpServletRequest request) {
        LoginModel user = getLoggedUser(request);
        return user != null ? user.getId() : 0;
    }

    public static String getRole(HttpServletRequest request) {
        LoginModel user = getLoggedUser(request);
        return user != null ? user.getUserRole() : null;
    }

    public static boolean isLoggedIn(HttpServletRequest request) {
        return getLoggedUser(request) != null;
    }

    public static boolean hasRole(HttpServletRequest request, String role) {
        LoginModel user = getLoggedUser(request);
        return user != null && role.equalsIgnoreCase(user.getUserRole());
    }
}
