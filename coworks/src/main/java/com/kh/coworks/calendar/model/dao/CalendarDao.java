package com.kh.coworks.calendar.model.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kh.coworks.calendar.model.vo.Calendar;

@Repository
public interface CalendarDao { 
	
	
	//List<Calendar> selectListCalendar(int emp_no,String cal_type);	// 개인,부서,회사 별로 보기
	
	List<Calendar> selectListAllCalendar(int emp_no);	// 전체 보기
	
	int insertCalendar(Calendar calendar);
	
	int deleteCalendar(int cal_no);
	/*
	int updateCalendar(Calendar calendar);
	*/
}
