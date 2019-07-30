package com.kh.coworks.education.model.service;

import java.util.List;

import com.kh.coworks.education.model.vo.Education;

public interface EducationService {
	List<Education> selectListEducation();
	
	Education selectOneEducation(int edu_no);
}
