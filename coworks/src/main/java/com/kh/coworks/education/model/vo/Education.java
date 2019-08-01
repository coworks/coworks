package com.kh.coworks.education.model.vo;

import java.io.Serializable;
import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class Education implements Serializable {
	private int edu_no;// 교육 시퀀스번호
	private String edu_title;// 교육명 이름
	private String edu_instructor;// 강사
	private String edu_type; // "인성" "마케팅" "회계" 
	private int edu_limitCnt;// 정원
	private int edu_curCnt;// 현재정원
	private Timestamp edu_eduDate;	// 교육일
	private Timestamp edu_applyBgDate;// 시작일
	private Timestamp edu_applyEndDate;// 종료일
	private String edu_applyState;// 신청 가능 여부
	private String edu_color; //색상
	private String edu_image;// 상세 설명 이미지
	
	private int edurep_no;
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
	public Timestamp getEdu_eduDate() {
		return edu_eduDate;
	}
	public void setEdu_eduDate(Timestamp edu_eduDate) {
		this.edu_eduDate = edu_eduDate;
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
	public String getEdu_color() {
		return edu_color;
	}
	public void setEdu_color(String edu_color) {
		this.edu_color = edu_color;
	}
	public String getEdu_image() {
		return edu_image;
	}
	public void setEdu_image(String edu_image) {
		this.edu_image = edu_image;
	}
	public int getEdurep_no() {
		return edurep_no;
	}
	public void setEdurep_no(int edurep_no) {
		this.edurep_no = edurep_no;
	}
	public Education(int edu_no, String edu_title, String edu_instructor, String edu_type, int edu_limitCnt,
			int edu_curCnt, Timestamp edu_eduDate, Timestamp edu_applyBgDate, Timestamp edu_applyEndDate,
			String edu_applyState, String edu_color, String edu_image) {
		super();
		this.edu_no = edu_no;
		this.edu_title = edu_title;
		this.edu_instructor = edu_instructor;
		this.edu_type = edu_type;
		this.edu_limitCnt = edu_limitCnt;
		this.edu_curCnt = edu_curCnt;
		this.edu_eduDate = edu_eduDate;
		this.edu_applyBgDate = edu_applyBgDate;
		this.edu_applyEndDate = edu_applyEndDate;
		this.edu_applyState = edu_applyState;
		this.edu_color = edu_color;
		this.edu_image = edu_image;
	}
	public Education() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Education [edu_no=" + edu_no + ", edu_title=" + edu_title + ", edu_instructor=" + edu_instructor
				+ ", edu_type=" + edu_type + ", edu_limitCnt=" + edu_limitCnt + ", edu_curCnt=" + edu_curCnt
				+ ", edu_eduDate=" + edu_eduDate + ", edu_applyBgDate=" + edu_applyBgDate + ", edu_applyEndDate="
				+ edu_applyEndDate + ", edu_applyState=" + edu_applyState + ", edu_color=" + edu_color + ", edu_image="
				+ edu_image + "]";
	}

	
	

	
}
