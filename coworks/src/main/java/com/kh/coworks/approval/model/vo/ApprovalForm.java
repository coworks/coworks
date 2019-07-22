package com.kh.coworks.approval.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class ApprovalForm implements Serializable {
	private int aform_no; // 인덱스
	private int adoc_no; // 문서번호
	private String aform_inputName;// 칼럼명
	private String aform_inputData;// 데이타

	public ApprovalForm() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ApprovalForm(int aform_no, int adoc_no, String aform_inputName, String aform_inputData) {
		super();
		this.aform_no = aform_no;
		this.adoc_no = adoc_no;
		this.aform_inputName = aform_inputName;
		this.aform_inputData = aform_inputData;
	}

	public int getAform_no() {
		return aform_no;
	}

	public void setAform_no(int aform_no) {
		this.aform_no = aform_no;
	}

	public int getAdoc_no() {
		return adoc_no;
	}

	public void setAdoc_no(int adoc_no) {
		this.adoc_no = adoc_no;
	}

	public String getAform_inputName() {
		return aform_inputName;
	}

	public void setAform_inputName(String aform_inputName) {
		this.aform_inputName = aform_inputName;
	}

	public String getAform_inputData() {
		return aform_inputData;
	}

	public void setAform_inputData(String aform_inputData) {
		this.aform_inputData = aform_inputData;
	}

	@Override
	public String toString() {
		return "ApprovForm [aform_no=" + aform_no + ", adoc_no=" + adoc_no + ", aform_inputName=" + aform_inputName
				+ ", aform_inputData=" + aform_inputData + "]";
	}

}
