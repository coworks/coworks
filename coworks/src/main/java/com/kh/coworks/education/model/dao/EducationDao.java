package com.kh.coworks.education.model.dao;

import java.util.List;

import com.kh.coworks.education.model.vo.EduApply;
import com.kh.coworks.education.model.vo.Education;

public interface EducationDao {
	List<Education> selectListEducation();
	
	Education selectOneEducation(int edu_no);
	
	int insertEduApply(EduApply eduApply);
	
	int deleteEduApply(EduApply eduApply);
}
