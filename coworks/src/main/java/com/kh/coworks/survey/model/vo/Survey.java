package com.kh.coworks.survey.model.vo;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class Survey implements Serializable {

	private int survey_no; // 인덱스
	private String survey_quest; // 질문
	private Timestamp survey_start; // 시작시간
	private Timestamp survey_end; // 종료시간
	
	private List<SurveyAnswer> answer; //답변리스트
	
	
	

}
