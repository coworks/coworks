package com.kh.coworks.dm.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class DM implements Serializable{
	private int dm_no;
	private int dm_from;
	private String dm_subject;
	private String dm_content;
	private Date dm_date;
	private String dm_from_del;
	
	
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


	public Date getDm_date() {
		return dm_date;
	}


	public void setDm_date(Date dm_date) {
		this.dm_date = dm_date;
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


	public DM(int dm_no, int dm_from, String dm_subject, String dm_content, Date dm_date, String dm_from_del) {
		super();
		this.dm_no = dm_no;
		this.dm_from = dm_from;
		this.dm_subject = dm_subject;
		this.dm_content = dm_content;
		this.dm_date = dm_date;
		this.dm_from_del = dm_from_del;
	}


	@Override
	public String toString() {
		return "DM [dm_no=" + dm_no + ", dm_from=" + dm_from + ", dm_subject=" + dm_subject + ", dm_content="
				+ dm_content + ", dm_date=" + dm_date + ", dm_from_del=" + dm_from_del + "]";
	}


	
	
}
