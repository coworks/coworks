package com.kh.coworks.attendance.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;

import org.springframework.stereotype.Component;

@Component
public class Attendance implements Serializable {
	private int atten_no;// �ε���
	private int emp_no;// �����ȣ
	private Date atten_date;// ����
	private Time atten_attTime;// ��ٽð�
	private Time atten_leaveTime;// ��ٽð�
	private String atten_attLate;
	private String atten_leaveEarly;
	private String atten_hours;
	private String atten_attIP;// ��پ�����
	private String atten_leaveIP;// ��پ�����
	private String atten_state;// ���»���
	public int getAtten_no() {
		return atten_no;
	}
	public void setAtten_no(int atten_no) {
		this.atten_no = atten_no;
	}
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public Date getAtten_date() {
		return atten_date;
	}
	public void setAtten_date(Date atten_date) {
		this.atten_date = atten_date;
	}
	public Time getAtten_attTime() {
		return atten_attTime;
	}
	public void setAtten_attTime(Time atten_attTime) {
		this.atten_attTime = atten_attTime;
	}
	public Time getAtten_leaveTime() {
		return atten_leaveTime;
	}
	public void setAtten_leaveTime(Time atten_leaveTime) {
		this.atten_leaveTime = atten_leaveTime;
	}
	public String getAtten_attLate() {
		return atten_attLate;
	}
	public void setAtten_attLate(String atten_attLate) {
		this.atten_attLate = atten_attLate;
	}
	public String getAtten_leaveEarly() {
		return atten_leaveEarly;
	}
	public void setAtten_leaveEarly(String atten_leaveEarly) {
		this.atten_leaveEarly = atten_leaveEarly;
	}
	public String getAtten_hours() {
		return atten_hours;
	}
	public void setAtten_hours(String atten_hours) {
		this.atten_hours = atten_hours;
	}
	public String getAtten_attIP() {
		return atten_attIP;
	}
	public void setAtten_attIP(String atten_attIP) {
		this.atten_attIP = atten_attIP;
	}
	public String getAtten_leaveIP() {
		return atten_leaveIP;
	}
	public void setAtten_leaveIP(String atten_leaveIP) {
		this.atten_leaveIP = atten_leaveIP;
	}
	public String getAtten_state() {
		return atten_state;
	}
	public void setAtten_state(String atten_state) {
		this.atten_state = atten_state;
	}
	public Attendance() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Attendance(int atten_no, int emp_no, Date atten_date, Time atten_attTime, Time atten_leaveTime,
			String atten_attLate, String atten_leaveEarly, String atten_hours, String atten_attIP, String atten_leaveIP,
			String atten_state) {
		super();
		this.atten_no = atten_no;
		this.emp_no = emp_no;
		this.atten_date = atten_date;
		this.atten_attTime = atten_attTime;
		this.atten_leaveTime = atten_leaveTime;
		this.atten_attLate = atten_attLate;
		this.atten_leaveEarly = atten_leaveEarly;
		this.atten_hours = atten_hours;
		this.atten_attIP = atten_attIP;
		this.atten_leaveIP = atten_leaveIP;
		this.atten_state = atten_state;
	}
	@Override
	public String toString() {
		return "Attendance [atten_no=" + atten_no + ", emp_no=" + emp_no + ", atten_date=" + atten_date
				+ ", atten_attTime=" + atten_attTime + ", atten_leaveTime=" + atten_leaveTime + ", atten_attLate="
				+ atten_attLate + ", atten_leaveEarly=" + atten_leaveEarly + ", atten_hours=" + atten_hours
				+ ", atten_attIP=" + atten_attIP + ", atten_leaveIP=" + atten_leaveIP + ", atten_state=" + atten_state
				+ "]";
	}
	
	
	

}
