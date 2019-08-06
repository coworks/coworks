package com.kh.coworks.survey.model.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.coworks.survey.model.vo.Survey;
import com.kh.coworks.survey.model.vo.SurveyAnswer;

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
	

}
