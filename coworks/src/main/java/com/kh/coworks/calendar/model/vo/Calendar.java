package com.kh.coworks.calendar.model.vo;

import java.sql.Timestamp;

public class Calendar {
	private int cal_no;
	private String cal_holder;
	private String cal_type;
	private String cal_color;
	private String cal_name;
	private String cal_content;
	private Timestamp cal_beginDate;
	private Timestamp cal_endDate;
	
	
	public Calendar() {
		super();
	}
	
	
	
	
	public Calendar(int cal_no, String cal_holder, String cal_type, String cal_color, String cal_name,
			String cal_content, Timestamp cal_beginDate, Timestamp cal_endDate) {
		super();
		this.cal_no = cal_no;
		this.cal_holder = cal_holder;
		this.cal_type = cal_type;
		this.cal_color = cal_color;
		this.cal_name = cal_name;
		this.cal_content = cal_content;
		this.cal_beginDate = cal_beginDate;
		this.cal_endDate = cal_endDate;
	}




	public String getCal_color() {
		return cal_color;
	}




	public void setCal_color(String cal_color) {
		this.cal_color = cal_color;
	}




	public Timestamp getCal_beginDate() {
		return cal_beginDate;
	}




	public void setCal_beginDate(Timestamp cal_beginDate) {
		this.cal_beginDate = cal_beginDate;
	}




	public Timestamp getCal_endDate() {
		return cal_endDate;
	}




	public void setCal_endDate(Timestamp cal_endDate) {
		this.cal_endDate = cal_endDate;
	}




	public int getCal_no() {
		return cal_no;
	}
	public void setCal_no(int cal_no) {
		this.cal_no = cal_no;
	}
	public String getCal_holder() {
		return cal_holder;
	}
	public void setCal_holder(String cal_holder) {
		this.cal_holder = cal_holder;
	}
	public String getCal_type() {
		return cal_type;
	}
	public void setCal_type(String cal_type) {
		this.cal_type = cal_type;
	}
	public String getCal_name() {
		return cal_name;
	}
	public void setCal_name(String cal_name) {
		this.cal_name = cal_name;
	}
	public String getCal_content() {
		return cal_content;
	}
	public void setCal_content(String cal_content) {
		this.cal_content = cal_content;
	}




	@Override
	public String toString() {
		return "Calendar [cal_no=" + cal_no + ", cal_holder=" + cal_holder + ", cal_type=" + cal_type + ", cal_color="
				+ cal_color + ", cal_name=" + cal_name + ", cal_content=" + cal_content + ", cal_beginDate="
				+ cal_beginDate + ", cal_endDate=" + cal_endDate + "]";
	}
 

 
	
	
	
	
	
}
