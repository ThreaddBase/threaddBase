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

import com.util.SessionUtil;

/**
 * Servlet Filter implementation class AuthenticationFilter
 */
@WebFilter("/*")
public class AuthenticationFilter extends HttpFilter implements Filter {
       
	
    private static final String LOGIN = "/login";
    private static final String REGISTER = "/register";
    private static final String HOME = "/home";
    
    /**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
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

     
        Object user = SessionUtil.getAttribute(req, "loggedUser");
        boolean isLoggedIn = (user != null);

 
        boolean isPublic = path.equals(LOGIN) || path.equals(REGISTER) || path.equals(HOME);

        if (!isLoggedIn) {
            if (isPublic) {
                chain.doFilter(request, response);
            } else {
                res.sendRedirect(contextPath + HOME);
            }
        } else {
            if (isPublic) {
                res.sendRedirect(contextPath + "/main");
            } else {
                chain.doFilter(request, response);
            }
        }
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

}
