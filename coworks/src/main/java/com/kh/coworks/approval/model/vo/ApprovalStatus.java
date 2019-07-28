package com.kh.coworks.approval.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class ApprovalStatus implements Serializable {
	private int as_no;// �ε���
	private int adoc_no;// �����ε���
	private int emp_no;// �����ȣ
	private int as_status;// ���ο���
	private Date as_date;// �����Ͻ�
	
	private String emp_name;
	private String dept_name;
	private String job_title;
	private String emp_signature;

	public ApprovalStatus() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ApprovalStatus(int as_no, int adoc_no, int emp_no, int as_status, Date as_date) {
		super();
		this.as_no = as_no;
		this.adoc_no = adoc_no;
		this.emp_no = emp_no;
		this.as_status = as_status;
		this.as_date = as_date;
	}

	public int getAs_no() {
		return as_no;
	}

	public void setAs_no(int as_no) {
		this.as_no = as_no;
	}

	public int getAdoc_no() {
		return adoc_no;
	}

	public void setAdoc_no(int adoc_no) {
		this.adoc_no = adoc_no;
	}

	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}

	public int getAs_status() {
		return as_status;
	}

	public void setAs_status(int as_status) {
		this.as_status = as_status;
	}

	public Date getAs_date() {
		return as_date;
	}

	public void setAs_date(Date as_date) {
		this.as_date = as_date;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	public String getJob_title() {
		return job_title;
	}

	public void setJob_title(String job_title) {
		this.job_title = job_title;
	}

	public String getEmp_signature() {
		return emp_signature;
	}

	public void setEmp_signature(String emp_signature) {
		this.emp_signature = emp_signature;
	}

	@Override
	public String toString() {
		return "ApprovStatus [as_no=" + as_no + ", adoc_no=" + adoc_no + ", emp_no=" + emp_no + ", as_status="
				+ as_status + ", as_date=" + as_date + "]";
	}

}
