//package com.service;
//
//import com.DAO.NotificationDAO;
//import com.model.NotificationModal;
//import java.util.List;
//
//public class NotificationService {
//
//    private NotificationDAO dao = new NotificationDAO();
//
//    public void sendNotification(String message, int adminId) {
//        NotificationModal n = new NotificationModal();
//        n.setNotificationMessage(message);
//        n.setCreatedBy(adminId);
//        dao.saveNotification(n);
//    }
//
//    public List<NotificationModal> getNotifications() {
//        return dao.getAllNotifications();
//    }
//}

//package com.service;
//
//import java.util.List;
//
//import com.DAO.NotificationDAO;
//import com.model.NotificationModal;
//
//public class NotificationService {
//
//    private NotificationDAO dao = new NotificationDAO();
//
//    public void sendNotification(String message, int adminId) {
//        NotificationModal n = new NotificationModal();
//        n.setNotificationMessage(message);
//        n.setCreatedBy(adminId);
//        dao.saveNotification(n);
//    }
//
//    public List<NotificationModal> getNotifications() {
//        return dao.getAllNotifications();
//    }
//}




//package com.service;
//
//import java.util.List;
//
//import com.DAO.NotificationDAO;
//import com.model.NotificationModal;
//
//public class NotificationService {
//
//    private NotificationDAO dao = new NotificationDAO();
//
//    public void sendNotification(String message, int adminId) {
//        NotificationModal n = new NotificationModal();
//        n.setNotificationMessage(message);
//        n.setCreatedBy(adminId);
//        dao.saveNotification(n);
//    }
//
//    public List<NotificationModal> getNotifications() {
//        return dao.getAllNotifications();
//    }
//}


//package com.service;
//
//import java.util.List;
//import com.DAO.NotificationDAO;
//import com.model.NotificationModal;
//
//public class NotificationService {
//
//    private NotificationDAO dao = new NotificationDAO();
//
//    public void sendNotification(String message, int adminId) {
//        NotificationModal n = new NotificationModal();
//        n.setNotificationMessage(message);
//        n.setCreatedBy(adminId);
//        dao.saveNotification(n);
//    }
//
//    public List<NotificationModal> getNotifications() {
//        return dao.getAllNotifications();
//    }
//}

//package com.service;
//
//import java.util.List;
//import com.DAO.NotificationDAO;
//import com.model.NotificationModal;
//
//public class NotificationService {
//
//    private NotificationDAO dao = new NotificationDAO();
//
//    public void sendNotification(String message, int adminId) {
//        NotificationModal n = new NotificationModal();
//        n.setNotificationMessage(message);
//        n.setCreatedBy(adminId);
//        dao.saveNotification(n);
//    }
//
//    // All notifications — for full page
//    public List<NotificationModal> getNotifications() {
//        return dao.getAllNotifications();
//    }
//
//    // Latest 5 — for popup panel on home
//    public List<NotificationModal> getLatestNotifications() {
//        return dao.getLatestNotifications();
//    }
//
//    public void markAllAsRead() {
//        dao.markAllAsRead();
//    }
//
//    public void clearAll() {
//        dao.clearAll();
//    }
//}

package com.service;

import java.util.List;

import com.DAO.NotificationDAO;
import com.model.NotificationModal;

public class NotificationService {

    private NotificationDAO dao =
            new NotificationDAO();

    // SEND
    public void sendNotification(
            String message,
            int adminId) {

        NotificationModal n =
                new NotificationModal();

        n.setNotificationMessage(message);

        n.setCreatedBy(adminId);

        dao.saveNotification(n);
    }

    // HISTORY PAGE
    public List<NotificationModal>
    getNotifications() {

        return dao.getAllNotifications();
    }

    // POPUP ONLY
    public List<NotificationModal>
    getUnreadNotifications() {

        return dao.getUnreadNotifications();
    }

    // MARK READ
    public void markAllAsRead() {

        dao.markAllAsRead();
    }
}