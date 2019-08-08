package com.kh.coworks.survey.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.coworks.survey.model.vo.Survey;
import com.kh.coworks.survey.model.vo.SurveyAnswer;

public interface SurveyDao {

	List<Map<String, String>> selectsurveyList(int cPage, int limit);

	int selectSurveyTotalContents();

	int insertSurvey(Survey survey);

	int insertSurveyAnswer(SurveyAnswer sa);

	Survey selectOneSurvey();

	List<SurveyAnswer> selectOneSurveyAnswer(int survey_no);

}
