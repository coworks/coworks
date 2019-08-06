package com.kh.coworks.survey.model.service;

import java.util.List;
import java.util.Map;

import com.kh.coworks.survey.model.vo.Survey;
import com.kh.coworks.survey.model.vo.SurveyAnswer;

public interface SurveyService {

	List<Map<String, String>>  selectsurveyList(int cPage, int limit);

	int selectSurveyTotalContents();

	int insertSurvey(Survey survey, List<SurveyAnswer> list);
}
