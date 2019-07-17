package com.kh.coworks.mail.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Mfolder implements Serializable {

	private int mfolder_no; // �ε���
	private int emp_no; // ���
	private String mfolder_name; // ������
	public Mfolder() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Mfolder(int mfolder_no, int emp_no, String mfolder_name) {
		super();
		this.mfolder_no = mfolder_no;
		this.emp_no = emp_no;
		this.mfolder_name = mfolder_name;
	}
	public int getMfolder_no() {
		return mfolder_no;
	}
	public void setMfolder_no(int mfolder_no) {
		this.mfolder_no = mfolder_no;
	}
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public String getMfolder_name() {
		return mfolder_name;
	}
	public void setMfolder_name(String mfolder_name) {
		this.mfolder_name = mfolder_name;
	}
	@Override
	public String toString() {
		return "Mfolder [mfolder_no=" + mfolder_no + ", emp_no=" + emp_no + ", mfolder_name=" + mfolder_name + "]";
	}
	
	
}
