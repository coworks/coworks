package com.kh.coworks.authority.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Authority implements Serializable {
	private int emp_no; // 사원번호
	private String auth_personnal; // �λ����
	private String auth_data; // �ڷ�Ǳ���
	private String auth_schedule; // 사원 스케줄
	private String auth_board; // �Խ��ǰ�������
	private String auth_approval; // ���缭�ı���
	private String auth_authority; // ���Ѱ�������
	private String auth_pay; // 급여

	public Authority() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Authority(int emp_no, String auth_personnal, String auth_data, String auth_schedule, String auth_board,
			String auth_approval, String auth_authority, String auth_pay) {
		super();
		this.emp_no = emp_no;
		this.auth_personnal = auth_personnal;
		this.auth_data = auth_data;
		this.auth_schedule = auth_schedule;
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

	public String getAuth_schedule() {
		return auth_schedule;
	}

	public void setAuth_schedule(String auth_schedule) {
		this.auth_schedule = auth_schedule;
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

	@Override
	public String toString() {
		return "Authority [emp_no=" + emp_no + ", auth_personnal=" + auth_personnal + ", auth_data=" + auth_data
				+ ", auth_schedule=" + auth_schedule + ", auth_board=" + auth_board + ", auth_approval=" + auth_approval
				+ ", auth_authority=" + auth_authority + ", auth_pay=" + auth_pay + "]";
	}

}
