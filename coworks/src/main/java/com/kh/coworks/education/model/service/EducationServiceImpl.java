package com.kh.coworks.education.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.coworks.education.model.dao.EducationDao;
import com.kh.coworks.education.model.vo.EduApply;
import com.kh.coworks.education.model.vo.Education;

@Service
public class EducationServiceImpl implements EducationService {

	@Autowired
	private EducationDao eduDao;
	
	@Override
	public List<Education> selectListEducation() {
		// TODO Auto-generated method stub
		return eduDao.selectListEducation();
	}
	
	@Override
	public Education selectOneEducation(int edu_no) {
		// TODO Auto-generated method stub
		return eduDao.selectOneEducation(edu_no);
	}

	@Override
	public int insertEduApply(EduApply eduApply) {
		// TODO Auto-generated method stub
		return eduDao.insertEduApply(eduApply);
	}

	@Override
	public int deleteEduApply(EduApply eduApply) {
		// TODO Auto-generated method stub
		return eduDao.deleteEduApply(eduApply);
	}
	
	

}
