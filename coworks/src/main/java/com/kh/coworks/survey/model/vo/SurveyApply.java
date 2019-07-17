package com.kh.coworks.survey.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class SurveyApply implements Serializable {

	private int surveyapp_no; // 인덱스
	private int emp_no; // 사원번호
	private int survey_no; // 설문조사인덱스

	public SurveyApply() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SurveyApply(int surveyapp_no, int emp_no, int survey_no) {
		super();
		this.surveyapp_no = surveyapp_no;
		this.emp_no = emp_no;
		this.survey_no = survey_no;
	}

	public int getSurveyapp_no() {
		return surveyapp_no;
	}

	public void setSurveyapp_no(int surveyapp_no) {
		this.surveyapp_no = surveyapp_no;
	}

	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}

	public int getSurvey_no() {
		return survey_no;
	}

	public void setSurvey_no(int survey_no) {
		this.survey_no = survey_no;
	}

	@Override
	public String toString() {
		return "SurveyApply [surveyapp_no=" + surveyapp_no + ", emp_no=" + emp_no + ", survey_no=" + survey_no + "]";
	}

}
