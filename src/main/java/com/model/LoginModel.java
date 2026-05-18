//package com.model;
//
//public class LoginModel {
//	
//	private String username;
//	private String password;
//	private String userRole;
//	
//	public LoginModel(String username, String password) {
//		super();
//		this.username = username; 
//		this.password = password;
//	}
//	
//    public LoginModel(String username, String password, String userRole) {
//        this.username = username;
//        this.password = password;
//        this.userRole = userRole;
//    }
//
//	public String getUsername() {
//		return username;
//	}
//
//	public void setUsername(String username) {
//		this.username = username;
//	}
//
//	public String getPassword() {
//		return password;
//	}
//
//	public void setPassword(String password) {
//		this.password = password;
//	}
//	
//	public String getUserRole() {
//		return userRole;
//	}
//
//	public void setUserRole(String userRole) {
//		this.userRole = userRole;
//	}
//}


package com.model;

public class LoginModel {
    private String username;
    private String password;
    private String userRole;
    private int userId;

    public LoginModel(String username, String password, String userRole, int userId) {
        this.username = username;
        this.password = password;
        this.userRole = userRole;
        this.userId   = userId;
    }

    public String getUsername() { return username; }
    public String getPassword() { return password; }
    public String getUserRole() { return userRole; }
    public int getUserId()      { return userId; }
}
