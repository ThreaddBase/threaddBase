package com.model;

import java.util.Date;

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
}

//package com.model;
//
//import java.sql.Date;
//import java.util.Base64;
//
//public class PostModel {
//
//    private int postId;
//    private String caption;
//    private Date postDate;
//    private byte[] postImage;
//
//    private int userId;
//    private String userFirstName;
//    private String userLastName;
//
//    private int commentCount;
//    private int voteCount;
//    private int bookmarkCount;
//    private int reportCount;
//
//    // -------------------------
//    // GETTERS & SETTERS
//    // -------------------------
//
//    public int getPostId() {
//        return postId;
//    }
//
//    public void setPostId(int postId) {
//        this.postId = postId;
//    }
//
//    public String getCaption() {
//        return caption;
//    }
//
//    public void setCaption(String caption) {
//        this.caption = caption;
//    }
//
//    public Date getPostDate() {
//        return postDate;
//    }
//
//    public void setPostDate(Date postDate) {
//        this.postDate = postDate;
//    }
//
//    public byte[] getPostImage() {
//        return postImage;
//    }
//
//    public void setPostImage(byte[] postImage) {
//        this.postImage = postImage;
//    }
//
//    public int getUserId() {
//        return userId;
//    }
//
//    public void setUserId(int userId) {
//        this.userId = userId;
//    }
//
//    public String getUserFirstName() {
//        return userFirstName;
//    }
//
//    public void setUserFirstName(String userFirstName) {
//        this.userFirstName = userFirstName;
//    }
//
//    public String getUserLastName() {
//        return userLastName;
//    }
//
//    public void setUserLastName(String userLastName) {
//        this.userLastName = userLastName;
//    }
//
//    public int getCommentCount() {
//        return commentCount;
//    }
//
//    public void setCommentCount(int commentCount) {
//        this.commentCount = commentCount;
//    }
//
//    public int getVoteCount() {
//        return voteCount;
//    }
//
//    public void setVoteCount(int voteCount) {
//        this.voteCount = voteCount;
//    }
//
//    public int getBookmarkCount() {
//        return bookmarkCount;
//    }
//
//    public void setBookmarkCount(int bookmarkCount) {
//        this.bookmarkCount = bookmarkCount;
//    }
//
//    public int getReportCount() {
//        return reportCount;
//    }
//
//    public void setReportCount(int reportCount) {
//        this.reportCount = reportCount;
//    }
//
//    // -------------------------
//    // IMAGE BASE64 CONVERTER
//    // -------------------------
//
//    public String getPostImageBase64() {
//        if (postImage != null) {
//            return Base64.getEncoder().encodeToString(postImage);
//        }
//        return null;
//    }
//}


//package com.model;
//
//import java.sql.Date;
//import java.util.Base64;
//
//public class PostModel {
//
//    private int postId;
//    private String caption;
//    private Date postDate;
//    private byte[] postImage;
//
//    private int userId;
//    private String userFirstName;
//    private String userLastName;
//
//    private int commentCount;
//    private int voteCount;
//    private int bookmarkCount;
//    private int reportCount;
//
//    public int getPostId() { return postId; }
//    public void setPostId(int postId) { this.postId = postId; }
//
//    public String getCaption() { return caption; }
//    public void setCaption(String caption) { this.caption = caption; }
//
//    public Date getPostDate() { return postDate; }
//    public void setPostDate(Date postDate) { this.postDate = postDate; }
//
//    public byte[] getPostImage() { return postImage; }
//    public void setPostImage(byte[] postImage) { this.postImage = postImage; }
//
//    public int getUserId() { return userId; }
//    public void setUserId(int userId) { this.userId = userId; }
//
//    public String getUserFirstName() { return userFirstName; }
//    public void setUserFirstName(String userFirstName) { this.userFirstName = userFirstName; }
//
//    public String getUserLastName() { return userLastName; }
//    public void setUserLastName(String userLastName) { this.userLastName = userLastName; }
//
//    public int getCommentCount() { return commentCount; }
//    public void setCommentCount(int commentCount) { this.commentCount = commentCount; }
//
//    public int getVoteCount() { return voteCount; }
//    public void setVoteCount(int voteCount) { this.voteCount = voteCount; }
//
//    public int getBookmarkCount() { return bookmarkCount; }
//    public void setBookmarkCount(int bookmarkCount) { this.bookmarkCount = bookmarkCount; }
//
//    public int getReportCount() { return reportCount; }
//    public void setReportCount(int reportCount) { this.reportCount = reportCount; }
//
//    // IMAGE FIX
//    public String getPostImageBase64() {
//        if (postImage != null) {
//            return Base64.getEncoder().encodeToString(postImage);
//        }
//        return null;
//    }
//}



//package com.model;
//
//import java.sql.Date;
//import java.util.Base64;
//
//public class PostModel {
//    private int postId;
//    private int communityId;
//    private int userId;
//    private byte[] postImage;
//    private Date postDate;
//    private String postCaption;
//    private String communityName;
//    private int likeCount;
//    private int commentCount;
//
//    public int getPostId() { return postId; }
//    public void setPostId(int postId) { this.postId = postId; }
//
//    public int getCommunityId() { return communityId; }
//    public void setCommunityId(int communityId) { this.communityId = communityId; }
//
//    public int getUserId() { return userId; }
//    public void setUserId(int userId) { this.userId = userId; }
//
//    public byte[] getPostImage() { return postImage; }
//    public void setPostImage(byte[] postImage) { this.postImage = postImage; }
//
//    public Date getPostDate() { return postDate; }
//    public void setPostDate(Date postDate) { this.postDate = postDate; }
//
//    public String getPostCaption() { return postCaption; }
//    public void setPostCaption(String postCaption) { this.postCaption = postCaption; }
//
//    public String getCommunityName() { return communityName; }
//    public void setCommunityName(String communityName) { this.communityName = communityName; }
//
//    public int getLikeCount() { return likeCount; }
//    public void setLikeCount(int likeCount) { this.likeCount = likeCount; }
//
//    public int getCommentCount() { return commentCount; }
//    public void setCommentCount(int commentCount) { this.commentCount = commentCount; }
//
//    // Converts blob to base64 for JSP display
//    public String getPostImageBase64() {
//        if (postImage != null) {
//            return Base64.getEncoder().encodeToString(postImage);
//        }
//        return null;
//    }
//}