//package com.DAO;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.util.ArrayList;
//import java.util.List;
//
//import com.model.NotificationModal;
//import com.util.DBConfig;
//
//public class NotificationDAO {
//
//    public void saveNotification(NotificationModal n) {
//        try {
//            Connection conn = DBConfig.getConnection();
//            String sql = "INSERT INTO notification "
//                       + "(Created_by, Notification_Message, Notification_Date, Notification_Time) "
//                       + "VALUES (?, ?, CURDATE(), CURTIME())";
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setInt(1, n.getCreatedBy());
//            ps.setString(2, n.getNotificationMessage());
//            int rows = ps.executeUpdate();
//            System.out.println("Rows inserted: " + rows); // ← check Tomcat console
//            ps.close();
//            conn.close();
//        } catch (Exception e) {
//            System.out.println("ERROR saving notification: " + e.getMessage());
//            e.printStackTrace();
//        }
//    }
//
//    public List<NotificationModal> getAllNotifications() {
//        List<NotificationModal> list = new ArrayList<>();
//        try {
//            Connection conn = DBConfig.getConnection();
//            String sql = "SELECT * FROM notification "
//                       + "ORDER BY Notification_Date DESC, Notification_Time DESC";
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                NotificationModal n = new NotificationModal();
//                n.setNotificationId(rs.getInt("Notification_ID"));
//                n.setCreatedBy(rs.getInt("Created_by"));
//                n.setNotificationMessage(rs.getString("Notification_Message"));
//                n.setNotificationDate(rs.getDate("Notification_Date"));
//                n.setNotificationTime(rs.getTime("Notification_Time"));
//                list.add(n);
//            }
//            rs.close();
//            ps.close();
//            conn.close();
//        } catch (Exception e) {
//            System.out.println("ERROR fetching notifications: " + e.getMessage());
//            e.printStackTrace();
//        }
//        return list;
//    }
//}

//package com.DAO;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.util.ArrayList;
//import java.util.List;
//
//import com.model.NotificationModal;
//import com.util.DBConfig;
//
//public class NotificationDAO {
//
//    public void saveNotification(NotificationModal n) {
//        try {
//            Connection conn = DBConfig.getConnection();
//            String sql = "INSERT INTO notification "
//                       + "(Created_by, Notification_Message, Notification_Date, Notification_Time) "
//                       + "VALUES (?, ?, CURDATE(), CURTIME())";
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setInt(1, n.getCreatedBy());
//            ps.setString(2, n.getNotificationMessage());
//            int rows = ps.executeUpdate();
//            System.out.println("Rows inserted: " + rows);
//            ps.close();
//            conn.close();
//        } catch (Exception e) {
//            System.out.println("ERROR saving notification: " + e.getMessage());
//            e.printStackTrace();
//        }
//    }
//
//    public List<NotificationModal> getAllNotifications() {
//        List<NotificationModal> list = new ArrayList<>();
//        try {
//            Connection conn = DBConfig.getConnection();
//            String sql = "SELECT * FROM notification "
//                       + "ORDER BY Notification_Date DESC, Notification_Time DESC";
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                NotificationModal n = new NotificationModal();
//                n.setNotificationId(rs.getInt("Notification_ID"));
//                n.setCreatedBy(rs.getInt("Created_by"));
//                n.setNotificationMessage(rs.getString("Notification_Message"));
//                n.setNotificationDate(rs.getDate("Notification_Date"));
//                n.setNotificationTime(rs.getTime("Notification_Time"));
//                list.add(n);
//            }
//            rs.close();
//            ps.close();
//            conn.close();
//        } catch (Exception e) {
//            System.out.println("ERROR fetching notifications: " + e.getMessage());
//            e.printStackTrace();
//        }
//        return list;
//    }
//}



//package com.DAO;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.util.ArrayList;
//import java.util.List;
//
//import com.model.NotificationModal;
//import com.util.DBConfig;
//
//public class NotificationDAO {
//
//    public void saveNotification(NotificationModal n) {
//        try {
//            Connection conn = DBConfig.getConnection();
//            String sql = "INSERT INTO notification "
//                       + "(Created_by, Notification_Message, Notification_Date, Notification_Time) "
//                       + "VALUES (?, ?, CURDATE(), CURTIME())";
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setInt(1, n.getCreatedBy());
//            ps.setString(2, n.getNotificationMessage());
//            int rows = ps.executeUpdate();
//            System.out.println("Rows inserted: " + rows);
//            ps.close();
//            conn.close();
//        } catch (Exception e) {
//            System.out.println("ERROR saving notification: " + e.getMessage());
//            e.printStackTrace();
//        }
//    }
//
//    public List<NotificationModal> getAllNotifications() {
//        List<NotificationModal> list = new ArrayList<>();
//        try {
//            Connection conn = DBConfig.getConnection();
//            String sql = "SELECT * FROM notification "
//                       + "ORDER BY Notification_Date DESC, Notification_Time DESC";
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                NotificationModal n = new NotificationModal();
//                n.setNotificationId(rs.getInt("Notification_ID"));
//                n.setCreatedBy(rs.getInt("Created_by"));
//                n.setNotificationMessage(rs.getString("Notification_Message"));
//                n.setNotificationDate(rs.getDate("Notification_Date"));
//                n.setNotificationTime(rs.getTime("Notification_Time"));
//                list.add(n);
//            }
//            rs.close();
//            ps.close();
//            conn.close();
//        } catch (Exception e) {
//            System.out.println("ERROR fetching notifications: " + e.getMessage());
//            e.printStackTrace();
//        }
//        return list;
//    }
//}


//package com.DAO;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.util.ArrayList;
//import java.util.List;
//
//import com.model.NotificationModal;
//import com.util.DBConfig;
//
//public class NotificationDAO {
//
//    public void saveNotification(NotificationModal n) {
//        try {
//            Connection conn = DBConfig.getConnection();
//            String sql = "INSERT INTO notification "
//                       + "(Created_by, Notification_Message, Notification_Date, Notification_Time) "
//                       + "VALUES (?, ?, CURDATE(), CURTIME())";
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setInt(1, n.getCreatedBy());
//            ps.setString(2, n.getNotificationMessage());
//            int rows = ps.executeUpdate();
//            System.out.println("Rows inserted: " + rows);
//            ps.close();
//            conn.close();
//        } catch (Exception e) {
//            System.out.println("ERROR saving notification: " + e.getMessage());
//            e.printStackTrace();
//        }
//    }
//
//    public List<NotificationModal> getAllNotifications() {
//        List<NotificationModal> list = new ArrayList<>();
//        try {
//            Connection conn = DBConfig.getConnection();
//            String sql = "SELECT * FROM notification "
//                       + "ORDER BY Notification_Date DESC, Notification_Time DESC";
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                NotificationModal n = new NotificationModal();
//                n.setNotificationId(rs.getInt("Notification_ID"));
//                n.setCreatedBy(rs.getInt("Created_by"));
//                n.setNotificationMessage(rs.getString("Notification_Message"));
//                n.setNotificationDate(rs.getDate("Notification_Date"));
//                n.setNotificationTime(rs.getTime("Notification_Time"));
//                list.add(n);
//            }
//            rs.close();
//            ps.close();
//            conn.close();
//        } catch (Exception e) {
//            System.out.println("ERROR fetching notifications: " + e.getMessage());
//            e.printStackTrace();
//        }
//        return list;
//    }
//}




//package com.DAO;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.util.ArrayList;
//import java.util.List;
//
//import com.model.NotificationModal;
//import com.util.DBConfig;
//
//public class NotificationDAO {
//
//    // Admin saves notification
//    public void saveNotification(NotificationModal n) {
//        try {
//            Connection conn = DBConfig.getConnection();
//            String sql = "INSERT INTO notification "
//                       + "(Created_by, Notification_Message, Notification_Date, Notification_Time, is_read) "
//                       + "VALUES (?, ?, CURDATE(), CURTIME(), FALSE)";
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setInt(1, n.getCreatedBy());
//            ps.setString(2, n.getNotificationMessage());
//            int rows = ps.executeUpdate();
//            System.out.println("Rows inserted: " + rows);
//            ps.close();
//            conn.close();
//        } catch (Exception e) {
//            System.out.println("ERROR saving: " + e.getMessage());
//            e.printStackTrace();
//        }
//    }
//
//    // Get ALL notifications (for full page)
//    public List<NotificationModal> getAllNotifications() {
//        List<NotificationModal> list = new ArrayList<>();
//        try {
//            Connection conn = DBConfig.getConnection();
//            String sql = "SELECT * FROM notification "
//                       + "ORDER BY Notification_Date DESC, Notification_Time DESC";
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                NotificationModal n = mapRow(rs);
//                list.add(n);
//            }
//            rs.close(); ps.close(); conn.close();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return list;
//    }
//
//    // Get only LATEST 5 unread (for popup panel)
//    public List<NotificationModal> getLatestNotifications() {
//        List<NotificationModal> list = new ArrayList<>();
//        try {
//            Connection conn = DBConfig.getConnection();
//            String sql = "SELECT * FROM notification "
//                       + "ORDER BY Notification_Date DESC, Notification_Time DESC "
//                       + "LIMIT 5";
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                NotificationModal n = mapRow(rs);
//                list.add(n);
//            }
//            rs.close(); ps.close(); conn.close();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return list;
//    }
//
//    // Mark all as read
//    public void markAllAsRead() {
//        try {
//            Connection conn = DBConfig.getConnection();
//            String sql = "UPDATE notification SET is_read = TRUE";
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.executeUpdate();
//            ps.close(); conn.close();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//
//    // Clear all notifications
//    public void clearAll() {
//        try {
//            Connection conn = DBConfig.getConnection();
//            String sql = "DELETE FROM notification";
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.executeUpdate();
//            ps.close(); conn.close();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//
//    // Helper to map ResultSet row to NotificationModal
//    private NotificationModal mapRow(ResultSet rs) throws Exception {
//        NotificationModal n = new NotificationModal();
//        n.setNotificationId(rs.getInt("Notification_ID"));
//        n.setCreatedBy(rs.getInt("Created_by"));
//        n.setNotificationMessage(rs.getString("Notification_Message"));
//        n.setNotificationDate(rs.getDate("Notification_Date"));
//        n.setNotificationTime(rs.getTime("Notification_Time"));
//        n.setRead(rs.getBoolean("is_read"));
//        return n;
//    }
//}



package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.model.NotificationModal;
import com.util.DBConfig;

public class NotificationDAO {

    // SAVE
    public void saveNotification(NotificationModal n) {

        try {

            Connection conn =
                    DBConfig.getConnection();

            String sql =
                    "INSERT INTO notification "
                    + "(Created_by, Notification_Message, "
                    + "Notification_Date, Notification_Time, is_read) "
                    + "VALUES (?, ?, CURDATE(), CURTIME(), 0)";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ps.setInt(1, n.getCreatedBy());

            ps.setString(
                    2,
                    n.getNotificationMessage()
            );

            ps.executeUpdate();

            ps.close();
            conn.close();

        } catch (Exception e) {

            e.printStackTrace();
        }
    }

    // ALL NOTIFICATIONS
    public List<NotificationModal> getAllNotifications() {

        List<NotificationModal> list =
                new ArrayList<>();

        try {

            Connection conn =
                    DBConfig.getConnection();

            String sql =
                    "SELECT * FROM notification "
                    + "ORDER BY Notification_Date DESC, "
                    + "Notification_Time DESC";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ResultSet rs =
                    ps.executeQuery();

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

    // ONLY UNREAD FOR POPUP
    public List<NotificationModal>
    getUnreadNotifications() {

        List<NotificationModal> list =
                new ArrayList<>();

        try {

            Connection conn =
                    DBConfig.getConnection();

            String sql =
                    "SELECT * FROM notification "
                    + "WHERE is_read = 0 "
                    + "ORDER BY Notification_Date DESC, "
                    + "Notification_Time DESC "
                    + "LIMIT 5";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ResultSet rs =
                    ps.executeQuery();

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

    // MARK ALL READ
    public void markAllAsRead() {

        try {

            Connection conn =
                    DBConfig.getConnection();

            String sql =
                    "UPDATE notification "
                    + "SET is_read = 1 "
                    + "WHERE is_read = 0";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ps.executeUpdate();

            ps.close();
            conn.close();

        } catch (Exception e) {

            e.printStackTrace();
        }
    }

    // MAP ROW
    private NotificationModal mapRow(ResultSet rs)
            throws Exception {

        NotificationModal n =
                new NotificationModal();

        n.setNotificationId(
                rs.getInt("Notification_ID")
        );

        n.setCreatedBy(
                rs.getInt("Created_by")
        );

        n.setNotificationMessage(
                rs.getString("Notification_Message")
        );

        n.setNotificationDate(
                rs.getDate("Notification_Date")
        );

        n.setNotificationTime(
                rs.getTime("Notification_Time")
        );

        n.setRead(
                rs.getBoolean("is_read")
        );

        return n;
    }
}