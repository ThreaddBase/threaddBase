package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.model.CommentModel;
import com.model.PostModel;
import com.service.CommentService;
import com.service.PostService;
import com.util.SessionUtil;

/**
 * Servlet implementation class ViewCommentController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/comment" })
public class ViewCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewCommentController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    CommentService commentService = new CommentService();
    PostService postService = new PostService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String postIdParam = request.getParameter("postId");
		String replyToParam = request.getParameter("replyTo");
		
        if (postIdParam == null || postIdParam.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }

        try {
            int postId = Integer.parseInt(postIdParam);

            PostModel post = postService.getPostById(postId);
            List<CommentModel> comments = commentService.getCommentsByPostId(postId);

            if (post == null) {
                response.sendRedirect(request.getContextPath() + "/home");
                return;
            }
            
            if (replyToParam != null && !replyToParam.isEmpty()) {
                request.setAttribute("replyTo", Integer.parseInt(replyToParam));
            }

            request.setAttribute("post", post);
            request.setAttribute("comments", comments);
            request.getRequestDispatcher("/WEB-INF/Pages/viewComment.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/home");
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Failed to load comments.");
            request.getRequestDispatcher("/WEB-INF/Pages/viewComment.jsp").forward(request, response);
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    // use SessionUtil instead of raw session check
    if (!SessionUtil.isLoggedIn(request)) {
        response.sendRedirect(request.getContextPath() + "/login");
        return;
    }

    String message = request.getParameter("content");
    String postIdParam = request.getParameter("postId");
    String parentIdParam = request.getParameter("parentCommentId");

    if (postIdParam == null || postIdParam.isEmpty()) {
        response.sendRedirect(request.getContextPath() + "/home");
        return;
    }

    int postId = 0;
    int userId = SessionUtil.getUserId(request); // already works correctly
    Integer parentCommentId = null;

    try {
        postId = Integer.parseInt(postIdParam);
    } catch (NumberFormatException e) {
        response.sendRedirect(request.getContextPath() + "/home");
        return;
    }

    if (parentIdParam != null && !parentIdParam.isEmpty()) {
        try {
            parentCommentId = Integer.parseInt(parentIdParam);
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/comment?postId=" + postId);
            return;
        }
    }

    String error = null;
	try {
		error = commentService.addComment(postId, userId, message, parentCommentId);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

    if (error != null) {
        request.setAttribute("error", error);
        try {
			request.setAttribute("post", postService.getPostById(postId));
			request.setAttribute("comments", commentService.getCommentsByPostId(postId));
			request.getRequestDispatcher("/WEB-INF/Pages/viewComment.jsp").forward(request, response);
			return;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

    response.sendRedirect(request.getContextPath() + "/comment?postId=" + postId);
}
	
}
