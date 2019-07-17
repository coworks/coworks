package com.kh.coworks.approve.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class ApprovAttach implements Serializable {
	private int apAtt_no;// 인덱스
	private int adoc_no;// 문서인덱스
	private String apAtt_oriname;// 파일기존이름
	private String apAtt_rename;// 파일변경이름
	private String apAtt_path;// 파일경로

	public ApprovAttach() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ApprovAttach(int apAtt_no, int adoc_no, String apAtt_oriname, String apAtt_rename, String apAtt_path) {
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
