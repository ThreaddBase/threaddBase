package com.model;

import java.util.Base64;

public class UserModel {

    private int id;
    private String firstName;
    private String lastName;
    private String email;
    private String status;
    private String dob;
    private String username;
    private String role;
    private String created_At;
    private String bio;
    private int postCount;
    private int commentCount;
    private int reportCount;
    private byte[] profilePicture;
    private String password;

    // No-arg constructor
    public UserModel() {
    }

    // All-arg constructor
    public UserModel(int id, String firstName, String lastName, String email,
            String status, String dob, String username, String role, String created_At, String bio, int postCount, int commentCount,
            int reportCount, byte[] profilePicture, String password) {
    	this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.dob = dob;
        this.username = username;
        this.role = role;
        this.created_At=created_At;
        this.bio = bio;
        this.postCount = postCount;
        this.commentCount = commentCount;
        this.reportCount = reportCount;
        this.profilePicture = profilePicture;
        this.password = password;
    }

    // Getters
    public int getId() {
        return id;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getEmail() {
        return email;
    }

    public String getStatus() {
        return status;
    }
    
    
    public String getDob(){
    	return dob;
    }
    
    public String getUsername(){
    	return username;
    }
    
    public String getRole(){
    	return role;
    }
    
    public String getCreated_At(){
    	return created_At;
    }
    
    public String getBio(){
    	return bio;
    }

    public int getPostCount() {
        return postCount;
    }

    public int getCommentCount() {
        return commentCount;
    }

    public int getReportCount() {
        return reportCount;
    }

    public byte[] getProfilePicture() {
        return profilePicture;
    }

    public String getProfilePictureBase64() {
        if (profilePicture != null && profilePicture.length > 0) {
        	return Base64.getEncoder().encodeToString(profilePicture);
        }
        return null;
    }
    
    public String getPassword() {
    	return password;
    }
    
    // Setters
    public void setId(int id) {
        this.id = id;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    public void setDob(String dob) {
        this.dob = dob;

    }
    
	public void setUsername(String username) {
	    this.username = username;
	 }
	
	public void setRole(String role) {
	    this.role = role;
	 }
	
	public void setCreated_At(String created_At) {
    	this.created_At = created_At;
    }
	
	public void setBio(String bio) {
	    this.bio = bio;
	}


    public void setStatus(String status) {
        this.status = status;
    }

    public void setPostCount(int postCount) {
        this.postCount = postCount;
    }

    public void setCommentCount(int commentCount) {
        this.commentCount = commentCount;
    }

    public void setReportCount(int reportCount) {
        this.reportCount = reportCount;
    }

    public void setProfilePicture(byte[] profilePicture) {
        this.profilePicture = profilePicture;
    }
    
    public void setPassword(String password) {
    	this.password = password;
    }
}