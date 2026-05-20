package com.service;

import java.sql.SQLException;

import com.DAO.PostReportDAO;
import com.model.PostReportModel;

public class PostReportService {

	private final PostReportDAO reportDAO = new PostReportDAO();
	
	public String addReport(int postId, String subject, String description) {

        // validation
        if (postId <= 0)
            return "Invalid Post.";
        if (subject == null || subject.trim().isEmpty())
            return "Report subject cannot be empty.";
        if (subject.trim().length() > 20)
            return "Report subject cannot exceed 20 characters.";
        if (description == null || description.trim().isEmpty())
            return "Report description cannot be empty.";
        if (description.trim().length() > 200)
            return "Report description cannot exceed 200 characters.";

        // build model
        PostReportModel report = new PostReportModel();
        report.setPostId(postId);
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

}
