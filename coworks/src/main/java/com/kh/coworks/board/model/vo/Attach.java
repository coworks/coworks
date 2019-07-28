package com.kh.coworks.board.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Attach implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 9090L;
	
	private int attach_no;// �ε���
	private int bo_no;// �Խñ��ε���
	private String attach_oriname;// ���ϱ����̸�
	private String attach_rename;// ���Ϻ����̸�
	private String attach_path;// ���ϰ��

	public Attach() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Attach(int attach_no, int bo_no, String attach_oriname, String attach_rename, String attach_path) {
		super();
		this.attach_no = attach_no;
		this.bo_no = bo_no;
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

	public int getBo_no() {
		return bo_no;
	}

	public void setBo_no(int bo_no) {
		this.bo_no = bo_no;
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

	@Override
	public String toString() {
		return "Attach [attach_no=" + attach_no + ", bo_no=" + bo_no + ", attach_oriname=" + attach_oriname
				+ ", attach_rename=" + attach_rename + ", attach_path=" + attach_path + "]";
	}

}
