package com.kh.coworks.education.model.service;

import java.util.List;

import com.kh.coworks.education.model.vo.EduApply;
import com.kh.coworks.education.model.vo.EduReport;
import com.kh.coworks.education.model.vo.Education;

public interface EducationService {
	List<Education> selectListEducation(int emp_no);
	
	Education selectOneEducation(int edu_no);

	int insertEduApply(EduApply eduApply);

	int deleteEduApply(EduApply eduApply);

	List<Education> selectEduApply(int emp_no);

	void insertEduReport(EduReport erep);

	List<EduReport> selectEduRep(int emp_no);

	EduReport selectOneEduRep(int edurep_no);
}
