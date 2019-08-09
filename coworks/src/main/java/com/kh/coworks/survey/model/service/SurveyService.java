package com.kh.coworks.survey.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.coworks.survey.model.vo.Survey;
import com.kh.coworks.survey.model.vo.SurveyAnswer;
import com.kh.coworks.survey.model.vo.SurveyApply;

public interface SurveyService {

	List<Map<String, String>>  selectsurveyList(int cPage, int limit);

	int selectSurveyTotalContents();

	int insertSurvey(Survey survey, List<SurveyAnswer> list);
	
	Survey selectOneSurvey();
	
	List<SurveyAnswer> selectOneSurveyAnswer(int survey_no);

	int surveyInsertApply(SurveyApply sa);
}
