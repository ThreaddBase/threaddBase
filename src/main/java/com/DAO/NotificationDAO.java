package com.DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.model.NotificationModel;
import com.util.DBConfig;

public class NotificationDAO {

    // method to save notification
    public void saveNotification(NotificationModel n) {
        String query = "INSERT INTO notification (Created_by, Notification_Message, Notification_Date, Notification_Time, is_read) "
                     + "VALUES (?, ?, CURDATE(), CURTIME(), 0)";
        try (Connection conn = DBConfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, n.getCreatedBy());
            ps.setString(2, n.getNotificationMessage());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

 // GET ALL NOTIFICATIONS (for history page)
    public List<NotificationModel> getAllNotifications() {
        List<NotificationModel> notificationList = new ArrayList<>();
        try {
            Connection conn = DBConfig.getConnection();
            String query = "SELECT * FROM notification "
                         + "ORDER BY Notification_Date DESC, "
                         + "Notification_Time DESC";
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                notificationList.add(mapRow(rs));
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return notificationList;
    }

    // ONLY UNREAD FOR POPUP (same for all users)
    public List<NotificationModel> getUnreadNotifications() {
        List<NotificationModel> list = new ArrayList<>();
        try {
            Connection conn = DBConfig.getConnection();
            String sql = "SELECT * FROM notification "
                       + "WHERE is_read = 0 "
                       + "ORDER BY Notification_Date DESC, "
                       + "Notification_Time DESC "
                       + "LIMIT 5";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(mapRow(rs));
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // MARK ALL READ (global)
    public void markAllAsRead() {
        try {
            Connection conn = DBConfig.getConnection();
            String sql = "UPDATE notification "
                       + "SET is_read = 1 "
                       + "WHERE is_read = 0";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.executeUpdate();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // MAP ROW
    private NotificationModel mapRow(ResultSet rs) throws Exception {
        NotificationModel n = new NotificationModel();
        n.setNotificationId(rs.getInt("Notification_ID"));
        n.setCreatedBy(rs.getInt("Created_by"));
        n.setNotificationMessage(rs.getString("Notification_Message"));
        n.setNotificationDate(rs.getDate("Notification_Date"));
        n.setNotificationTime(rs.getTime("Notification_Time"));
        n.setRead(rs.getBoolean("is_read"));
        return n;
    }
}