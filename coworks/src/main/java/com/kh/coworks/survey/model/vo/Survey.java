package com.kh.coworks.survey.model.vo;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class Survey implements Serializable {

	private int survey_no; // �ε���
	private String survey_quest; // ����
	private Timestamp survey_start; // ���۽ð�
	private Timestamp survey_end; // ����ð�
	
	private List<SurveyAnswer> answer; //�亯����Ʈ
	
	
	

}
