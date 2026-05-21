package com.model;

import java.sql.Timestamp;
import java.util.Base64;
import java.util.List;

public class CommentModel {
	
	private int commentId;
    private int postId;
    private int userId;
    private String commentMessage;
    private Timestamp commentDate;
    private Integer parentCommentId;   // null = top-level
    
    // From Users JOIN
    private String username;
    private byte[] userProfilePicture;

    // From comment_vote table (COUNT where vote_type = 1)
    private int voteCount;
    private boolean hasVoted;

    // Nested replies — built in Java
    private List<CommentModel> replies;
	
    /**
	 * @return the commentId
	 */
	public int getCommentId() {
		return commentId;
	}

	/**
	 * @return the postId
	 */
	public int getPostId() {
		return postId;
	}

	/**
	 * @return the userId
	 */
	public int getUserId() {
		return userId;
	}

	/**
	 * @return the commentMessage
	 */
	public String getCommentMessage() {
		return commentMessage;
	}

	/**
	 * @return the commentDate
	 */
	public Timestamp getCommentDate() {
		return commentDate;
	}

	/**
	 * @return the parentCommentId
	 */
	public Integer getParentCommentId() {
		return parentCommentId;
	}

	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * @return the userProfilePicture
	 */
	public byte[] getUserProfilePicture() {
		return userProfilePicture;
	}
	
	/**
	 * @return the userProfilePictureBase64
	 */
    public String getUserProfilePictureBase64() {
        if (userProfilePicture != null && userProfilePicture.length > 1000) {
            return Base64.getEncoder().encodeToString(userProfilePicture);
        }
        return null;
    }

	/**
	 * @return the voteCount
	 */
	public int getVoteCount() {
		return voteCount;
	}
	
	/**
	 * @return the hasVoted
	 */
	public boolean isHasVoted() {
	    return hasVoted;
	}
	
	/**
	 * @return the replies
	 */
	public List<CommentModel> getReplies() {
		return replies;
	}

	/**
	 * @param commentId the commentId to set
	 */
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}

	/**
	 * @param postId the postId to set
	 */
	public void setPostId(int postId) {
		this.postId = postId;
	}

	/**
	 * @param userId the userId to set
	 */
	public void setUserId(int userId) {
		this.userId = userId;
	}

	/**
	 * @param commentMessage the commentMessage to set
	 */
	public void setCommentMessage(String commentMessage) {
		this.commentMessage = commentMessage;
	}

	/**
	 * @param commentDate the commentDate to set
	 */
	public void setCommentDate(Timestamp commentDate) {
		this.commentDate = commentDate;
	}

	/**
	 * @param parentCommentId the parentCommentId to set
	 */
	public void setParentCommentId(Integer parentCommentId) {
		this.parentCommentId = parentCommentId;
	}

	/**
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * @param userProfilePicture the userProfilePicture to set
	 */
	public void setUserProfilePicture(byte[] userProfilePicture) {
		this.userProfilePicture = userProfilePicture;
	}

	/**
	 * @param voteCount the voteCount to set
	 */
	public void setVoteCount(int voteCount) {
		this.voteCount = voteCount;
	}

	/**
	 * @param replies the replies to set
	 */
	public void setReplies(List<CommentModel> replies) {
		this.replies = replies;
	}
	
	/**
	 * @param hasVoted the hasVoted to set
	 */
	public void setHasVoted(boolean hasVoted) {
	    this.hasVoted = hasVoted;
	}
}
