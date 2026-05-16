package com.model;

import java.util.Base64;
import java.util.Date;
import java.util.List;

public class PostModel {
	// Post 
    private int postId;
	private String caption;
    private Date postDate;
    private byte[] postImage;

    // count details
    private int voteCount;
    private int commentCount;
    private int bookmarkCount;
    private int reportCount;

    // user fields
    private int userId;
    private String userFirstName;
    private String userLastName;
    private byte[] userProfilePic;
    
    // Tag
    private List<String> tags;
    
    // community
    private int communityId;
    
	// constructor
    public PostModel() {}
    
    // Getter and setter
    public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public String getCaption() {
		return caption;
	}
	public void setCaption(String caption) {
		this.caption = caption;
	}
	public Date getPostDate() {
		return postDate;
	}
	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}
	public byte[] getPostImage() {
		return postImage;
	}
	public void setPostImage(byte[] postImage) {
		this.postImage = postImage;
	}
	public int getVoteCount() {
		return voteCount;
	}
	public void setVoteCount(int voteCount) {
		this.voteCount = voteCount;
	}
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	public int getBookmarkCount() {
		return bookmarkCount;
	}
	public void setBookmarkCount(int bookmarkCount) {
		this.bookmarkCount = bookmarkCount;
	}
	public int getReportCount() {
		return reportCount;
	}
	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserFirstName() {
		return userFirstName;
	}
	public void setUserFirstName(String userFirstName) {
		this.userFirstName = userFirstName;
	}
	public String getUserLastName() {
		return userLastName;
	}
	public void setUserLastName(String userLastName) {
		this.userLastName = userLastName;
	}
	public byte[] getUserProfilePic() {
		return userProfilePic;
	}
	public void setUserProfilePic(byte[] userProfilePic) {
		this.userProfilePic = userProfilePic;
	}
	
    public List<String> getTags() {
		return tags;
	}

	public void setTags(List<String> tags) {
		this.tags = tags;
	}
	
    public String getPostImageBase64() {
        if (postImage != null && postImage.length > 1000) {
            return Base64.getEncoder().encodeToString(postImage);
        }
        return null;
    }
	
    public String getUserProfilePicBase64() {
        if (userProfilePic != null && userProfilePic.length > 1000) {
            return Base64.getEncoder().encodeToString(userProfilePic);
        }
        return null;
    }
    
    public int getCommunityId() {
		return communityId;
	}
	public void setCommunityId(int communityId) {
		this.communityId = communityId;
	}
}
