package com.kh.coworks.approval.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class ApprovalAttach implements Serializable {
	private int apAtt_no;// �ε���
	private int adoc_no;// �����ε���
	private String apAtt_oriname;// ���ϱ����̸�
	private String apAtt_rename;// ���Ϻ����̸�
	private String apAtt_path;// ���ϰ��

	public ApprovalAttach() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ApprovalAttach(int apAtt_no, int adoc_no, String apAtt_oriname, String apAtt_rename, String apAtt_path) {
		super();
		this.apAtt_no = apAtt_no;
		this.adoc_no = adoc_no;
		this.apAtt_oriname = apAtt_oriname;
		this.apAtt_rename = apAtt_rename;
		this.apAtt_path = apAtt_path;
	}

	public int getApAtt_no() {
		return apAtt_no;
	}

	public void setApAtt_no(int apAtt_no) {
		this.apAtt_no = apAtt_no;
	}

	public int getAdoc_no() {
		return adoc_no;
	}

	public void setAdoc_no(int adoc_no) {
		this.adoc_no = adoc_no;
	}

	public String getApAtt_oriname() {
		return apAtt_oriname;
	}

	public void setApAtt_oriname(String apAtt_oriname) {
		this.apAtt_oriname = apAtt_oriname;
	}

	public String getApAtt_rename() {
		return apAtt_rename;
	}

	public void setApAtt_rename(String apAtt_rename) {
		this.apAtt_rename = apAtt_rename;
	}

	public String getApAtt_path() {
		return apAtt_path;
	}

	public void setApAtt_path(String apAtt_path) {
		this.apAtt_path = apAtt_path;
	}

	@Override
	public String toString() {
		return "ApprovAttach [apAtt_no=" + apAtt_no + ", adoc_no=" + adoc_no + ", apAtt_oriname=" + apAtt_oriname
				+ ", apAtt_rename=" + apAtt_rename + ", apAtt_path=" + apAtt_path + "]";
	}

}
