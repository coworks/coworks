package com.kh.coworks.board.model.vo;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class Board implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3213L;
	
	
	private int bo_no;// �ε���
	private String bo_code;// �Խ����ڵ�
	private String bo_title;// ����
	private String bo_content;// ����
	private int emp_no;// �ۼ��ڻ��
	private Timestamp bo_date;// �Խ� ��¥
	private String bo_status;// ��������
	private int bo_type;
	
	private int bg_no; // �ε���
	private String bg_code; // �Խ����ڵ�
	private String bg_title; // �Խ��� �̸�
	
	private String writerName;
	private int fileCount;
	private List<Attach> files = new ArrayList<>();
	
	private int rnum;
	
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
	
	

	
	public Board(int bo_no, String bo_code, String bo_title, String bo_content, int emp_no, Timestamp bo_date,
			String bo_status, int bo_type, String writerName, int fileCount, List<Attach> files) {
		super();
		this.bo_no = bo_no;
		this.bo_code = bo_code;
		this.bo_title = bo_title;
		this.bo_content = bo_content;
		this.emp_no = emp_no;
		this.bo_date = bo_date;
		this.bo_status = bo_status;
		this.bo_type = bo_type;
		this.writerName = writerName;
		this.fileCount = fileCount;
		this.files = files;
	}


	public Board(int bo_no, String bo_code, String bo_title, String bo_content, int emp_no, Timestamp bo_date,
			String bo_status, String writerName, int fileCount, List<Attach> files) {
		super();
		this.bo_no = bo_no;
		this.bo_code = bo_code;
		this.bo_title = bo_title;
		this.bo_content = bo_content;
		this.emp_no = emp_no;
		this.bo_date = bo_date;
		this.bo_status = bo_status;
		this.writerName = writerName;
		this.fileCount = fileCount;
		this.files = files;
		
	}

	



	public Board(int bo_no, String bo_code, String bo_title, String bo_content, int emp_no, Timestamp bo_date,
			String bo_status, int bo_type, int bg_no, String bg_code, String bg_title, String writerName, int fileCount,
			List<Attach> files, int rnum) {
		super();
		this.bo_no = bo_no;
		this.bo_code = bo_code;
		this.bo_title = bo_title;
		this.bo_content = bo_content;
		this.emp_no = emp_no;
		this.bo_date = bo_date;
		this.bo_status = bo_status;
		this.bo_type = bo_type;
		this.bg_no = bg_no;
		this.bg_code = bg_code;
		this.bg_title = bg_title;
		this.writerName = writerName;
		this.fileCount = fileCount;
		this.files = files;
		this.rnum = rnum;
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



	public int getBo_type() {
		return bo_type;
	}


	public void setBo_type(int bo_type) {
		this.bo_type = bo_type;
	}


	@Override
	public String toString() {
		return "Board [bo_no=" + bo_no + ", bo_code=" + bo_code + ", bo_title=" + bo_title + ", bo_content="
				+ bo_content + ", emp_no=" + emp_no + ", bo_date=" + bo_date + ", bo_status=" + bo_status + ", bo_type="
				+ bo_type + ", bg_no=" + bg_no + ", bg_code=" + bg_code + ", bg_title=" + bg_title + ", writerName="
				+ writerName + ", fileCount=" + fileCount + ", files=" + files + ", rnum=" + rnum + "]";
	}

	public int getFileCount() {
		return fileCount;
	}

	public void setFileCount(int fileCount) {
		this.fileCount = fileCount;
	}

	public List<Attach> getFiles() {
		return files;
	}

	public void setFiles(List<Attach> files) {
		this.files = files;
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


	public int getRnum() {
		return rnum;
	}


	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	
	
	

}
