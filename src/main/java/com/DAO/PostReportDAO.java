package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.model.PostReportModel;
import com.util.DBConfig;

public class PostReportDAO {

	public String addReport(PostReportModel report) throws SQLException {
	  
		String query = "INSERT INTO post_report (Post_ID, Report_Subject, Report_Description) "
                   + "VALUES (?, ?, ?)";

	      try (
	          Connection con = DBConfig.getConnection();
	          PreparedStatement ps = con.prepareStatement(query)
	      ) {
	          ps.setInt(1, report.getPostId());
	          ps.setString(2, report.getReportSubject());
	          ps.setString(3, report.getReportDescription());
	
	          ps.executeUpdate();
	          return null;
	      }
	}

}

