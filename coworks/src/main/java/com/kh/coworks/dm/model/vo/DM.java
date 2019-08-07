package com.kh.coworks.dm.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class DM implements Serializable{
	private int dm_no;
	private int dm_from;
	private String dm_subject;
	
	private String dm_content;
	private Timestamp dm_date;
	private String dm_from_del;
	private String dm_from_name;
	private String dm_from_dept;
	private String dm_from_job;

	private int dm_to;
	private String dm_to_del;
	private String dm_to_read;
	public DM(int dm_no, int dm_from, String dm_subject, String dm_content, Timestamp dm_date, String dm_from_del,
			String dm_from_name, String dm_from_dept, String dm_from_job, int dm_to, String dm_to_del,
			String dm_to_read) {
		super();
		this.dm_no = dm_no;
		this.dm_from = dm_from;
		this.dm_subject = dm_subject;
		this.dm_content = dm_content;
		this.dm_date = dm_date;
		this.dm_from_del = dm_from_del;
		this.dm_from_name = dm_from_name;
		this.dm_from_dept = dm_from_dept;
		this.dm_from_job = dm_from_job;
		this.dm_to = dm_to;
		this.dm_to_del = dm_to_del;
		this.dm_to_read = dm_to_read;
	}
	public DM() {
		super();
	}
	public int getDm_no() {
		return dm_no;
	}
	public void setDm_no(int dm_no) {
		this.dm_no = dm_no;
	}
	public int getDm_from() {
		return dm_from;
	}
	public void setDm_from(int dm_from) {
		this.dm_from = dm_from;
	}
	public String getDm_subject() {
		return dm_subject;
	}
	public void setDm_subject(String dm_subject) {
		this.dm_subject = dm_subject;
	}
	public String getDm_content() {
		return dm_content;
	}
	public void setDm_content(String dm_content) {
		this.dm_content = dm_content;
	}
	public Timestamp getDm_date() {
		return dm_date;
	}
	public void setDm_date(Timestamp dm_date) {
		this.dm_date = dm_date;
	}
	public String getDm_from_del() {
		return dm_from_del;
	}
	public void setDm_from_del(String dm_from_del) {
		this.dm_from_del = dm_from_del;
	}
	public String getDm_from_name() {
		return dm_from_name;
	}
	public void setDm_from_name(String dm_from_name) {
		this.dm_from_name = dm_from_name;
	}
	public String getDm_from_dept() {
		return dm_from_dept;
	}
	public void setDm_from_dept(String dm_from_dept) {
		this.dm_from_dept = dm_from_dept;
	}
	public String getDm_from_job() {
		return dm_from_job;
	}
	public void setDm_from_job(String dm_from_job) {
		this.dm_from_job = dm_from_job;
	}
	public int getDm_to() {
		return dm_to;
	}
	public void setDm_to(int dm_to) {
		this.dm_to = dm_to;
	}
	public String getDm_to_del() {
		return dm_to_del;
	}
	public void setDm_to_del(String dm_to_del) {
		this.dm_to_del = dm_to_del;
	}
	public String getDm_to_read() {
		return dm_to_read;
	}
	public void setDm_to_read(String dm_to_read) {
		this.dm_to_read = dm_to_read;
	}

	@Override
	public String toString() {
		return "DM [dm_no=" + dm_no + ", dm_from=" + dm_from + ", dm_subject=" + dm_subject + ", dm_content="
				+ dm_content + ", dm_date=" + dm_date + ", dm_from_del=" + dm_from_del + ", dm_from_name="
				+ dm_from_name + ", dm_from_dept=" + dm_from_dept + ", dm_from_job=" + dm_from_job + ", dm_to=" + dm_to
				+ ", dm_to_del=" + dm_to_del + ", dm_to_read=" + dm_to_read + "]";
	}
	
	
	
	
	
	
}
