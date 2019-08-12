package com.kh.coworks.survey.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.coworks.survey.model.dao.SurveyDao;
import com.kh.coworks.survey.model.vo.Survey;
import com.kh.coworks.survey.model.vo.SurveyAnswer;
import com.kh.coworks.survey.model.vo.SurveyApply;


@Service
public class SurveyServiceImpl implements SurveyService {

	@Autowired
	SurveyDao surveyDao;

	@Override
	public List<Map<String, String>> selectsurveyList(int cPage, int limit) {
		return surveyDao.selectsurveyList(cPage, limit);
	}

	@Override
	public int selectSurveyTotalContents() {
		return surveyDao.selectSurveyTotalContents();
	}

	@Override
	public int insertSurvey(Survey survey, List<SurveyAnswer> list) {

		int result = surveyDao.insertSurvey(survey);

		if (list.size() > 0) {
			for (SurveyAnswer sa : list) {
				if(!sa.getSurvey_content().equals(""))
				result = surveyDao.insertSurveyAnswer(sa);
			}
		}
		return result;
	}

	@Override
	public Survey selectOneSurvey() {
		return surveyDao.selectOneSurvey();
	}

	@Override
	public List<SurveyAnswer> selectOneSurveyAnswer(int survey_no) {
		return surveyDao.selectOneSurveyAnswer(survey_no);
	}

	@Override
	public int surveyInsertApply(SurveyApply sa) {
		return surveyDao.surveyInsertApply(sa);
	}

	@Override
	public List<SurveyApply> selectOneSurveyApp(int survey_no) {
		return surveyDao.selectOneSurveyApp(survey_no);
		
	}

	public SurveyApply selectOneSurveyApply(Map<String, String> hmap) {
		return surveyDao.selectOneSurveyApply(hmap);
	}

	@Override
	public int surveyUpdateApply(SurveyApply sa) {
		// TODO Auto-generated method stub
		return surveyDao.surveyUpdateApply(sa);
	}


}
