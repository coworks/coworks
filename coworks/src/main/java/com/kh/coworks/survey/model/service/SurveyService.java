package com.kh.coworks.survey.model.service;

import java.util.List;
import java.util.Map;

public interface SurveyService {

	List<Map<String, String>>  selectsurveyList(int cPage, int limit);

	int selectSurveyTotalContents();

}
