package com.kh.coworks.education.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class EduApply implements Serializable {

	private int eapp_no;// 교육 신청한 순서
	private int emp_no;// 사번
	private int edu_no;// 교육 번호

	public EduApply() {
		super();
		// TODO Auto-generated constructor stub
	}

	public EduApply(int eapp_no, int emp_no, int edu_no) {
		super();
		this.eapp_no = eapp_no;
		this.emp_no = emp_no;
		this.edu_no = edu_no;
	}

	public int getEapp_no() {
		return eapp_no;
	}

	public void setEapp_no(int eapp_no) {
		this.eapp_no = eapp_no;
	}

	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}

	public int getEdu_no() {
		return edu_no;
	}

	public void setEdu_no(int edu_no) {
		this.edu_no = edu_no;
	}

	@Override
	public String toString() {
		return "EduApply [eapp_no=" + eapp_no + ", emp_no=" + emp_no + ", edu_no=" + edu_no + "]";
	}

}
