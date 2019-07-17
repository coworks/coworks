package com.kh.coworks.approve.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class ApprovDoc implements Serializable {
	private int adoc_no; // 문서인덱스
	private int aform_no; // 서식인덱스
	private int adoc_writerno; // 기안자사원번호
	private Timestamp adoc_uploadDate; // 게시날짜
	private int adoc_security; // 보안 등급
	private Date adoc_expiration; // 보존만료일
	private String adoc_subject; // 결재제목
	private String adoc_content; // 내용
	private String adoc_state; // 진행상황

	public ApprovDoc() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ApprovDoc(int adoc_no, int aform_no, int adoc_writerno, Timestamp adoc_uploadDate, int adoc_security,
			Date adoc_expiration, String adoc_subject, String adoc_content, String adoc_state) {
		super();
		this.adoc_no = adoc_no;
		this.aform_no = aform_no;
		this.adoc_writerno = adoc_writerno;
		this.adoc_uploadDate = adoc_uploadDate;
		this.adoc_security = adoc_security;
		this.adoc_expiration = adoc_expiration;
		this.adoc_subject = adoc_subject;
		this.adoc_content = adoc_content;
		this.adoc_state = adoc_state;
	}

	public int getAdoc_no() {
		return adoc_no;
	}

	public void setAdoc_no(int adoc_no) {
		this.adoc_no = adoc_no;
	}

	public int getAform_no() {
		return aform_no;
	}

	public void setAform_no(int aform_no) {
		this.aform_no = aform_no;
	}

	public int getAdoc_writerno() {
		return adoc_writerno;
	}

	public void setAdoc_writerno(int adoc_writerno) {
		this.adoc_writerno = adoc_writerno;
	}

	public Timestamp getAdoc_uploadDate() {
		return adoc_uploadDate;
	}

	public void setAdoc_uploadDate(Timestamp adoc_uploadDate) {
		this.adoc_uploadDate = adoc_uploadDate;
	}

	public int getAdoc_security() {
		return adoc_security;
	}

	public void setAdoc_security(int adoc_security) {
		this.adoc_security = adoc_security;
	}

	public Date getAdoc_expiration() {
		return adoc_expiration;
	}

	public void setAdoc_expiration(Date adoc_expiration) {
		this.adoc_expiration = adoc_expiration;
	}

	public String getAdoc_subject() {
		return adoc_subject;
	}

	public void setAdoc_subject(String adoc_subject) {
		this.adoc_subject = adoc_subject;
	}

	public String getAdoc_content() {
		return adoc_content;
	}

	public void setAdoc_content(String adoc_content) {
		this.adoc_content = adoc_content;
	}

	public String getAdoc_state() {
		return adoc_state;
	}

	public void setAdoc_state(String adoc_state) {
		this.adoc_state = adoc_state;
	}

	@Override
	public String toString() {
		return "ApprovDoc [adoc_no=" + adoc_no + ", aform_no=" + aform_no + ", adoc_writerno=" + adoc_writerno
				+ ", adoc_uploadDate=" + adoc_uploadDate + ", adoc_security=" + adoc_security + ", adoc_expiration="
				+ adoc_expiration + ", adoc_subject=" + adoc_subject + ", adoc_content=" + adoc_content
				+ ", adoc_state=" + adoc_state + "]";
	}

}
