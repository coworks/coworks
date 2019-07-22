package com.kh.coworks.mail.model.vo;

import java.io.Serializable;

public class MailAttach implements Serializable{

	/**
	 *  
	 */
	private static final long serialVersionUID = 1212L;
	
	private int attach_no;
	private int mail_no;
	private String attach_oriname;
	private String attach_rename;
	private String attach_path;
	
	public MailAttach() {
		super();
	}
	public MailAttach(int attach_no, int mail_no, String attach_oriname, String attach_rename, String attach_path) {
		super();
		this.attach_no = attach_no;
		this.mail_no = mail_no;
		this.attach_oriname = attach_oriname;
		this.attach_rename = attach_rename;
		this.attach_path = attach_path;
	}
	
	public int getAttach_no() {
		return attach_no;
	}
	
	public void setAttach_no(int attach_no) {
		this.attach_no = attach_no;
	}
	public int getMail_no() {
		return mail_no;
	}
	public void setMail_no(int mail_no) {
		this.mail_no = mail_no;
	}
	public String getAttach_oriname() {
		return attach_oriname;
	}
	public void setAttach_oriname(String attach_oriname) {
		this.attach_oriname = attach_oriname;
	}
	public String getAttach_rename() {
		return attach_rename;
	}
	public void setAttach_rename(String attach_rename) {
		this.attach_rename = attach_rename;
	}
	public String getAttach_path() {
		return attach_path;
	}
	public void setAttach_path(String attach_path) {
		this.attach_path = attach_path;
	}

	
}
