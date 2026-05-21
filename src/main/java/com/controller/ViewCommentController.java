package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.model.CommentModel;
import com.model.PostModel;
import com.service.BookmarkService;
import com.service.CommentService;
import com.service.PostService;
import com.service.VoteService;
import com.util.SessionUtil;

@WebServlet(asyncSupported = true, urlPatterns = { "/comment" })
public class ViewCommentController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    CommentService commentService = new CommentService();
    PostService postService = new PostService();
    VoteService voteService = new VoteService();
    BookmarkService bookmarkService = new BookmarkService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
            
            if (SessionUtil.isLoggedIn(request)) {
                int userId = SessionUtil.getUserId(request);
                post.setHasVoted(voteService.voteDAO.hasVoted(postId, userId));
                post.setHasBookmarked(bookmarkService.bookmarkDAO.hasBookmarked(postId, userId));
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

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (!SessionUtil.isLoggedIn(request)) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String postIdParam = request.getParameter("postId");
        String action = request.getParameter("action");

        if (postIdParam == null || postIdParam.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }

        int postId;
        int userId = SessionUtil.getUserId(request);

        try {
            postId = Integer.parseInt(postIdParam);
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }

        // --- VOTE ---
        if ("vote".equals(action)) {
            try {
                voteService.toggleVote(postId, userId);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            response.sendRedirect(request.getContextPath() + "/comment?postId=" + postId);
            return;
        }

        // --- BOOKMARK ---
        if ("bookmark".equals(action)) {
            try {
                bookmarkService.toggleBookmark(postId, userId);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            response.sendRedirect(request.getContextPath() + "/comment?postId=" + postId);
            return;
        }

        // --- COMMENT ---
        String message = request.getParameter("content");
        String parentIdParam = request.getParameter("parentCommentId");
        Integer parentCommentId = null;

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
                e.printStackTrace();
            }
        }

        response.sendRedirect(request.getContextPath() + "/comment?postId=" + postId);
    }
}