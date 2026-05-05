package com.model;

import java.util.Base64;
import java.util.Date;

public class CommunityModel {
	
	private int id;
    private String name;
    private String description;
    private Date createdAt;
    private byte[] communityProfile;
    private int userCount;

    //public constructor
    public CommunityModel() {}
    
    // constructor for admin dashboard
    public CommunityModel(int id, String name, int userCount) {
        this.id = id;
        this.name = name;
        this.userCount = userCount;
    }
    
    // constructor for community management
    /**
     * @param id
     * @param name
     * @param description
     * @param createdAt
     * @param communityProfile
     */
    public CommunityModel(int id, String name, String description, Date createdAt, byte[] communityProfile) {
    	this.id = id;
        this.name = name;
        this.description = description;
        this.createdAt = createdAt;
        this.communityProfile = communityProfile;
    }
    
    // Getters
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getUserCount() {
        return userCount;
    }
    
    public String getDescription() {
		return description;
	}

    public Date getCreatedAt() {
		return createdAt;
	}
    
    public byte[] getCommunityProfile() {
		return communityProfile;
	}
    
    public String getCommunityProfileBase64() {
        if (communityProfile != null && communityProfile.length > 1000) {
            return Base64.getEncoder().encodeToString(communityProfile);
        }
        return null;
    }
    
    // Setters
    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setUserCount(int userCount) {
        this.userCount = userCount;
    }
    
	public void setDescription(String description) {
		this.description = description;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public void setCommunityProfile(byte[] communityProfile) {
		this.communityProfile = communityProfile;
	}
}
