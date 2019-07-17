package com.kh.coworks.survey.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class SurveyAnswer implements Serializable {
	private int surveyAn_no; // 인덱스
	private int survey_no; // 설문조사인덱스
	private String survey_content; // 내용
	public SurveyAnswer() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SurveyAnswer(int surveyAn_no, int survey_no, String survey_content) {
		super();
		this.surveyAn_no = surveyAn_no;
		this.survey_no = survey_no;
		this.survey_content = survey_content;
	}
	public int getSurveyAn_no() {
		return surveyAn_no;
	}
	public void setSurveyAn_no(int surveyAn_no) {
		this.surveyAn_no = surveyAn_no;
	}
	public int getSurvey_no() {
		return survey_no;
	}
	public void setSurvey_no(int survey_no) {
		this.survey_no = survey_no;
	}
	public String getSurvey_content() {
		return survey_content;
	}
	public void setSurvey_content(String survey_content) {
		this.survey_content = survey_content;
	}
	@Override
	public String toString() {
		return "SurveyAnswer [surveyAn_no=" + surveyAn_no + ", survey_no=" + survey_no + ", survey_content="
				+ survey_content + "]";
	}
	
	

}
