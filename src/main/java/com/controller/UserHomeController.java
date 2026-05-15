package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.CommunityModel;
import com.model.PostModel;
import com.model.TagModel;
import com.service.UserHomeService;
import com.util.SessionUtil;

/**
 * Servlet implementation class UserHomeController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/user/home" })
public class UserHomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserHomeController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    // service Objects
    UserHomeService userService = new UserHomeService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
        List<TagModel> tagList = new ArrayList<>();
        List<PostModel> postList = new ArrayList<>();
        List<CommunityModel> communityList = new ArrayList<>();
        
        // get tag id from URL param, default to 0 (All)
        String idParam = request.getParameter("id");
        int tagId = (idParam != null && !idParam.isEmpty()) ? Integer.parseInt(idParam) : 0;
        
        try {
            tagList = userService.getTag();
            communityList = userService.getTopCommunitiesNotJoined(SessionUtil.getUserId(request));
            
            if (tagId == 0) {
                postList = userService.getAllPost();        // show all posts
            } else {
                postList = userService.filterPostByTag(tagId);  // filter by tag
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        request.setAttribute("tagList", tagList);
        request.setAttribute("postList", postList);
        request.setAttribute("communityList", communityList);
        request.getRequestDispatcher("/WEB-INF/Pages/userHome.jsp").forward(request, response);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
