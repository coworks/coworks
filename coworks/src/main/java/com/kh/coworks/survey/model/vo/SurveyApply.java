package com.kh.coworks.survey.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class SurveyApply implements Serializable {

	private int surveyapp_no; // �ε���
	private int emp_no; // �����ȣ
	private int survey_no; // ���������ε���
	private int surveyan_no;
	private String survey_quest;
	private String survey_content;
	private int cnt;
	

	public int getSurveyan_no() {
		return surveyan_no;
	}

	public void setSurveyan_no(int surveyan_no) {
		this.surveyan_no = surveyan_no;
	}

	public SurveyApply() {
		super();
		// TODO Auto-generated constructor stub
	}


	

	public String getSurvey_quest() {
		return survey_quest;
	}

	public void setSurvey_quest(String survey_quest) {
		this.survey_quest = survey_quest;
	}

	public String getSurvey_content() {
		return survey_content;
	}

	public void setSurvey_content(String survey_content) {
		this.survey_content = survey_content;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public SurveyApply(int surveyapp_no, int emp_no, int survey_no, int surveyan_no, String survey_quest,
			String survey_content, int cnt) {
		super();
		this.surveyapp_no = surveyapp_no;
		this.emp_no = emp_no;
		this.survey_no = survey_no;
		this.surveyan_no = surveyan_no;
		this.survey_quest = survey_quest;
		this.survey_content = survey_content;
		this.cnt = cnt;
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
		return "SurveyApply [surveyapp_no=" + surveyapp_no + ", emp_no=" + emp_no + ", survey_no=" + survey_no
				+ ", surveyan_no=" + surveyan_no + ", survey_quest=" + survey_quest + ", survey_content="
				+ survey_content + ", cnt=" + cnt + "]";
	}

	
}
