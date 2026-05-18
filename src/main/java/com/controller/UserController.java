//package com.controller;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import java.io.IOException;
///**
// * Servlet implementation class UserController
// */
//@WebServlet(asyncSupported = true, urlPatterns = { "/user" })
//public class UserController extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//       
//    /**
//     * @see HttpServlet#HttpServlet()
//     */
//    public UserController() {
//        super();
//        // TODO Auto-generated constructor stub
//    }
//
//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		request.getRequestDispatcher("/WEB-INF/Pages/profile.jsp").forward(request, response);
//		
//	}
//
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}
//
//}



//package com.controller;
//
//import com.model.PostModel;
//import com.service.PostService;
//
//import jakarta.servlet.*;
//import jakarta.servlet.http.*;
//import jakarta.servlet.annotation.*;
//
//import java.io.IOException;
//import java.util.List;
//
//@WebServlet("/user")
//public class UserController extends HttpServlet {
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        System.out.println("✔ USER CONTROLLER HIT");
//
//        try {
//
//            HttpSession session = request.getSession(false);
//
//            if (session == null || session.getAttribute("userId") == null) {
//                response.sendRedirect(request.getContextPath() + "/login");
//                return;
//            }
//
//            int userId = (int) session.getAttribute("userId");
//
//            PostService service = new PostService();
//
//            List<PostModel> posts = service.getPostByUser(userId);
//
//            request.setAttribute("posts", posts);
//
//            // IMPORTANT: absolute correct forward
//            RequestDispatcher rd =
//                    request.getRequestDispatcher("/WEB-INF/Pages/profile.jsp");
//
//            rd.forward(request, response);
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//}



package com.controller;

import com.model.PostModel;
import com.service.PostService;
import com.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(asyncSupported = true, urlPatterns = { "/user" })
public class UserController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private PostService postService = new PostService();

    public UserController() { super(); }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getSession(false) == null ||
            request.getSession(false).getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        int userId = SessionUtil.getUserId(request);
        System.out.println(">>> userId: " + userId);  // ADD THIS LINE

        try {
            List<PostModel> userPosts = postService.getUserPosts(userId);
            request.setAttribute("userPosts", userPosts);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher("/WEB-INF/Pages/profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}