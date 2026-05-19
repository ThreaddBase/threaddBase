package com.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.DAO.UserReportDAO;
import com.model.UserReportModel;

public class UserReportService {

    // INSERT — returns null on success, error string on failure
    private final UserReportDAO reportDAO = new UserReportDAO();

    // INSERT — returns null on success, error string on failure
    public String addReport(int userId, String subject, String description) {

        // validation
        if (userId <= 0)
            return "Invalid user.";
        if (subject == null || subject.trim().isEmpty())
            return "Report subject cannot be empty.";
        if (subject.trim().length() > 20)
            return "Report subject cannot exceed 20 characters.";
        if (description == null || description.trim().isEmpty())
            return "Report description cannot be empty.";
        if (description.trim().length() > 200)
            return "Report description cannot exceed 200 characters.";

        // build model
        UserReportModel report = new UserReportModel();
        report.setUserId(userId);
        report.setReportSubject(subject.trim());
        report.setReportDescription(description.trim());

        // insert
        try {
            return reportDAO.addReport(report);
        } catch (SQLException e) {
            e.printStackTrace();
            return "Something went wrong, please try again.";
        }
    }

    // GET ALL — returns empty list on failure, never null
    public List<UserReportModel> getAllReports() {
        try {
            List<UserReportModel> reports = reportDAO.getAllReports();
            return reports != null ? reports : new ArrayList<>();
        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }
}
