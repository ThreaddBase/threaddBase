package com.util;

import  jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.Arrays;

public class CookieUtil {

	public static void addCookie(HttpServletResponse response, String name, String value, int maxAge) {
		// TODO Auto-generated constructor stub
		Cookie cookie = new Cookie(name,value);
		cookie.setMaxAge(maxAge);
		cookie.setPath("/");
		response.addCookie(cookie);
	}
	public static Cookie getCookie(HttpServletRequest request, String name) {
		if (request.getCookies() != null) {
			return Arrays.stream(request.getCookies())
					.filter(cookie -> name.equals(cookie.getName()))
					.findFirst()
					.orElse(null);
		}
		return null;
	}
		
	public static void deleteCookie(HttpServletResponse response,String name) {
		Cookie cookie = new Cookie(name,null);
		cookie.setMaxAge(0); // deletes a cookie by setting its maxAge to 0
		cookie.setPath("/"); // available through out the program
		response.addCookie(cookie);
	
	}
}