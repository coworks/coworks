package com.kh.coworks.board.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class BoardGroup implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5005L;
	
	
	private int bg_no; // �ε���
	private String bg_code; // �Խ����ڵ�
	private String bg_title; // �Խ��� �̸�

	public BoardGroup() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardGroup(int bg_no, String bg_code, String bg_title) {
		super();
		this.bg_no = bg_no;
		this.bg_code = bg_code;
		this.bg_title = bg_title;
	}

	public int getBg_no() {
		return bg_no;
	}

	public void setBg_no(int bg_no) {
		this.bg_no = bg_no;
	}

	public String getBg_code() {
		return bg_code;
	}

	public void setBg_code(String bg_code) {
		this.bg_code = bg_code;
	}

	public String getBg_title() {
		return bg_title;
	}

	public void setBg_title(String bg_title) {
		this.bg_title = bg_title;
	}

	@Override
	public String toString() {
		return "BoardGroup [bg_no=" + bg_no + ", bg_code=" + bg_code + ", bg_title=" + bg_title + "]";
	}

}
