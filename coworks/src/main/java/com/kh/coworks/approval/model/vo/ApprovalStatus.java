package com.kh.coworks.approval.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class ApprovalStatus implements Serializable {
	private int as_no;// �ε���
	private int aform_no;// �����ε���
	private int emp_no;// �����ȣ
	private String as_status;// ���ο���
	private Date as_date;// �����Ͻ�

	public ApprovalStatus() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ApprovalStatus(int as_no, int aform_no, int emp_no, String as_status, Date as_date) {
		super();
		this.as_no = as_no;
		this.aform_no = aform_no;
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

	public int getAform_no() {
		return aform_no;
	}

	public void setAform_no(int aform_no) {
		this.aform_no = aform_no;
	}

	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}

	public String getAs_status() {
		return as_status;
	}

	public void setAs_status(String as_status) {
		this.as_status = as_status;
	}

	public Date getAs_date() {
		return as_date;
	}

	public void setAs_date(Date as_date) {
		this.as_date = as_date;
	}

	@Override
	public String toString() {
		return "ApprovStatus [as_no=" + as_no + ", aform_no=" + aform_no + ", emp_no=" + emp_no + ", as_status="
				+ as_status + ", as_date=" + as_date + "]";
	}

}
