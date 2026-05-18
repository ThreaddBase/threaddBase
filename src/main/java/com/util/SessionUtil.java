package com.util;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class SessionUtil {
	
    public static final String ROLE_ADMIN = "ADMIN";
    public static final String ROLE_USER  = "USER";
	
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
    
    public static void setLoggedUser(HttpServletRequest request, String username, String role) {
        // Invalidate old session first to prevent session fixation
        HttpSession old = request.getSession(false);
        if (old != null) old.invalidate();

        HttpSession session = request.getSession(true);
        session.setAttribute("loggedUser", username);
        session.setAttribute("userRole",   role);
        session.setMaxInactiveInterval(30 * 60); // 30 minutes
    }

    public static String getLoggedUser(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null) return null;
        return (String) session.getAttribute("loggedUser");
    }

    public static String getRole(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null) return null;
        return (String) session.getAttribute("userRole");
    }

    public static boolean isLoggedIn(HttpServletRequest request) {
        return getLoggedUser(request) != null;
    }

    public static boolean hasRole(HttpServletRequest request, String role) {
        return role.equalsIgnoreCase(getRole(request));
    }
}



//
//package com.util;
//
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpSession;
//
//public class SessionUtil {
//
//    public static final String ROLE_ADMIN = "ADMIN";
//    public static final String ROLE_USER  = "USER";
//
//    public static void setAttribute(HttpServletRequest request, String key, Object value) {
//        HttpSession session = request.getSession();
//        session.setAttribute(key, value);
//    }
//
//    public static Object getAttribute(HttpServletRequest request, String key) {
//        HttpSession session = request.getSession(false);
//        if (session != null) return session.getAttribute(key);
//        return null;
//    }
//
//    public static void invalidate(HttpServletRequest request) {
//        HttpSession session = request.getSession(false);
//        if (session != null) session.invalidate();
//    }
//
//    public static void setLoggedUser(HttpServletRequest request, String username, String role, int userId) {
//        HttpSession old = request.getSession(false);
//        if (old != null) old.invalidate();
//        HttpSession session = request.getSession(true);
//        session.setAttribute("loggedUser", username);
//        session.setAttribute("userRole",   role);
//        session.setAttribute("userId",     userId);
//        session.setMaxInactiveInterval(30 * 60);
//    }
//
//    public static String getLoggedUser(HttpServletRequest request) {
//        HttpSession session = request.getSession(false);
//        if (session == null) return null;
//        return (String) session.getAttribute("loggedUser");
//    }
//
//    public static String getRole(HttpServletRequest request) {
//        HttpSession session = request.getSession(false);
//        if (session == null) return null;
//        return (String) session.getAttribute("userRole");
//    }
//
//    public static int getUserId(HttpServletRequest request) {
//        HttpSession session = request.getSession(false);
//        if (session == null) return -1;
//        Integer userId = (Integer) session.getAttribute("userId");
//        return userId != null ? userId : -1;
//    }
//
//    public static boolean isLoggedIn(HttpServletRequest request) {
//        return getLoggedUser(request) != null;
//    }
//
//    public static boolean hasRole(HttpServletRequest request, String role) {
//        return role.equalsIgnoreCase(getRole(request));
//    }
}