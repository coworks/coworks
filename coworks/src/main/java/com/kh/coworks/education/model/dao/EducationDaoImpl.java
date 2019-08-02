package com.kh.coworks.education.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.coworks.education.model.vo.EduApply;
import com.kh.coworks.education.model.vo.EduReport;
import com.kh.coworks.education.model.vo.Education;

@Repository
public class EducationDaoImpl implements EducationDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Education> selectListEducation(int emp_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("education.selectListEducation",emp_no);
	}

	@Override
	public Education selectOneEducation(EduApply eduApply) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("education.selectOneEducation",eduApply);
	}

	@Override
	public int insertEduApply(EduApply eduApply) {
		// TODO Auto-generated method stub
		return sqlSession.insert("education.insertEduApply",eduApply);
	}

	@Override
	public int deleteEduApply(EduApply eduApply) {
		// TODO Auto-generated method stub
		return sqlSession.delete("education.deleteEduApply",eduApply);
	}

	@Override
	public List<Map<String, String>> selectEduApply(int emp_no,int cPage, int limit) {
		RowBounds rows = new RowBounds((cPage-1) * limit, limit);
		return sqlSession.selectList("education.selectEduApply",emp_no,rows);
	}

	@Override
	public void insertEduReport(EduReport erep) {
		sqlSession.insert("education.insertEduReport", erep);
	}

	@Override
	public List<EduReport> selectEduRep(int emp_no) {
		return sqlSession.selectList("education.selectEduRep",emp_no);
	}

	@Override
	public EduReport selectOneEduRep(int edurep_no) {
		return sqlSession.selectOne("education.selectOneEduRep", edurep_no);
	}

	@Override
	public void updateEduReport(EduReport erep) {
		sqlSession.update("education.updateEduReport", erep);
	}

	@Override
	public int selectApplyTotalContents(int emp_no) {
		return sqlSession.selectOne("education.selectApplyTotalContents", emp_no);
		
	}

	@Override
	public List<Map<String, String>> searchTypeEduApply(HashMap<String, String> hmap, int cPage, int limit) {
		RowBounds rows = new RowBounds((cPage-1) * limit, limit);
		return sqlSession.selectList("education.searchTypeEduApply",hmap,rows);
	}

	@Override
	public int selectTypeApplyTotalContents(HashMap<String, String> hmap) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("education.selectTypeApplyTotalContents");
	}
	
	
	
	
	
	
	
}
