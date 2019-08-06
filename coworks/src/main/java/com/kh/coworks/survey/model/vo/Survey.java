package com.kh.coworks.survey.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class Survey implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 286;
	
	
	private int survey_no; // �ε���
	private String survey_quest; // ����
	private Date survey_start; // ���۽ð�
	private Date survey_end; // ����ð�
	
	private List<SurveyAnswer> answer; //�亯����Ʈ

	public Survey() {
		
	}
	
	public int getSurvey_no() {
		return survey_no;
	}

	public void setSurvey_no(int survey_no) {
		this.survey_no = survey_no;
	}

	public String getSurvey_quest() {
		return survey_quest;
	}

	public void setSurvey_quest(String survey_quest) {
		this.survey_quest = survey_quest;
	}

	public Date getSurvey_start() {
		return survey_start;
	}

	public void setSurvey_start(Date survey_start) {
		this.survey_start = survey_start;
	}

	public Date getSurvey_end() {
		return survey_end;
	}

	public void setSurvey_end(Date survey_end) {
		this.survey_end = survey_end;
	}

	public List<SurveyAnswer> getAnswer() {
		return answer;
	}

	public void setAnswer(List<SurveyAnswer> answer) {
		this.answer = answer;
	}

	public Survey(int survey_no, String survey_quest, Date survey_start, Date survey_end,
			List<SurveyAnswer> answer) {
		super();
		this.survey_no = survey_no;
		this.survey_quest = survey_quest;
		this.survey_start = survey_start;
		this.survey_end = survey_end;
		this.answer = answer;
	}

	@Override
	public String toString() {
		return "Survey [survey_no=" + survey_no + ", survey_quest=" + survey_quest + ", survey_start=" + survey_start
				+ ", survey_end=" + survey_end + ", answer=" + answer + "]";
	}
	

}
