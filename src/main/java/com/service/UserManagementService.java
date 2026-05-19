package com.service;

import java.sql.SQLException;
import java.util.List;
import java.util.stream.Collectors;

import com.DAO.UserManagementDAO;
import com.model.UserModel;

public class UserManagementService {
    
    public UserManagementDAO userDAO = new UserManagementDAO();
    
    // method that calls userDAO method getAllUsers
    public List<UserModel> getAllUsers() throws SQLException {
        return userDAO.getAllUsers();
    }
    
    public int getUserIdByUsername(String username) throws SQLException {
        return userDAO.getUserIdByUsername(username);
    }
    
    public boolean updateStatus(int userId, String status) throws SQLException {
        return userDAO.updateStatus(userId, status);
    }
    
    public List<UserModel> getFilteredUsers(String filter) throws SQLException {
        List<UserModel> allUsers = userDAO.getAllUsers();
        
        if (filter == null || filter.equals("all")) {
            return getAllUsers();
        }
        
        String statusValue = filter.equals("active") ? "Active" : "Banned";
        
        return allUsers.stream()
                .filter(user -> statusValue.equals(user.getStatus()))
                .collect(Collectors.toList());
    }
   
    public int getTotalBannedUsers() throws SQLException {
        return (int) userDAO.getAllUsers().stream()
                            .filter(user -> "Banned".equals(user.getStatus()))
                            .count();
    }
}