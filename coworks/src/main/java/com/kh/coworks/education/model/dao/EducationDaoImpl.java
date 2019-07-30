package com.kh.coworks.education.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.coworks.education.model.vo.EduApply;
import com.kh.coworks.education.model.vo.Education;

@Repository
public class EducationDaoImpl implements EducationDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Education> selectListEducation() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("education.selectListEducation");
	}

	@Override
	public Education selectOneEducation(int edu_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("education.selectOneEducation",edu_no);
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
	
	
	
}
