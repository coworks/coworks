package com.kh.coworks.approval.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class ApprovalForm implements Serializable {
	private int aform_no; // 인덱스
	private String aform_title; // 서류 제목
	private String aform_folderName;// 폴더명
	private String aform_formPage;// 입력폼
	private String aform_docPage;// 출력폼

	public ApprovalForm() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ApprovalForm(int aform_no, String aform_title, String aform_folderName, String aform_formPage,
			String aform_docPage) {
		super();
		this.aform_no = aform_no;
		this.aform_title = aform_title;
		this.aform_folderName = aform_folderName;
		this.aform_formPage = aform_formPage;
		this.aform_docPage = aform_docPage;
	}

	public int getAform_no() {
		return aform_no;
	}

	public void setAform_no(int aform_no) {
		this.aform_no = aform_no;
	}

	public String getAform_title() {
		return aform_title;
	}

	public void setAform_title(String aform_title) {
		this.aform_title = aform_title;
	}

	public String getAform_folderName() {
		return aform_folderName;
	}

	public void setAform_folderName(String aform_folderName) {
		this.aform_folderName = aform_folderName;
	}

	public String getAform_formPage() {
		return aform_formPage;
	}

	public void setAform_formPage(String aform_formPage) {
		this.aform_formPage = aform_formPage;
	}

	public String getAform_docPage() {
		return aform_docPage;
	}

	public void setAform_docPage(String aform_docPage) {
		this.aform_docPage = aform_docPage;
	}

	@Override
	public String toString() {
		return "ApprovalForm [aform_no=" + aform_no + ", aform_title=" + aform_title + ", aform_folderName="
				+ aform_folderName + ", aform_formPage=" + aform_formPage + ", aform_docPage=" + aform_docPage + "]";
	}

}
