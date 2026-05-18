package com.model;

import java.sql.Time;
import java.sql.Date;

public class NotificationModel {
	
	 private int notificationId;
	 private int createdBy;
	 private String notificationMessage;
	 private Date notificationDate;
	 private Time notificationTime;
	 private boolean isRead;
	 
	
	 /**
	 * @return the notificationId
	 */
	public int getNotificationId() {
		return notificationId;
	}
	/**
	 * @return the createdBy
	 */
	public int getCreatedBy() {
		return createdBy;
	}
	/**
	 * @return the notificationMessage
	 */
	public String getNotificationMessage() {
		return notificationMessage;
	}
	/**
	 * @return the notificationDate
	 */
	public Date getNotificationDate() {
		return notificationDate;
	}
	/**
	 * @return the notificationTime
	 */
	public Time getNotificationTime() {
		return notificationTime;
	}
	/**
	 * @return the isRead
	 */
	public boolean isRead() {
		return isRead;
	}
	/**
	 * @param notificationId the notificationId to set
	 */
	public void setNotificationId(int notificationId) {
		this.notificationId = notificationId;
	}
	/**
	 * @param createdBy the createdBy to set
	 */
	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}
	/**
	 * @param notificationMessage the notificationMessage to set
	 */
	public void setNotificationMessage(String notificationMessage) {
		this.notificationMessage = notificationMessage;
	}
	/**
	 * @param notificationDate the notificationDate to set
	 */
	public void setNotificationDate(Date notificationDate) {
		this.notificationDate = notificationDate;
	}
	/**
	 * @param notificationTime the notificationTime to set
	 */
	public void setNotificationTime(Time notificationTime) {
		this.notificationTime = notificationTime;
	}
	/**
	 * @param isRead the isRead to set
	 */
	public void setRead(boolean isRead) {
		this.isRead = isRead;
	}

}
