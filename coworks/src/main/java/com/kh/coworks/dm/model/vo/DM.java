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
	//
//	"DM_TO_NO","DM_TO","DM_TO_DEL"
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


	public String getDm_from_name() {
		return dm_from_name;
	}


	public void setDm_from_name(String dm_from_name) {
		this.dm_from_name = dm_from_name;
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


	public void setDm_date(Timestamp timestamp) {
		this.dm_date = timestamp;
	}


	public String getDm_from_del() {
		return dm_from_del;
	}


	public void setDm_from_del(String dm_from_del) {
		this.dm_from_del = dm_from_del;
	}


	public DM() {
		super();
	}


	public DM(int dm_no, int dm_from, String dm_subject, String dm_content, Timestamp dm_date, String dm_from_del,
			String dm_from_name, String dm_from_dept, String dm_from_job) {
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
		
		
		
	}


	@Override
	public String toString() {
		return "DM [dm_no=" + dm_no + ", dm_from=" + dm_from + ", dm_subject=" + dm_subject + ", dm_content="
				+ dm_content + ", dm_date=" + dm_date + ", dm_from_del=" + dm_from_del + ", dm_from_name="
				+ dm_from_name + ", dm_from_dept=" + dm_from_dept + ", dm_from_job=" + dm_from_job + "]";
	}



	
	
}
