package com.kh.coworks.approval.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class ApprovalDoc implements Serializable {
	private int adoc_no; // 문서번호
	private int aform_no; // 서식문서 번호
	private int adoc_writerno; // 작성자
	private Timestamp adoc_uploadDate; // 올린날짜
	private int adoc_security; // 보안등급
	private Date adoc_expiration; // 만료일
	private String adoc_subject; // 제목
	private String adoc_content; // 내용
	private int adoc_status; // 결재 상태

	private String writerDept;
	private String writerJobTitle;
	private String writerName;
	
	private String docPage;
	private String aform_title;
	private int curApprovalno;

	public ApprovalDoc() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ApprovalDoc(int adoc_no, int aform_no, int adoc_writerno, Timestamp adoc_uploadDate, int adoc_security,
			Date adoc_expiration, String adoc_subject, String adoc_content, int adoc_status) {
		super();
		this.adoc_no = adoc_no;
		this.aform_no = aform_no;
		this.adoc_writerno = adoc_writerno;
		this.adoc_uploadDate = adoc_uploadDate;
		this.adoc_security = adoc_security;
		this.adoc_expiration = adoc_expiration;
		this.adoc_subject = adoc_subject;
		this.adoc_content = adoc_content;
		this.adoc_status = adoc_status;
	}

	public ApprovalDoc(int adoc_no, int aform_no, int adoc_writerno, Timestamp adoc_uploadDate, int adoc_security,
			Date adoc_expiration, String adoc_subject, String adoc_content, int adoc_status, String writerDept,
			String writerJobTitle, String writerName) {
		super();
		this.adoc_no = adoc_no;
		this.aform_no = aform_no;
		this.adoc_writerno = adoc_writerno;
		this.adoc_uploadDate = adoc_uploadDate;
		this.adoc_security = adoc_security;
		this.adoc_expiration = adoc_expiration;
		this.adoc_subject = adoc_subject;
		this.adoc_content = adoc_content;
		this.adoc_status = adoc_status;
		this.writerDept = writerDept;
		this.writerJobTitle = writerJobTitle;
		this.writerName = writerName;
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

	public int getAdoc_status() {
		return adoc_status;
	}

	public void setAdoc_status(int adoc_status) {
		this.adoc_status = adoc_status;
	}

	public String getWriterDept() {
		return writerDept;
	}

	public void setWriterDept(String writerDept) {
		this.writerDept = writerDept;
	}

	public String getWriterJobTitle() {
		return writerJobTitle;
	}

	public void setWriterJobTitle(String writerJobTitle) {
		this.writerJobTitle = writerJobTitle;
	}

	public String getWriterName() {
		return writerName;
	}

	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}

	public String getDocPage() {
		return docPage;
	}

	public void setDocPage(String docPage) {
		this.docPage = docPage;
	}

	public String getAform_title() {
		return aform_title;
	}

	public void setAform_title(String aform_title) {
		this.aform_title = aform_title;
	}

	public int getCurApprovalno() {
		return curApprovalno;
	}

	public void setCurApprovalno(int curApprovalno) {
		this.curApprovalno = curApprovalno;
	}

	@Override
	public String toString() {
		return "ApprovDoc [adoc_no=" + adoc_no + ", aform_no=" + aform_no + ", adoc_writerno=" + adoc_writerno
				+ ", adoc_uploadDate=" + adoc_uploadDate + ", adoc_security=" + adoc_security + ", adoc_expiration="
				+ adoc_expiration + ", adoc_subject=" + adoc_subject + ", adoc_content=" + adoc_content
				+ ", adoc_status=" + adoc_status + ", writerDept=" + writerDept + ", writerJobTitle=" + writerJobTitle
				+ ", writerName=" + writerName + "]";
	}

}
