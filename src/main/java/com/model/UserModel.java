package com.model;

import java.util.Base64;

public class UserModel {

    private int id;
    private String firstName;
    private String lastName;
    private String email;
    private String status;
    private int postCount;
    private int commentCount;
    private int reportCount;
    private byte[] profilePicture;

    // No-arg constructor
    public UserModel() {
    }

    // All-arg constructor
    public UserModel(int id, String firstName, String lastName, String email,
            String status, int postCount, int commentCount,
            int reportCount, byte[] profilePicture) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.status = status;
        this.postCount = postCount;
        this.commentCount = commentCount;
        this.reportCount = reportCount;
        this.profilePicture = profilePicture;
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
        if (profilePicture != null && profilePicture.length > 1000) {
            return Base64.getEncoder().encodeToString(profilePicture);
        }
        return null;
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
}
