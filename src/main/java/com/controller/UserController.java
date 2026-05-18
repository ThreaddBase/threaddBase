package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.model.PostModel;
import com.model.UserModel;
import com.service.PostService;
import com.service.ProfileService;
import com.util.SessionUtil;
/**
 * Servlet implementation class UserController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/user" })
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    ProfileService profileService = new ProfileService();
    PostService postService = new PostService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int loggedInUserId = SessionUtil.getUserId(request);
        String idParam = request.getParameter("id");

        // default to own profile if no id given
        int viewUserId = (idParam != null && !idParam.isEmpty()) ? Integer.parseInt(idParam) : loggedInUserId;

        try {
            UserModel user = profileService.getUserById(viewUserId);
            List<PostModel> postList = postService.getPostByUserId(viewUserId);
            
            request.setAttribute("user", user);
            request.setAttribute("loggedInUserId", loggedInUserId);
            request.setAttribute("postList", postList);
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher("/WEB-INF/Pages/profile.jsp").forward(request, response);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
