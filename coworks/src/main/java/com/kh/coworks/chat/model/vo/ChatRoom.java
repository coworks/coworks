package com.kh.coworks.chat.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class ChatRoom implements Serializable {
	private int croom_index;
	private int croom_no;// �ε���
	private int emp_no;// ������
	private String croom_title;// ä�ù��̸�

	public ChatRoom() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ChatRoom(int croom_index, int croom_no, int emp_no, String croom_title) {
		super();
		this.croom_index = croom_index;
		this.croom_no = croom_no;
		this.emp_no = emp_no;
		this.croom_title = croom_title;
	}

	public int getCroom_index() {
		return croom_index;
	}

	public void setCroom_index(int croom_index) {
		this.croom_index = croom_index;
	}

	public int getCroom_no() {
		return croom_no;
	}

	public void setCroom_no(int croom_no) {
		this.croom_no = croom_no;
	}

	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}

	public String getCroom_title() {
		return croom_title;
	}

	public void setCroom_title(String croom_title) {
		this.croom_title = croom_title;
	}

	@Override
	public String toString() {
		return "ChatRoom [croom_index=" + croom_index + ", croom_no=" + croom_no + ", emp_no=" + emp_no
				+ ", croom_title=" + croom_title + "]";
	}

}
