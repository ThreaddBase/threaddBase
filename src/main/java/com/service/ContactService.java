package com.service;

import java.sql.SQLException;

import com.DAO.ContactDAO;
import com.model.ContactModel;

public class ContactService {
	
	public String addContact(ContactModel contact) throws SQLException{

        // Validation

        if (contact.getFirstName() == null || contact.getFirstName().trim().isEmpty()) {
            return "First Name is required";
        }

        if (contact.getLastName() == null || contact.getLastName().trim().isEmpty()) {
            return "Last Name is required";
        }

        if (contact.getEmail() == null || contact.getEmail().trim().isEmpty()) {
            return "Email is required";
        }

        if (!contact.getEmail().matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            return "Invalid Email";
        }

        if (contact.getPhoneNumber() == null || contact.getPhoneNumber().trim().isEmpty()) {
            return "Phone Number is required";
        }

        if (!contact.getPhoneNumber().matches("\\d{10}")) {
            return "Phone Number must be 10 digits";
        }

        if (contact.getDescription() == null || contact.getDescription().trim().isEmpty()) {
            return "Description is required";
        }

        // Send object to DAO
        ContactDAO contactDAO = new ContactDAO();
        contactDAO.insertContact(contact);

        // No error
        return null;
    }
}
