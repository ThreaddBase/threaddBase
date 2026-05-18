package com.model;

public class BookmarkModel {
	private int bookmarkId;
	private int userId;
    private int postId;
    private byte[] postImage;
    private String postCaption;
    private String userFirstName;
    private String userLastName;
    
    /**
	 * @return the bookmarkId
	 */
	public int getBookmarkId() {
		return bookmarkId;
	}
	/**
	 * @return the userId
	 */
	public int getUserId() {
		return userId;
	}
	/**
	 * @return the postId
	 */
	public int getPostId() {
		return postId;
	}
	/**
	 * @return the postImage
	 */
	public byte[] getPostImage() {
		return postImage;
	}
    
	/**
	 * @return the postCaption
	 */
	public String getPostCaption() {
		return postCaption;
	}
	/**
	 * @return the userFirstName
	 */
	public String getUserFirstName() {
		return userFirstName;
	}
	/**
	 * @return the userLastName
	 */
	public String getUserLastName() {
		return userLastName;
	}
	/**
	 * @param bookmarkId the bookmarkId to set
	 */
	public void setBookmarkId(int bookmarkId) {
		this.bookmarkId = bookmarkId;
	}
	/**
	 * @param userId the userId to set
	 */
	public void setUserId(int userId) {
		this.userId = userId;
	}
	/**
	 * @param postId the postId to set
	 */
	public void setPostId(int postId) {
		this.postId = postId;
	}
	/**
	 * @param postImage the postImage to set
	 */
	public void setPostImage(byte[] postImage) {
		this.postImage = postImage;
	}
	/**
	 * @param postCaption the postCaption to set
	 */
	public void setPostCaption(String postCaption) {
		this.postCaption = postCaption;
	}
	/**
	 * @param userFirstName the userFirstName to set
	 */
	public void setUserFirstName(String userFirstName) {
		this.userFirstName = userFirstName;
	}
	/**
	 * @param userLastName the userLastName to set
	 */
	public void setUserLastName(String userLastName) {
		this.userLastName = userLastName;
	}
	
}
