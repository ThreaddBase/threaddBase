package com.model;

public class CommentVoteModel {
    private int commentVoteId;
    private int commentId;
    private int userId;
    private int voteType = 1; // Always 1 (upvote)
	/**
	 * @return the commentVoteId
	 */
	public int getCommentVoteId() {
		return commentVoteId;
	}
	/**
	 * @return the commentId
	 */
	public int getCommentId() {
		return commentId;
	}
	/**
	 * @return the userId
	 */
	public int getUserId() {
		return userId;
	}
	/**
	 * @return the voteType
	 */
	public int getVoteType() {
		return voteType;
	}
	/**
	 * @param commentVoteId the commentVoteId to set
	 */
	public void setCommentVoteId(int commentVoteId) {
		this.commentVoteId = commentVoteId;
	}
	/**
	 * @param commentId the commentId to set
	 */
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	/**
	 * @param userId the userId to set
	 */
	public void setUserId(int userId) {
		this.userId = userId;
	}
	/**
	 * @param voteType the voteType to set
	 */
	public void setVoteType(int voteType) {
		this.voteType = voteType;
	}
    
    
}
