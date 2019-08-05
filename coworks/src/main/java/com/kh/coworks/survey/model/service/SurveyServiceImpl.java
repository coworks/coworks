package com.kh.coworks.survey.model.service;

import java.util.List;  
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.coworks.survey.model.dao.SurveyDao;

@Service
public class SurveyServiceImpl implements SurveyService {

	@Autowired
	SurveyDao surveyDao;
	
	@Override
	public List<Map<String, String>> selectsurveyList(int cPage, int limit) {
		return surveyDao.selectsurveyList(cPage,limit);
	}

	@Override
	public int selectSurveyTotalContents() {
		return surveyDao.selectSurveyTotalContents();
	}

	
}
