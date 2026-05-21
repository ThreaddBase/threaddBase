package com.controller;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import com.model.LoginModel;
import com.service.CommentVoteService;
import com.service.UserManagementService;
import com.util.SessionUtil;

/**
 * Servlet implementation class CommentVoteController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/commentVote" })
public class CommentVoteController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UserManagementService userService = new UserManagementService();
    public CommentVoteService commentVoteService = new CommentVoteService();

    public CommentVoteController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // get logged in user from session
        LoginModel user = SessionUtil.getLoggedUser(request);
        String username = user.getUsername();

        if (username == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String commentIdParam = request.getParameter("commentId");
        String postIdParam    = request.getParameter("postId");

        if (commentIdParam == null || postIdParam == null) {
            response.sendRedirect(request.getContextPath() + "/error");
            return;
        }

        try {
            int commentId = Integer.parseInt(commentIdParam);
            int userId    = userService.getUserIdByUsername(username);

            if (userId == -1) {
                response.sendRedirect(request.getContextPath() + "/error");
                return;
            }

            // true = vote added | false = vote removed
            boolean voted = commentVoteService.toggleVote(commentId, userId);
            System.out.println("Comment vote toggled: " + voted + " | Comment: " + commentId + " | User: " + userId);

            String referer = request.getHeader("Referer");

            // redirect back to where the user came from
            if (referer != null) {
                response.sendRedirect(referer);
            } else {
                response.sendRedirect(request.getContextPath() + "/home");
            }

        } catch (SQLException e) {
            throw new ServletException("Database error in CommentVoteController", e);
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/error");
        }
    }
}