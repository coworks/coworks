package com.kh.coworks.mail.model.vo;

import java.io.Serializable;
import java.sql.Timestamp;

public class Mail implements Serializable {
	private int mail_no; // �ε���
	private String mail_from; // �߽���
	private int mail_to; // ������
	private String mail_subject; // ����
	private String mail_content; // ����
	private Timestamp mail_sendDate; // �����ð�
	private Timestamp mail_readDate; // �����ð�
	private String mail_isRead; // �б� ����
	private String mail_fromDel; // ������ ��������
	private String mail_toDel; // �޴��� ��������
	private int mfolder_no; // ���� �ε���
	private String mail_attachpath; // ÷������
	private String mail_to_email;
	private String mail_from_email;
	private String emp_name;

	public Mail() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public String getMail_from_email() {
		return mail_from_email;
	}



	public void setMail_from_email(String mail_from_email) {
		this.mail_from_email = mail_from_email;
	}



	public Mail(int mail_no, String mail_from, int mail_to, String mail_subject, String mail_content,
			Timestamp mail_sendDate, Timestamp mail_readDate, String mail_isRead, String mail_fromDel,
			String mail_toDel, int mfolder_no, String mail_attachpath, String mail_to_email, String emp_name) {
		super();
		this.mail_no = mail_no;
		this.mail_from = mail_from;
		this.mail_to = mail_to;
		this.mail_subject = mail_subject;
		this.mail_content = mail_content;
		this.mail_sendDate = mail_sendDate;
		this.mail_readDate = mail_readDate;
		this.mail_isRead = mail_isRead;
		this.mail_fromDel = mail_fromDel;
		this.mail_toDel = mail_toDel;
		this.mfolder_no = mfolder_no;
		this.mail_attachpath = mail_attachpath;
		this.mail_to_email = mail_to_email;
		this.emp_name = emp_name;
	}



	public String getMail_to_email() {
		return mail_to_email;
	}



	public void setMail_to_email(String mail_to_email) {
		this.mail_to_email = mail_to_email;
	}



	public int getMail_no() {
		return mail_no;
	}

	public void setMail_no(int mail_no) {
		this.mail_no = mail_no;
	}

	public String getMail_from() {
		return mail_from;
	}

	public void setMail_from(String string) {
		this.mail_from = string;
	}

	public int getMail_to() {
		return mail_to;
	}

	public void setMail_to(int mail_to) {
		this.mail_to = mail_to;
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

	public Timestamp getMail_readDate() {
		return mail_readDate;
	}

	public void setMail_readDate(Timestamp mail_readDate) {
		this.mail_readDate = mail_readDate;
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

	public int getMfolder_no() {
		return mfolder_no;
	}

	public void setMfolder_no(int mfolder_no) {
		this.mfolder_no = mfolder_no;
	}

	public String getMail_attachpath() {
		return mail_attachpath;
	}

	public void setMail_attachpath(String mail_attachpath) {
		this.mail_attachpath = mail_attachpath;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	@Override
	public String toString() {
		return "Mail [mail_no=" + mail_no + ", mail_from=" + mail_from + ", mail_to=" + mail_to + ", mail_subject="
				+ mail_subject + ", mail_content=" + mail_content + ", mail_sendDate=" + mail_sendDate
				+ ", mail_readDate=" + mail_readDate + ", mail_isRead=" + mail_isRead + ", mail_fromDel=" + mail_fromDel
				+ ", mail_toDel=" + mail_toDel + ", mfolder_no=" + mfolder_no + ", mail_attachpath=" + mail_attachpath
				+ ", emp_name=" + emp_name + "]";
	}
	
	

}
