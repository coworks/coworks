package com.kh.coworks.board.model.vo;

import java.io.Serializable;
import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class Board implements Serializable {
	private int bo_no;// �ε���
	private String bo_code;// �Խ����ڵ�
	private String bo_title;// ����
	private String bo_content;// ����
	private int emp_no;// �ۼ��ڻ��
	private Timestamp bo_date;// �Խ� ��¥
	private String bo_status;// ��������
	
	private String writerName;

	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Board(int bo_no, String bo_code, String bo_title, String bo_content, int emp_no, Timestamp bo_date,
			String bo_status, String writerName) {
		super();
		this.bo_no = bo_no;
		this.bo_code = bo_code;
		this.bo_title = bo_title;
		this.bo_content = bo_content;
		this.emp_no = emp_no;
		this.bo_date = bo_date;
		this.bo_status = bo_status;
		this.writerName = writerName;
	}

	public int getBo_no() {
		return bo_no;
	}

	public void setBo_no(int bo_no) {
		this.bo_no = bo_no;
	}

	public String getBo_code() {
		return bo_code;
	}

	public void setBo_code(String bo_code) {
		this.bo_code = bo_code;
	}

	public String getBo_title() {
		return bo_title;
	}

	public void setBo_title(String bo_title) {
		this.bo_title = bo_title;
	}

	public String getBo_content() {
		return bo_content;
	}

	public void setBo_content(String bo_content) {
		this.bo_content = bo_content;
	}

	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}

	public Timestamp getBo_date() {
		return bo_date;
	}

	public void setBo_date(Timestamp bo_date) {
		this.bo_date = bo_date;
	}

	public String getBo_status() {
		return bo_status;
	}

	public void setBo_status(String bo_status) {
		this.bo_status = bo_status;
	}

	public String getWriterName() {
		return writerName;
	}

	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}

	@Override
	public String toString() {
		return "Board [bo_no=" + bo_no + ", bo_code=" + bo_code + ", bo_title=" + bo_title + ", bo_content="
				+ bo_content + ", emp_no=" + emp_no + ", bo_date=" + bo_date + ", bo_status=" + bo_status
				+ ", writerName=" + writerName + "]";
	}
	
	

}
