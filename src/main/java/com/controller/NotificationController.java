////package com.controller;
////
////import jakarta.servlet.ServletException;
////import jakarta.servlet.annotation.WebServlet;
////import jakarta.servlet.http.HttpServlet;
////import jakarta.servlet.http.HttpServletRequest;
////import jakarta.servlet.http.HttpServletResponse;
////
////import java.io.IOException;
////import java.util.List;
////
////import com.model.NotificationModal;
////import com.service.NotificationService;
////
/////**
//// * Servlet implementation class NotificationController
//// */
////@WebServlet(asyncSupported = true, urlPatterns = { "/user/notification" })
////public class NotificationController extends HttpServlet {
////
////    private static final long serialVersionUID = 1L;
////
////    public NotificationController() {
////        super();
////    }
////
////    @Override
////    protected void doGet(HttpServletRequest request, HttpServletResponse response)
////            throws ServletException, IOException {
////
////        NotificationService service = new NotificationService();
////        List<NotificationModal> notifications = service.getNotifications();
////        request.setAttribute("notificationList", notifications);
////
////        System.out.println("Notification list size: " + notifications.size()); // debug
////
////        request.getRequestDispatcher("/WEB-INF/Pages/notification.jsp")
////               .forward(request, response);
////    }
////
////    @Override
////    protected void doPost(HttpServletRequest request, HttpServletResponse response)
////            throws ServletException, IOException {
////        doGet(request, response);
////    }
////}
//
//
//
////
////package com.controller;
////
////import jakarta.servlet.ServletException;
////import jakarta.servlet.annotation.WebServlet;
////import jakarta.servlet.http.HttpServlet;
////import jakarta.servlet.http.HttpServletRequest;
////import jakarta.servlet.http.HttpServletResponse;
////
////import java.io.IOException;
////import java.util.List;
////
////import com.model.NotificationModal;
////import com.service.NotificationService;
////
////@WebServlet(asyncSupported = true, urlPatterns = { "/user/notification" })
////public class NotificationController extends HttpServlet {
////
////    private static final long serialVersionUID = 1L;
////    private NotificationService service = new NotificationService();
////
////    @Override
////    protected void doGet(HttpServletRequest request, HttpServletResponse response)
////            throws ServletException, IOException {
////
////        List<NotificationModal> notifications = service.getNotifications();
////        request.setAttribute("notificationList", notifications);
////        System.out.println("Notifications fetched: " + notifications.size());
////
////        request.getRequestDispatcher("/WEB-INF/Pages/notification.jsp")
////               .forward(request, response);
////    }
////
////    @Override
////    protected void doPost(HttpServletRequest request, HttpServletResponse response)
////            throws ServletException, IOException {
////        doGet(request, response);
////    }
////}
//
//
//
//package com.controller;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//import java.io.IOException;
//import java.util.List;
//
//import com.model.NotificationModal;
//import com.service.NotificationService;
//
//@WebServlet(asyncSupported = true, urlPatterns = { "/user/notification" })
//public class NotificationController extends HttpServlet {
//
//    private static final long serialVersionUID = 1L;
//    private NotificationService service = new NotificationService();
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        List<NotificationModal> notifications = service.getNotifications();
//        request.setAttribute("notificationList", notifications);
//        System.out.println("Notifications fetched: " + notifications.size());
//
//        request.getRequestDispatcher("/WEB-INF/Pages/notification.jsp")
//               .forward(request, response);
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        doGet(request, response);
//    }
//}




//package com.controller;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//import java.io.IOException;
//import java.util.List;
//
//import com.model.NotificationModal;
//import com.service.NotificationService;
//
//@WebServlet(asyncSupported = true, urlPatterns = { "/user/notification" })
//public class NotificationController extends HttpServlet {
//
//    private static final long serialVersionUID = 1L;
//    private NotificationService service = new NotificationService();
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        List<NotificationModal> notifications = service.getNotifications();
//        request.setAttribute("notificationList", notifications);
//        System.out.println("Notifications fetched: " + notifications.size());
//
//        request.getRequestDispatcher("/WEB-INF/Pages/notification.jsp")
//               .forward(request, response);
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        doGet(request, response);
//    }
//}



//package com.controller;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//import java.io.IOException;
//import java.util.List;
//
//import com.model.NotificationModal;
//import com.service.NotificationService;
//
//@WebServlet(asyncSupported = true, urlPatterns = { "/user/notification" })
//public class NotificationController extends HttpServlet {
//
//    private static final long serialVersionUID = 1L;
//    private NotificationService service = new NotificationService();
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        List<NotificationModal> notifications = service.getNotifications();
//        request.setAttribute("notificationList", notifications);
//        System.out.println("Notifications fetched for user: " + notifications.size());
//
//        request.getRequestDispatcher("/WEB-INF/Pages/notification.jsp")
//               .forward(request, response);
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        doGet(request, response);
//    }
//}



//package com.controller;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//import java.io.IOException;
//import java.util.List;
//
//import com.model.NotificationModal;
//import com.service.NotificationService;
//
//@WebServlet(asyncSupported = true, urlPatterns = { "/user/notification" })
//public class NotificationController extends HttpServlet {
//
//    private static final long serialVersionUID = 1L;
//    private NotificationService service = new NotificationService();
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        String action = request.getParameter("action");
//
//        if ("markRead".equals(action)) {
//            service.markAllAsRead();
//            response.sendRedirect(request.getContextPath() + "/user/notification");
//            return;
//        }
//
//        if ("clearAll".equals(action)) {
//            service.clearAll();
//            response.sendRedirect(request.getContextPath() + "/user/notification");
//            return;
//        }
//
//        // Load all notifications for full page
//        List<NotificationModal> notifications = service.getNotifications();
//        request.setAttribute("notificationList", notifications);
//        System.out.println("All notifications for full page: " + notifications.size());
//
//        request.getRequestDispatcher("/WEB-INF/Pages/notification.jsp")
//               .forward(request, response);
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        doGet(request, response);
//    }
//}

//package com.controller;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//import java.io.IOException;
//import java.util.List;
//
//import com.model.NotificationModal;
//import com.service.NotificationService;
//
//@WebServlet(asyncSupported = true,
//urlPatterns = { "/user/notification" })
//
//public class NotificationController extends HttpServlet {
//
//    private static final long serialVersionUID = 1L;
//
//    private NotificationService service =
//            new NotificationService();
//
//    @Override
//    protected void doGet(HttpServletRequest request,
//                         HttpServletResponse response)
//            throws ServletException, IOException {
//
//        String action =
//                request.getParameter("action");
//
//        // CLEAR ALL
//        if ("clearAll".equals(action)) {
//
//            service.clearAll();
//
//            // IMPORTANT:
//            // Fetch fresh EMPTY list again
//
//            List<NotificationModal> freshList =
//                    service.getNotifications();
//
//            request.setAttribute(
//                    "notificationList",
//                    freshList
//            );
//
//            request.setAttribute(
//                    "successMessage",
//                    "All notifications cleared successfully."
//            );
//
//            request.getRequestDispatcher(
//                    "/WEB-INF/Pages/notification.jsp"
//            ).forward(request, response);
//
//            return;
//        }
//
//        // MARK READ
//        if ("markRead".equals(action)) {
//
//            service.markAllAsRead();
//        }
//
//        // ALWAYS FETCH LATEST DATA
//        List<NotificationModal> notifications =
//                service.getNotifications();
//
//        request.setAttribute(
//                "notificationList",
//                notifications
//        );
//
//        request.getRequestDispatcher(
//                "/WEB-INF/Pages/notification.jsp"
//        ).forward(request, response);
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request,
//                          HttpServletResponse response)
//            throws ServletException, IOException {
//
//        doGet(request, response);
//    }
//}



package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

import com.model.NotificationModal;
import com.service.NotificationService;

@WebServlet(asyncSupported = true,
urlPatterns = { "/user/notification" })

public class NotificationController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private NotificationService service =
            new NotificationService();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        List<NotificationModal> notifications =
                service.getNotifications();

        request.setAttribute(
                "notificationList",
                notifications
        );

        request.getRequestDispatcher(
                "/WEB-INF/Pages/notification.jsp"
        ).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}