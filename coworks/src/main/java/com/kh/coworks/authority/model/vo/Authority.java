package com.kh.coworks.authority.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Authority implements Serializable {
	private int emp_no; // 사원번호
	private String emp_name;
	private String dept_name;
	private String job_title;
	private String auth_personnal; // �λ����
	private String auth_data; // �ڷ�Ǳ���
	private String auth_cal; // 사원 스케줄
	private String auth_board; // �Խ��ǰ�������
	private String auth_approval; // ���缭�ı���
	private String auth_authority; // ���Ѱ�������
	private String auth_pay; // 급여

	public Authority() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Authority(int emp_no, String emp_name, String dept_name, String job_title, String auth_personnal,
			String auth_data, String auth_cal, String auth_board, String auth_approval, String auth_authority,
			String auth_pay) {
		super();
		this.emp_no = emp_no;
		this.emp_name = emp_name;
		this.dept_name = dept_name;
		this.job_title = job_title;
		this.auth_personnal = auth_personnal;
		this.auth_data = auth_data;
		this.auth_cal = auth_cal;
		this.auth_board = auth_board;
		this.auth_approval = auth_approval;
		this.auth_authority = auth_authority;
		this.auth_pay = auth_pay;
	}

	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}

	public String getAuth_personnal() {
		return auth_personnal;
	}

	public void setAuth_personnal(String auth_personnal) {
		this.auth_personnal = auth_personnal;
	}

	public String getAuth_data() {
		return auth_data;
	}

	public void setAuth_data(String auth_data) {
		this.auth_data = auth_data;
	}

	public String getAuth_cal() {
		return auth_cal;
	}

	public void setAuth_cal(String auth_cal) {
		this.auth_cal = auth_cal;
	}

	public String getAuth_board() {
		return auth_board;
	}

	public void setAuth_board(String auth_board) {
		this.auth_board = auth_board;
	}

	public String getAuth_approval() {
		return auth_approval;
	}

	public void setAuth_approval(String auth_approval) {
		this.auth_approval = auth_approval;
	}

	public String getAuth_authority() {
		return auth_authority;
	}

	public void setAuth_authority(String auth_authority) {
		this.auth_authority = auth_authority;
	}

	public String getAuth_pay() {
		return auth_pay;
	}

	public void setAuth_pay(String auth_pay) {
		this.auth_pay = auth_pay;
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

	@Override
	public String toString() {
		return "Authority [emp_no=" + emp_no + ", emp_name=" + emp_name + ", dept_name=" + dept_name + ", job_title="
				+ job_title + ", auth_personnal=" + auth_personnal + ", auth_data=" + auth_data + ", auth_cal="
				+ auth_cal + ", auth_board=" + auth_board + ", auth_approval=" + auth_approval + ", auth_authority="
				+ auth_authority + ", auth_pay=" + auth_pay + "]";
	}

}
