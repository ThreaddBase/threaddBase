//package com.controller;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import java.io.IOException;
//
///**
// * Servlet implementation class UserHomeController
// */
//@WebServlet(asyncSupported = true, urlPatterns = { "/user/home" })
//public class UserHomeController extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//       
//    /**
//     * @see HttpServlet#HttpServlet()
//     */
//    public UserHomeController() {
//        super();
//        // TODO Auto-generated constructor stub
//    }
//
//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		request.getRequestDispatcher("/WEB-INF/Pages/userHome.jsp").forward(request, response);
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
//@WebServlet(asyncSupported = true, urlPatterns = { "/user/home" })
//public class UserHomeController extends HttpServlet {
//
//    private static final long serialVersionUID = 1L;
//    private NotificationService notifService = new NotificationService();
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        // Latest 5 for popup panel
//        List<NotificationModal> latestNotifications = notifService.getLatestNotifications();
//        request.setAttribute("notificationList", latestNotifications);
//        System.out.println("Latest notifications for home: " + latestNotifications.size());
//
//        request.getRequestDispatcher("/WEB-INF/Pages/userHome.jsp")
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
//@WebServlet(asyncSupported = true, urlPatterns = { "/user/home" })
//public class UserHomeController extends HttpServlet {
//
//    private static final long serialVersionUID = 1L;
//
//    private NotificationService notifService =
//            new NotificationService();
//
//    @Override
//    protected void doGet(HttpServletRequest request,
//                         HttpServletResponse response)
//            throws ServletException, IOException {
//
//        String action = request.getParameter("action");
//        String popup = request.getParameter("popup");
//
//        // MARK AS READ
//        if ("markRead".equals(action)) {
//
//            notifService.markAllAsRead();
//
//            request.setAttribute(
//                    "successMessage",
//                    "Notifications marked as read successfully."
//            );
//
//            request.setAttribute("openPopup", true);
//        }
//
//        // KEEP POPUP OPEN
//        if ("open".equals(popup)) {
//            request.setAttribute("openPopup", true);
//        }
//
//        // LOAD NOTIFICATIONS
//        List<NotificationModal> latestNotifications =
//                notifService.getLatestNotifications();
//
//        request.setAttribute(
//                "notificationList",
//                latestNotifications
//        );
//
//        request.getRequestDispatcher(
//                "/WEB-INF/Pages/userHome.jsp"
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
//urlPatterns = { "/user/home" })
//
//public class UserHomeController extends HttpServlet {
//
//    private static final long serialVersionUID = 1L;
//
//    private NotificationService notifService =
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
//        // KEEP POPUP OPEN
//        request.setAttribute("openPopup", true);
//
//        // MARK READ
//        if ("markRead".equals(action)) {
//
//            notifService.markAllAsRead();
//
//            request.setAttribute(
//                    "successMessage",
//                    "Notifications marked as read successfully."
//            );
//        }
//
//        // CLEAR ALL
//        else if ("clearAll".equals(action)) {
//
//            notifService.clearAll();
//
//            request.setAttribute(
//                    "successMessage",
//                    "All notifications cleared successfully."
//            );
//        }
//
//        // ALWAYS FETCH LATEST DATA
//        List<NotificationModal> latestNotifications =
//                notifService.getLatestNotifications();
//
//        request.setAttribute(
//                "notificationList",
//                latestNotifications
//        );
//
//        request.getRequestDispatcher(
//                "/WEB-INF/Pages/userHome.jsp"
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
//urlPatterns = { "/user/home" })
//
//public class UserHomeController extends HttpServlet {
//
//    private static final long serialVersionUID = 1L;
//
//    private NotificationService notifService =
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
//        // MARK READ
//        if ("markRead".equals(action)) {
//
//            notifService.markAllAsRead();
//
//            request.setAttribute(
//                    "successMessage",
//                    "Notifications marked as read successfully."
//            );
//
//            // OPEN POPUP AGAIN
//            request.setAttribute("openPopup", true);
//        }
//
//        // CLEAR ALL
//        else if ("clearAll".equals(action)) {
//
//            notifService.clearAll();
//
//            request.setAttribute(
//                    "successMessage",
//                    "All notifications cleared successfully."
//            );
//
//            // OPEN POPUP AGAIN
//            request.setAttribute("openPopup", true);
//        }
//
//        // ALWAYS LOAD FRESH DATA
//        List<NotificationModal> latestNotifications =
//                notifService.getLatestNotifications();
//
//        request.setAttribute(
//                "notificationList",
//                latestNotifications
//        );
//
//        request.getRequestDispatcher(
//                "/WEB-INF/Pages/userHome.jsp"
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







//package com.controller;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//
//import java.io.IOException;
//import java.util.ArrayList;
//import java.util.List;
//
//import com.model.NotificationModal;
//import com.service.NotificationService;
//
//@WebServlet(asyncSupported = true,
//urlPatterns = { "/user/home" })
//
//public class UserHomeController extends HttpServlet {
//
//    private static final long serialVersionUID = 1L;
//
//    private NotificationService notifService =
//            new NotificationService();
//
//    @Override
//    protected void doGet(HttpServletRequest request,
//                         HttpServletResponse response)
//            throws ServletException, IOException {
//
//        HttpSession session =
//                request.getSession();
//
//        String action =
//                request.getParameter("action");
//
//        // GET LATEST NOTIFICATIONS
//        List<NotificationModal> latestNotifications =
//                notifService.getLatestNotifications();
//
//        // GET HIDDEN IDS FROM SESSION
//        List<Integer> hiddenNotifications =
//                (List<Integer>) session.getAttribute(
//                        "hiddenNotifications"
//                );
//
//        if (hiddenNotifications == null) {
//
//            hiddenNotifications =
//                    new ArrayList<>();
//        }
//
//        // MARK READ
//        if ("markRead".equals(action)) {
//
//            notifService.markAllAsRead();
//
//            request.setAttribute(
//                    "successMessage",
//                    "Notifications marked as read successfully."
//            );
//
//            request.setAttribute(
//                    "openPopup",
//                    true
//            );
//        }
//
//        // SOFT CLEAR POPUP ONLY
//        else if ("clearPopup".equals(action)) {
//
//            for (NotificationModal n : latestNotifications) {
//
//                hiddenNotifications.add(
//                        n.getNotificationId()
//                );
//            }
//
//            session.setAttribute(
//                    "hiddenNotifications",
//                    hiddenNotifications
//            );
//
//            request.setAttribute(
//                    "successMessage",
//                    "Notifications cleared from popup."
//            );
//
//            request.setAttribute(
//                    "openPopup",
//                    true
//            );
//        }
//
//        // FILTER HIDDEN NOTIFICATIONS
//        List<NotificationModal> filteredList =
//                new ArrayList<>();
//
//        for (NotificationModal n : latestNotifications) {
//
//            if (!hiddenNotifications.contains(
//                    n.getNotificationId())) {
//
//                filteredList.add(n);
//            }
//        }
//
//        request.setAttribute(
//                "notificationList",
//                filteredList
//        );
//
//        request.getRequestDispatcher(
//                "/WEB-INF/Pages/userHome.jsp"
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
urlPatterns = { "/user/home" })

public class UserHomeController
extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private NotificationService notifService =
            new NotificationService();

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String action =
                request.getParameter("action");

        // MARK READ
        if ("markRead".equals(action)) {

            notifService.markAllAsRead();

            request.setAttribute(
                    "successMessage",
                    "Notifications marked as read successfully."
            );

            request.setAttribute(
                    "openPopup",
                    true
            );
        }

        // ONLY UNREAD
        List<NotificationModal> latestNotifications =
                notifService.getUnreadNotifications();

        request.setAttribute(
                "notificationList",
                latestNotifications
        );

        request.getRequestDispatcher(
                "/WEB-INF/Pages/userHome.jsp"
        ).forward(request, response);
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}