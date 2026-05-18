//package com.model;
//
//import java.sql.Date;
//import java.sql.Time;
//
//public class NotificationModal {
//
//	private int notificationId;
//	private int createdBy;
//	private String notificationMessage;
//	private Date notificationDate;
//	private Time notificationTime;
//	private boolean read;
//
//	public NotificationModal() {
//	}
//
//	public int getNotificationId() {
//		return notificationId;
//	}
//
//	public void setNotificationId(int notificationId) {
//		this.notificationId = notificationId;
//	}
//
//	public int getCreatedBy() {
//		return createdBy;
//	}
//
//	public void setCreatedBy(int createdBy) {
//		this.createdBy = createdBy;
//	}
//
//	public String getNotificationMessage() {
//		return notificationMessage;
//	}
//
//	public void setNotificationMessage(String notificationMessage) {
//		this.notificationMessage = notificationMessage;
//	}
//
//	public Date getNotificationDate() {
//		return notificationDate;
//	}
//
//	public void setNotificationDate(Date notificationDate) {
//		this.notificationDate = notificationDate;
//	}
//
//	public Time getNotificationTime() {
//		return notificationTime;
//	}
//
//	public void setNotificationTime(Time notificationTime) {
//		this.notificationTime = notificationTime;
//	}
//
//	public boolean isRead() {
//		return read;
//	}
//
//	public void setRead(boolean read) {
//		this.read = read;
//	}
//}

//package com.model;
//
//import java.sql.Date;
//import java.sql.Time;
//
//public class NotificationModal {
//
//    private int notificationId;
//    private int createdBy;
//    private String notificationMessage;
//    private Date notificationDate;
//    private Time notificationTime;
//    private boolean read;
//
//    public NotificationModal() {}
//
//    public int getNotificationId() { return notificationId; }
//    public void setNotificationId(int notificationId) { this.notificationId = notificationId; }
//
//    public int getCreatedBy() { return createdBy; }
//    public void setCreatedBy(int createdBy) { this.createdBy = createdBy; }
//
//    public String getNotificationMessage() { return notificationMessage; }
//    public void setNotificationMessage(String notificationMessage) { this.notificationMessage = notificationMessage; }
//
//    public Date getNotificationDate() { return notificationDate; }
//    public void setNotificationDate(Date notificationDate) { this.notificationDate = notificationDate; }
//
//    public Time getNotificationTime() { return notificationTime; }
//    public void setNotificationTime(Time notificationTime) { this.notificationTime = notificationTime; }
//
//    public boolean isRead() { return read; }
//    public void setRead(boolean read) { this.read = read; }
//}

//package com.model;
//
//import java.sql.Date;
//import java.sql.Time;
//
//public class NotificationModal {
//
//    private int notificationId;
//    private int createdBy;
//    private String notificationMessage;
//    private Date notificationDate;
//    private Time notificationTime;
//
//    public NotificationModal() {}
//
//    public int getNotificationId() { return notificationId; }
//    public void setNotificationId(int notificationId) { this.notificationId = notificationId; }
//
//    public int getCreatedBy() { return createdBy; }
//    public void setCreatedBy(int createdBy) { this.createdBy = createdBy; }
//
//    public String getNotificationMessage() { return notificationMessage; }
//    public void setNotificationMessage(String notificationMessage) {
//        this.notificationMessage = notificationMessage;
//    }
//
//    public Date getNotificationDate() { return notificationDate; }
//    public void setNotificationDate(Date notificationDate) {
//        this.notificationDate = notificationDate;
//    }
//
//    public Time getNotificationTime() { return notificationTime; }
//    public void setNotificationTime(Time notificationTime) {
//        this.notificationTime = notificationTime;
//    }
//}



//package com.model;
//
//import java.sql.Date;
//import java.sql.Time;
//
//public class NotificationModal {
//
//	private int notificationId;
//	private int createdBy;
//	private String notificationMessage;
//	private Date notificationDate;
//	private Time notificationTime;
//
//	public NotificationModal() {
//	}
//
//	public int getNotificationId() {
//		return notificationId;
//	}
//
//	public void setNotificationId(int notificationId) {
//		this.notificationId = notificationId;
//	}
//
//	public int getCreatedBy() {
//		return createdBy;
//	}
//
//	public void setCreatedBy(int createdBy) {
//		this.createdBy = createdBy;
//	}
//
//	public String getNotificationMessage() {
//		return notificationMessage;
//	}
//
//	public void setNotificationMessage(String notificationMessage) {
//		this.notificationMessage = notificationMessage;
//	}
//
//	public Date getNotificationDate() {
//		return notificationDate;
//	}
//
//	public void setNotificationDate(Date notificationDate) {
//		this.notificationDate = notificationDate;
//	}
//
//	public Time getNotificationTime() {
//		return notificationTime;
//	}
//
//	public void setNotificationTime(Time notificationTime) {
//		this.notificationTime = notificationTime;
//	}
//}


package com.model;

import java.sql.Date;
import java.sql.Time;

public class NotificationModal {

    private int notificationId;
    private int createdBy;
    private String notificationMessage;
    private Date notificationDate;
    private Time notificationTime;
    private boolean isRead;

    public NotificationModal() {}

    public int getNotificationId() { return notificationId; }
    public void setNotificationId(int notificationId) { this.notificationId = notificationId; }

    public int getCreatedBy() { return createdBy; }
    public void setCreatedBy(int createdBy) { this.createdBy = createdBy; }

    public String getNotificationMessage() { return notificationMessage; }
    public void setNotificationMessage(String notificationMessage) {
        this.notificationMessage = notificationMessage;
    }

    public Date getNotificationDate() { return notificationDate; }
    public void setNotificationDate(Date notificationDate) {
        this.notificationDate = notificationDate;
    }

    public Time getNotificationTime() { return notificationTime; }
    public void setNotificationTime(Time notificationTime) {
        this.notificationTime = notificationTime;
    }

    public boolean isRead() { return isRead; }
    public void setRead(boolean isRead) { this.isRead = isRead; }
}