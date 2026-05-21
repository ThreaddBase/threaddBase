package com.service;
import java.util.List;
import com.DAO.NotificationDAO;
import com.model.NotificationModel;

public class NotificationService {
    public NotificationDAO dao = new NotificationDAO();

    // SEND
    public void sendNotification(String message, int adminId) {
        NotificationModel n = new NotificationModel();
        n.setNotificationMessage(message);
        n.setCreatedBy(adminId);
        dao.saveNotification(n);
    }

    // HISTORY PAGE
    public List<NotificationModel> getNotifications() {
        return dao.getAllNotifications();
    }
    
    public List<NotificationModel> getTopNotifications() {
        return dao.getTopNotifications();
    }

    // POPUP ONLY
    public List<NotificationModel> getUnreadNotifications() {
        return dao.getUnreadNotifications();
    }

    // MARK READ
    public void markAllAsRead() {
        dao.markAllAsRead();
    }
}