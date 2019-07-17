package com.kh.coworks.approve.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class ApprovForm implements Serializable {
	private int aform_no; // 인덱스
	private String aform_filename; // 파일명
	private String aform_path; // 서식경로
	private String aform_page; // JSP화면

	public ApprovForm() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ApprovForm(int aform_no, String aform_filename, String aform_path, String aform_page) {
		super();
		this.aform_no = aform_no;
		this.aform_filename = aform_filename;
		this.aform_path = aform_path;
		this.aform_page = aform_page;
	}

	public int getAform_no() {
		return aform_no;
	}

	public void setAform_no(int aform_no) {
		this.aform_no = aform_no;
	}

	public String getAform_filename() {
		return aform_filename;
	}

	public void setAform_filename(String aform_filename) {
		this.aform_filename = aform_filename;
	}

	public String getAform_path() {
		return aform_path;
	}

	public void setAform_path(String aform_path) {
		this.aform_path = aform_path;
	}

	public String getAform_page() {
		return aform_page;
	}

	public void setAform_page(String aform_page) {
		this.aform_page = aform_page;
	}

	@Override
	public String toString() {
		return "ApprovForm [aform_no=" + aform_no + ", aform_filename=" + aform_filename + ", aform_path=" + aform_path
				+ ", aform_page=" + aform_page + "]";
	}

}
