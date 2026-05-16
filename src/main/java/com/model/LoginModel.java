package com.model;

public class LoginModel {
	
	private int id;
	private String username;
	private String password;
	private String userRole;
	
	public LoginModel(String username, String password) {
		super();
		this.username = username; 
		this.password = password;
	}
	
    public LoginModel(int id, String username, String password, String userRole) {
    	this.id = id;
        this.username = username;
        this.password = password;
        this.userRole = userRole;
    }
    
    public int getId() {
    	return id;
    }
    
    public void setId(int id) {
    	this.id = id;
    }

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}
}
