package com.students.bean;

import java.io.InputStream;
import java.sql.Date;

public class NoticeBean {

	private String subject;
	private String details;
	private Date issDate;
	private String date;
	private InputStream doc;
	
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public Date getIssDate() {
		return issDate;
	}
	public void setIssDate(Date dt) {
		this.issDate = dt;
	}
	public InputStream getDoc() {
		return doc;
	}
	public void setDoc(InputStream doc) {
		this.doc = doc;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
}
