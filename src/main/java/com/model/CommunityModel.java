package com.model;

public class CommunityModel {
	
	private int id;
    private String name;
    private int userCount;

    public CommunityModel() {}
    
    // constructor
    public CommunityModel(int id, String name, int userCount) {
        this.id = id;
        this.name = name;
        this.userCount = userCount;
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
}
