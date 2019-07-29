package com.kh.coworks.mail.model.vo;

import java.io.Serializable;
import java.sql.Timestamp;

public class Mail implements Serializable {
	private int mail_no; // 메일번호
	private String mail_subject; // 메일 제목
	private String mail_content; // 메일 내용
	private Timestamp mail_sendDate; // 보낸 날짜
	private String mail_isRead; // 일기 여부
	private String mail_fromDel; // 보낸 사람이 지운  여부
	private String mail_toDel; // 받은 사람이 지운 여부
	private String mail_star; // 즐겨 찾기
	private int mail_mark;	// 분류
	private String mail_to_email;	// 받은 사람 이메일
	private String mail_from_email; // 보낸 사람 이메일
	private String mail_name;
	

	public String getMail_name() {
		return mail_name;
	}

	public void setMail_name(String mail_name) {
		this.mail_name = mail_name;
	}

	public Mail() {
		super();
	}

	public int getMail_no() {
		return mail_no;
	}
	@Override
	public String toString() {
		return "Mail [mail_no=" + mail_no + ", mail_subject=" + mail_subject + ", mail_content=" + mail_content
				+ ", mail_sendDate=" + mail_sendDate + ", mail_isRead=" + mail_isRead + ", mail_fromDel=" + mail_fromDel
				+ ", mail_toDel=" + mail_toDel + ", mail_star=" + mail_star + ", mail_mark=" + mail_mark
				+ ", mail_to_email=" + mail_to_email + ", mail_from_email=" + mail_from_email + "]";
	}

	public void setMail_no(int mail_no) {
		this.mail_no = mail_no;
	}
	public String getMail_subject() {
		return mail_subject;
	}
	public void setMail_subject(String mail_subject) {
		this.mail_subject = mail_subject;
	}
	public String getMail_content() {
		return mail_content;
	}
	public void setMail_content(String mail_content) {
		this.mail_content = mail_content;
	}
	public Timestamp getMail_sendDate() {
		return mail_sendDate;
	}
	public void setMail_sendDate(Timestamp mail_sendDate) {
		this.mail_sendDate = mail_sendDate;
	}
	public String getMail_isRead() {
		return mail_isRead;
	}
	public void setMail_isRead(String mail_isRead) {
		this.mail_isRead = mail_isRead;
	}
	public String getMail_fromDel() {
		return mail_fromDel;
	}
	public void setMail_fromDel(String mail_fromDel) {
		this.mail_fromDel = mail_fromDel;
	}
	public String getMail_toDel() {
		return mail_toDel;
	}
	public void setMail_toDel(String mail_toDel) {
		this.mail_toDel = mail_toDel;
	}
	public String getMail_star() {
		return mail_star;
	}
	public void setMail_star(String mail_star) {
		this.mail_star = mail_star;
	}
	public int getMail_mark() {
		return mail_mark;
	}
	public void setMail_mark(int mail_mark) {
		this.mail_mark = mail_mark;
	}
	public String getMail_to_email() {
		return mail_to_email;
	}
	public void setMail_to_email(String mail_to_email) {
		this.mail_to_email = mail_to_email;
	}
	public String getMail_from_email() {
		return mail_from_email;
	}
	public void setMail_from_email(String mail_from_email) {
		this.mail_from_email = mail_from_email;
	}
	
}
