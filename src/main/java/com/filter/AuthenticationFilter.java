package com.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.util.CookieUtil;
import com.util.SessionUtil;

/**
 * Servlet Filter implementation class AuthenticationFilter
 */
@WebFilter("/*")
public class AuthenticationFilter extends HttpFilter implements Filter {
       
	// Public pages
    private static final String LOGIN   = "/login";
    private static final String REGISTER = "/register";
    private static final String HOME = "/home";
    private static final String CONTACT = "/contact";
    private static final String ABOUTUS = "/aboutUS";
    private static final String LOGOUT = "/logout";
    private static final String ERROR = "/error";

    // ADMIN allowed URIs
    private String[] adminURIs = {
    	"/admin",
    	"/admin/edit",
        "/admin/dashboard",
        "/admin/community",
        "/admin/userManagement"        
    };

    // USER allowed URIs
    private String[] userURIs = {
        "/user/home",
        "/user/bookmark",
        "/community",
        "/user/joined",
        "/user/notification",
        "/user",
        "/user/setting",
        "/community/view",
        "/user/edit",
        "/comment"
    };
    
    /**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	} 

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	
    // ── Check if path exists in allowed array ────────────────
    private boolean isAllowed(String path, String[] allowedArray) {
        for (int i = 0; i < allowedArray.length; i++) {
            if (path.startsWith(allowedArray[i])) {
                return true;  //  match found
            }
        }
        return false;
    }
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String uri = req.getRequestURI();
        String contextPath = req.getContextPath(); //URL - URI
        String path = uri.substring(contextPath.length());
        

        if (path.startsWith("/resources/") || path.endsWith(".css") || path.endsWith(".js") || path.endsWith(".png") || path.endsWith(".jpg")   || path.startsWith("/WEB-INF")) {

            chain.doFilter(request, response);
            return;
        }
        
        if (path.equals(ERROR) || path.equals(LOGOUT)) {
            chain.doFilter(request, response); // looping in error page and logout page fix
            return;
        }
     
        Object user = SessionUtil.getAttribute(req, "loggedUser");
        String role = (String) SessionUtil.getRole(req);
        boolean isLoggedIn = (user != null);
        
        
        if (role != null) {
            role = role.toUpperCase(); // case issues solved
        }
        
 
        boolean isPublic = path.equals(LOGIN) || path.equals(REGISTER) || path.equals(HOME) || path.equals(ABOUTUS) || path.equals(CONTACT) || path.equals(ERROR) || path.equals(LOGOUT);
        boolean isAccessed = path.equals(LOGIN) || path.equals(REGISTER) || path.equals(HOME);
        if (!isLoggedIn) {
            if (isPublic) {
                chain.doFilter(request, response);
            } else {
                res.sendRedirect(contextPath + HOME);
            }
         return;
        }

        // Logged in but trying to access login/register/home
        if (isAccessed) {
            if ("ADMIN".equals(role)) {
                res.sendRedirect(contextPath + "/admin/dashboard");
            } else {
                res.sendRedirect(contextPath + "/user/home");
            }
            return;
        }
        
        // Role-based access check
        if ("ADMIN".equals(role)) { // admin role check
            if (isAllowed(path, adminURIs)) {
                chain.doFilter(request, response);  // admin allowed
            } else {
                res.sendRedirect(contextPath + "/error"); // redirect to 404
            }

        } else if ("MEMBER".equals(role)) { // user role check
            if (isAllowed(path, userURIs)) {
                chain.doFilter(request, response);  // user allowed
            } else {
                res.sendRedirect(contextPath + "/error"); // redirect to 404
            }

        } else {
            // Unknown role → logout and go home
            res.sendRedirect(contextPath + "/logout");
        }
        System.out.println(">>> PATH: [" + path + "] | ROLE: [" + role + "] | LOGGED IN: [" + isLoggedIn + "]"); // check user path, role and islogged or not
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

}
