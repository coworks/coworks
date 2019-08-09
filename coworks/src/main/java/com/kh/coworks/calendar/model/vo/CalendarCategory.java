package com.kh.coworks.calendar.model.vo;

import java.io.Serializable;

public class CalendarCategory implements Serializable{

	private int calcate_no;
	private int emp_no;
	private String calcate_name;
	private String calcate_color;
	
	
	public CalendarCategory() {
		super();
	}


	public CalendarCategory(int calcate_no, int emp_no, String calcate_name, String calcate_color) {
		super();
		this.calcate_no = calcate_no;
		this.emp_no = emp_no;
		this.calcate_name = calcate_name;
		this.calcate_color = calcate_color;
	}


	public int getCalcate_no() {
		return calcate_no;
	}


	public void setCalcate_no(int calcate_no) {
		this.calcate_no = calcate_no;
	}


	public int getEmp_no() {
		return emp_no;
	}


	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}


	public String getCalcate_name() {
		return calcate_name;
	}


	public void setCalcate_name(String calcate_name) {
		this.calcate_name = calcate_name;
	}


	public String getCalcate_color() {
		return calcate_color;
	}


	public void setCalcate_color(String calcate_color) {
		this.calcate_color = calcate_color;
	}


	@Override
	public String toString() {
		return "CalendarCategory [calcate_no=" + calcate_no + ", emp_no=" + emp_no + ", calcate_name=" + calcate_name
				+ ", calcate_color=" + calcate_color + "]";
	}

	
	
}