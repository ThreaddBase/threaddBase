package com.controller;

import com.model.UserModel;
import com.service.ProfileService;
import com.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(asyncSupported = true, urlPatterns = { "/member/edit"})
@MultipartConfig(
fileSizeThreshold = 1024 * 1024 * 1,  // 1 MB
maxFileSize = 1024 * 1024 * 5,       // 5 MB
maxRequestSize = 1024 * 1024 * 10    // 10 MB
)
public class UserEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private final ProfileService service = new ProfileService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        if (!SessionUtil.hasRole(req, SessionUtil.ROLE_MEMBER)) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        int memberId = SessionUtil.getUserId(req);

        try {
            UserModel member = service.getUserById(memberId);
            req.setAttribute("user", member);
            req.setAttribute("formAction", req.getContextPath() + "/member/edit");
            req.setAttribute("backURL", req.getContextPath() + "/user");
            req.getRequestDispatcher("/WEB-INF/Pages/editProfile.jsp")
               .forward(req, resp);

        } catch (Exception e) {
            throw new ServletException("DB Error: " + e.getMessage(), e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        if (!SessionUtil.hasRole(req, SessionUtil.ROLE_MEMBER)) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        int memberId = SessionUtil.getUserId(req);

        try {
            // UPDATE PROFILE
            service.updateProfile(
                memberId,
                req.getParameter("firstName"),
                req.getParameter("lastName"),
                req.getParameter("username"),
                req.getParameter("dob"),
                req.getParameter("bio")
            );

            // UPDATE PROFILE PICTURE
            Part picPart = req.getPart("profilePicture");

            if (picPart != null && picPart.getSize() > 0) {

                service.updateProfilePicture(
                    memberId,
                    picPart.getInputStream().readAllBytes()
                );
            }

            // UPDATE PASSWORD ONLY IF FILLED
            String currentPass = req.getParameter("currentPass");
            String newPass = req.getParameter("newPass");
            String retypePass = req.getParameter("retypePass");

            if (currentPass != null && !currentPass.isBlank()
                    && newPass != null && !newPass.isBlank()
                    && retypePass != null && !retypePass.isBlank()) {

                String result = service.changePassword(
                	memberId,
                    currentPass,
                    newPass,
                    retypePass
                );

                if (!"success".equals(result)) {

                    req.setAttribute("passError", result);
                    req.setAttribute("member", service.getUserById(memberId));

                    req.getRequestDispatcher("/WEB-INF/Pages/editProfile.jsp")
                       .forward(req, resp);

                    return;
                }
            }

            resp.sendRedirect(req.getContextPath()
                              + "/member/edit?msg=updated");

        } catch (Exception e) {
            throw new ServletException("DB Error: " + e.getMessage(), e);
        }
    }
}