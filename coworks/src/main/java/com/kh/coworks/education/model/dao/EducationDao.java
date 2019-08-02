package com.kh.coworks.education.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.coworks.education.model.vo.EduApply;
import com.kh.coworks.education.model.vo.EduReport;
import com.kh.coworks.education.model.vo.Education;

public interface EducationDao {
	List<Education> selectListEducation(int emp_no);
	
	Education selectOneEducation(EduApply eduApply);
	
	int insertEduApply(EduApply eduApply);
	
	int deleteEduApply(EduApply eduApply);
	
	List<Map<String, String>> selectEduApply(int emp_no,int cPage, int limit);

	void insertEduReport(EduReport erep);

	List<EduReport> selectEduRep(int emp_no);

	EduReport selectOneEduRep(int edurep_no);

	void updateEduReport(EduReport erep);

	int selectApplyTotalContents(int emp_no);
	
	List<Map<String, String>> searchTypeEduApply(HashMap<String, String> hmap, int cPage, int limit);

	int selectTypeApplyTotalContents(HashMap<String, String> hmap);
}
