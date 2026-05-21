package com.controller;

import com.model.UserModel;
import com.service.ProfileService;
import com.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(asyncSupported = true, urlPatterns = { "/admin/edit" })
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1,
    maxFileSize = 1024 * 1024 * 5,
    maxRequestSize = 1024 * 1024 * 10
)
public class AdminEditController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final ProfileService service = new ProfileService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        if (!SessionUtil.hasRole(req, SessionUtil.ROLE_ADMIN)) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        int adminId = SessionUtil.getUserId(req);

        try {
            UserModel admin = service.getUserById(adminId);
            req.setAttribute("user", admin);
            req.setAttribute("formAction", req.getContextPath() + "/admin/edit");
            req.setAttribute("backURL", req.getContextPath() + "/admin");
            req.getRequestDispatcher("/WEB-INF/Pages/editProfile.jsp").forward(req, resp);
        } catch (Exception e) {
            throw new ServletException("DB Error: " + e.getMessage(), e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        if (!SessionUtil.hasRole(req, SessionUtil.ROLE_ADMIN)) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        int adminId = SessionUtil.getUserId(req);

        try {
            // VALIDATE PROFILE FIELDS
            String profileError = service.validateProfile(
                req.getParameter("firstName"),
                req.getParameter("lastName"),
                req.getParameter("username"),
                req.getParameter("dob"),
                req.getParameter("bio")
            );
            if (profileError != null) {
                req.setAttribute("profileError", profileError);
                req.setAttribute("user", service.getUserById(adminId));
                req.setAttribute("formAction", req.getContextPath() + "/admin/edit");
                req.setAttribute("backURL", req.getContextPath() + "/admin");
                req.getRequestDispatcher("/WEB-INF/Pages/editProfile.jsp").forward(req, resp);
                return;
            }

            // VALIDATE PROFILE PICTURE
            Part picPart = req.getPart("profilePicture");
            String picError = service.validateProfilePicture(picPart);
            if (picError != null) {
                req.setAttribute("profileError", picError);
                req.setAttribute("user", service.getUserById(adminId));
                req.setAttribute("formAction", req.getContextPath() + "/admin/edit");
                req.setAttribute("backURL", req.getContextPath() + "/admin");
                req.getRequestDispatcher("/WEB-INF/Pages/editProfile.jsp").forward(req, resp);
                return;
            }

            // UPDATE PROFILE
            service.updateProfile(
                adminId,
                req.getParameter("firstName"),
                req.getParameter("lastName"),
                req.getParameter("username"),
                req.getParameter("dob"),
                req.getParameter("bio")
            );

            // UPDATE PROFILE PICTURE
            if (picPart != null && picPart.getSize() > 0) {
                service.updateProfilePicture(adminId, picPart.getInputStream().readAllBytes());
            }

            // UPDATE PASSWORD ONLY IF FILLED
            String currentPass = req.getParameter("currentPass");
            String newPass = req.getParameter("newPass");
            String retypePass = req.getParameter("retypePass");

            if (currentPass != null && !currentPass.isBlank()
                    && newPass != null && !newPass.isBlank()
                    && retypePass != null && !retypePass.isBlank()) {

                String passError = service.changePassword(adminId, currentPass, newPass, retypePass);

                if (!"success".equals(passError)) {
                    req.setAttribute("passError", passError);
                    req.setAttribute("user", service.getUserById(adminId));
                    req.setAttribute("formAction", req.getContextPath() + "/admin/edit");
                    req.setAttribute("backURL", req.getContextPath() + "/admin");
                    req.getRequestDispatcher("/WEB-INF/Pages/editProfile.jsp").forward(req, resp);
                    return;
                }
            }

            resp.sendRedirect(req.getContextPath() + "/admin/edit?msg=updated");

        } catch (Exception e) {
            throw new ServletException("DB Error: " + e.getMessage(), e);
        }
    }
}