package com.kh.coworks.education.model.vo;

import java.io.Serializable;
import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class EduReport implements Serializable {
	private int edurep_no;// 인덱스
	private int edu_no;// 교육인덱스
	private int emp_no;// 사번
	private String edurep_title;// 제목
	private String edurep_content;// 내용
	private Timestamp edurep_date;// 작성일

	public EduReport() {
		super();
		// TODO Auto-generated constructor stub
	}

	public EduReport(int edurep_no, int edu_no, int emp_no, String edurep_title, String edurep_content, Timestamp edurep_date) {
		super();
		this.edurep_no = edurep_no;
		this.edu_no = edu_no;
		this.emp_no = emp_no;
		this.edurep_title = edurep_title;
		this.edurep_content = edurep_content;
		this.edurep_date = edurep_date;
	}

	public int getedurep_no() {
		return edurep_no;
	}

	public void setedurep_no(int edurep_no) {
		this.edurep_no = edurep_no;
	}

	public int getEdu_no() {
		return edu_no;
	}

	public void setEdu_no(int edu_no) {
		this.edu_no = edu_no;
	}

	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}

	public String getedurep_title() {
		return edurep_title;
	}

	public void setedurep_title(String edurep_title) {
		this.edurep_title = edurep_title;
	}

	public String getedurep_content() {
		return edurep_content;
	}

	public void setedurep_content(String edurep_content) {
		this.edurep_content = edurep_content;
	}

	public Timestamp getedurep_date() {
		return edurep_date;
	}

	public void setedurep_date(Timestamp edurep_date) {
		this.edurep_date = edurep_date;
	}

	@Override
	public String toString() {
		return "EduReport [edurep_no=" + edurep_no + ", edu_no=" + edu_no + ", emp_no=" + emp_no + ", edurep_title="
				+ edurep_title + ", edurep_content=" + edurep_content + ", edurep_date=" + edurep_date + "]";
	}

}
