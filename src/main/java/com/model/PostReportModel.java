package com.model;

public class PostReportModel {
	
	private int reportId;
	private int postId;
    private String reportSubject;
    private String reportDescription;
    
    /**
	 * @return the reportId
	 */
	public int getReportId() {
		return reportId;
	}
	/**
	 * @return the postId
	 */
	public int getPostId() {
		return postId;
	}
	/**
	 * @return the reportSubject
	 */
	public String getReportSubject() {
		return reportSubject;
	}
	/**
	 * @return the reportDescription
	 */
	public String getReportDescription() {
		return reportDescription;
	}
	/**
	 * @param reportId the reportId to set
	 */
	public void setReportId(int reportId) {
		this.reportId = reportId;
	}
	/**
	 * @param postId the postId to set
	 */
	public void setPostId(int postId) {
		this.postId = postId;
	}
	/**
	 * @param reportSubject the reportSubject to set
	 */
	public void setReportSubject(String reportSubject) {
		this.reportSubject = reportSubject;
	}
	/**
	 * @param reportDescription the reportDescription to set
	 */
	public void setReportDescription(String reportDescription) {
		this.reportDescription = reportDescription;
	}

}
