package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.UserReportModel;
import com.util.DBConfig;

public class UserReportDAO {
	
	// INSERT a new report
    public String addReport(UserReportModel report) throws SQLException {
        String query = "INSERT INTO user_report (User_ID, Report_Subject, Report_Description) "
                     + "VALUES (?, ?, ?)";

        try (
            Connection con = DBConfig.getConnection();
            PreparedStatement ps = con.prepareStatement(query)
        ) {
            ps.setInt(1, report.getUserId());
            ps.setString(2, report.getReportSubject());
            ps.setString(3, report.getReportDescription());

            ps.executeUpdate();
            return null;
        }
    }
    
    // GET all reports
    public List<UserReportModel> getAllReports() {
        String query = "SELECT r.Report_ID, r.User_ID, r.Report_Subject, r.Report_Description, "
                     + "       u.Username, u.User_First_Name, u.User_Last_Name "
                     + "FROM user_report r "
                     + "JOIN user u ON r.User_ID = u.user_ID "
                     + "ORDER BY r.Report_ID DESC";

        List<UserReportModel> reportList = new ArrayList<>();

        try (
            Connection con = DBConfig.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery()
        ) {
            while (rs.next()) {
            	UserReportModel report = new UserReportModel();

                report.setReportId(rs.getInt("Report_ID"));
                report.setUserId(rs.getInt("User_ID"));
                report.setReportSubject(rs.getString("Report_Subject"));
                report.setReportDescription(rs.getString("Report_Description"));
                report.setUsername(rs.getString("Username"));
                report.setUserFirstName(rs.getString("User_First_Name"));
                report.setUserLastName(rs.getString("User_Last_Name"));

                reportList.add(report);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return reportList;
    }
}
