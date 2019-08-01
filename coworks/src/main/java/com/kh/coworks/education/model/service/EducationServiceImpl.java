package com.kh.coworks.education.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.coworks.education.model.dao.EducationDao;
import com.kh.coworks.education.model.vo.EduApply;
import com.kh.coworks.education.model.vo.EduReport;
import com.kh.coworks.education.model.vo.Education;

@Service
public class EducationServiceImpl implements EducationService {

	@Autowired
	private EducationDao eduDao;
	
	@Override
	public List<Education> selectListEducation(int emp_no) {
		// TODO Auto-generated method stub
		return eduDao.selectListEducation(emp_no);
	}
	
	@Override
	public Education selectOneEducation(EduApply eduApply) {
		// TODO Auto-generated method stub
		return eduDao.selectOneEducation(eduApply);
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

	@Override
	public List<Education> selectEduApply(int emp_no) {
		// TODO Auto-generated method stub
		return eduDao.selectEduApply(emp_no);
	}

	@Override
	public void insertEduReport(EduReport erep) {
		eduDao.insertEduReport(erep);
	}

	@Override
	public List<EduReport> selectEduRep(int emp_no) {
		return  eduDao.selectEduRep(emp_no);
	}

	@Override
	public EduReport selectOneEduRep(int edurep_no) {
		return  eduDao.selectOneEduRep(edurep_no);
	}

	@Override
	public void updateEduReport(EduReport erep) {
		eduDao.updateEduReport(erep);
	}
	
	
	
	

}
