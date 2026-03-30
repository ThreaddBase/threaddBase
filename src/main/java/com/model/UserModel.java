package com.model;

import java.util.Date;

public class UserModel {
	
	// initialization
	private int userId;
    private String userFirstName;
    private String userLastName;
    private String username;
    private String password;
    private Date userDob;
    private String userRole;
    private String userEmail;
    private String userBio;
    private byte[] userProfilePicture;
    private Date createdAt;
    
    // constructor
    public UserModel(int userId, String userFirstName, String userLastName, String username, String password, Date userDob, String userRole, String userEmail,
    String userBio, byte[] userProfilePicture, Date createdAt) {

	    this.userId = userId;
	    this.userFirstName = userFirstName;
	    this.userLastName = userLastName;
	    this.username = username;
	    this.password = password;
	    this.userDob = userDob;
	    this.userRole = userRole;
	    this.userEmail = userEmail;
	    this.userBio = userBio;
	    this.userProfilePicture = userProfilePicture;
	    this.createdAt = createdAt;
    }
    
    // Getter
    public int getUserId() {
        return userId;
    }

    public String getUserFirstName() {
        return userFirstName;
    }

    public String getUserLastName() {
        return userLastName;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public Date getUserDob() {
        return userDob;
    }

    public String getUserRole() {
        return userRole;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public String getUserBio() {
        return userBio;
    }

    public byte[] getUserProfilePicture() {
        return userProfilePicture;
    }

    public Date getCreatedAt() {
        return createdAt;
    }
    
    // Setter
    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setUserFirstName(String userFirstName) {
        this.userFirstName = userFirstName;
    }

    public void setUserLastName(String userLastName) {
        this.userLastName = userLastName;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setUserDob(Date userDob) {
        this.userDob = userDob;
    }

    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public void setUserBio(String userBio) {
        this.userBio = userBio;
    }

    public void setUserProfilePicture(byte[] userProfilePicture) {
        this.userProfilePicture = userProfilePicture;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
}