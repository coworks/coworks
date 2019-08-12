package com.kh.coworks.survey.model.dao;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.coworks.survey.model.vo.Survey;
import com.kh.coworks.survey.model.vo.SurveyAnswer;
import com.kh.coworks.survey.model.vo.SurveyApply;

@Repository
public class SurveyDaoImpl implements SurveyDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectsurveyList(int cPage, int limit) {
		RowBounds rows = new RowBounds((cPage-1) * limit, limit);
		return sqlSession.selectList("survey.selectSurveyList", null, rows);
	}

	@Override
	public int selectSurveyTotalContents() {
		return sqlSession.selectOne("survey.selectSurveyTotalContents");
	}

	@Override
	public int insertSurvey(Survey survey) {
		return sqlSession.insert("survey.insertSurvey",survey);
	}

	@Override
	public int insertSurveyAnswer(SurveyAnswer sa) {
		return sqlSession.insert("survey.insertSurveyAnswer",sa);
	}

	@Override
	public Survey selectOneSurvey() {
		return sqlSession.selectOne("survey.selectOneSurvey");
	}

	@Override
	public List<SurveyAnswer> selectOneSurveyAnswer(int survey_no) {
		return sqlSession.selectList("survey.selectOneSurveyAnswer",survey_no);
	}

	@Override
	public int surveyInsertApply(SurveyApply sa) {
		return sqlSession.insert("survey.surveyInsertApply",sa);
	}

	@Override
	public  List<SurveyApply> selectOneSurveyApp(int survey_no) {
		return sqlSession.selectList("survey.selectOneSurveyApp",survey_no);
	}

	@Override
	public SurveyApply selectOneSurveyApply(Map<String, String> hmap) {
		return sqlSession.selectOne("survey.selectOneSurveyApply",hmap);
	}

	@Override
	public int surveyUpdateApply(SurveyApply sa) {
		return sqlSession.update("survey.surveyUpdateApply",sa);
	}


}
