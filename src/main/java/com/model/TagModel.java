package com.model;

public class TagModel {
	private int tagID;
	private String name;
	private int tagCount;
	private int postId;
	
	public int getTagID() {
		return tagID;
	}
	
	public String getName() {
		return name;
	}
	
	public int getTagCount() {
		return tagCount;
	}
	
	public int getPostId() {
		return postId;
	}
	
	public void setPostId(int postId) {
		this.postId = postId;
	}
	
	public void setTagID(int tagID) {
		this.tagID = tagID;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public void setTagCount(int tagCount) {
		this.tagCount = tagCount;
	}
}
