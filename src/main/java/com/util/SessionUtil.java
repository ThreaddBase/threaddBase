package com.util;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class SessionUtil {
	
	public static void setAttribute(HttpServletRequest request, String key, Object value) {
        HttpSession session = request.getSession();
        
        session.setAttribute(key, value);
        System.out.println(session); 
    }

    public static Object getAttribute(HttpServletRequest request, String key) {
        HttpSession session = request.getSession(false);
        System.out.print(session);
        if (session != null) {
        	System.out.println(session); 
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
}
