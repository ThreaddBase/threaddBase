package com.service;
import com.model.UserModel;
import java.util.ArrayList;
import com.DAO.ProfileDAO;
import com.DAO.UserDAO;



public class UserService {
    public UserDAO dao = new UserDAO();
    public ProfileDAO profileDAO = new ProfileDAO();
    public ArrayList<UserModel> getAllusers()throws Exception{
        return dao.getUser();
    }
     public UserModel getUserById(int id) throws Exception {
            return profileDAO.getUserById(id);
        }
}