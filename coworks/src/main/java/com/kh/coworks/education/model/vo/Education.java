package com.kh.coworks.education.model.vo;

import java.io.Serializable;
import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class Education implements Serializable {
	private int edu_no;// 인덱스
	private String edu_title;// 프로그램명
	private String edu_instructor;// 강사명
	private String edu_type;// 분류
	private int edu_limitCnt;// 정원
	private int edu_curCnt;// 신청인원
	private Timestamp edu_applyBgDate;// 신청시작일
	private Timestamp edu_applyEndDate;// 신청마감일
	private String edu_applyState;// 신청가능여부
	private String edu_image;// 상세설명이미지

	public Education() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Education(int edu_no, String edu_title, String edu_instructor, String edu_type, int edu_limitCnt,
			int edu_curCnt, Timestamp edu_applyBgDate, Timestamp edu_applyEndDate, String edu_applyState,
			String edu_image) {
		super();
		this.edu_no = edu_no;
		this.edu_title = edu_title;
		this.edu_instructor = edu_instructor;
		this.edu_type = edu_type;
		this.edu_limitCnt = edu_limitCnt;
		this.edu_curCnt = edu_curCnt;
		this.edu_applyBgDate = edu_applyBgDate;
		this.edu_applyEndDate = edu_applyEndDate;
		this.edu_applyState = edu_applyState;
		this.edu_image = edu_image;
	}

	public int getEdu_no() {
		return edu_no;
	}

	public void setEdu_no(int edu_no) {
		this.edu_no = edu_no;
	}

	public String getEdu_title() {
		return edu_title;
	}

	public void setEdu_title(String edu_title) {
		this.edu_title = edu_title;
	}

	public String getEdu_instructor() {
		return edu_instructor;
	}

	public void setEdu_instructor(String edu_instructor) {
		this.edu_instructor = edu_instructor;
	}

	public String getEdu_type() {
		return edu_type;
	}

	public void setEdu_type(String edu_type) {
		this.edu_type = edu_type;
	}

	public int getEdu_limitCnt() {
		return edu_limitCnt;
	}

	public void setEdu_limitCnt(int edu_limitCnt) {
		this.edu_limitCnt = edu_limitCnt;
	}

	public int getEdu_curCnt() {
		return edu_curCnt;
	}

	public void setEdu_curCnt(int edu_curCnt) {
		this.edu_curCnt = edu_curCnt;
	}

	public Timestamp getEdu_applyBgDate() {
		return edu_applyBgDate;
	}

	public void setEdu_applyBgDate(Timestamp edu_applyBgDate) {
		this.edu_applyBgDate = edu_applyBgDate;
	}

	public Timestamp getEdu_applyEndDate() {
		return edu_applyEndDate;
	}

	public void setEdu_applyEndDate(Timestamp edu_applyEndDate) {
		this.edu_applyEndDate = edu_applyEndDate;
	}

	public String getEdu_applyState() {
		return edu_applyState;
	}

	public void setEdu_applyState(String edu_applyState) {
		this.edu_applyState = edu_applyState;
	}

	public String getEdu_image() {
		return edu_image;
	}

	public void setEdu_image(String edu_image) {
		this.edu_image = edu_image;
	}

	@Override
	public String toString() {
		return "Education [edu_no=" + edu_no + ", edu_title=" + edu_title + ", edu_instructor=" + edu_instructor
				+ ", edu_type=" + edu_type + ", edu_limitCnt=" + edu_limitCnt + ", edu_curCnt=" + edu_curCnt
				+ ", edu_applyBgDate=" + edu_applyBgDate + ", edu_applyEndDate=" + edu_applyEndDate
				+ ", edu_applyState=" + edu_applyState + ", edu_image=" + edu_image + "]";
	}

}
