package com.kh.coworks.survey.model.dao;

import java.util.List;
import java.util.Map;

public interface SurveyDao {

	List<Map<String, String>> selectsurveyList(int cPage, int limit);

	int selectSurveyTotalContents();

}
