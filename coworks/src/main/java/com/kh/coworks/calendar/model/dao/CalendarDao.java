package com.kh.coworks.calendar.model.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kh.coworks.calendar.model.vo.Calendar;
import com.kh.coworks.employee.model.vo.Employee;

@Repository
public interface CalendarDao { 
	
	
	List<Calendar> selectListCalendar(Calendar calendar);	// 개인,부서,회사 별로 보기
	
	List<Calendar> selectListAllCalendar(Calendar calendar);	// 전체 보기
	
	int insertCalendar(Calendar calendar);
	/*
	 * int insertCalendar2(Calendar calendar);
	 */
	
	int deleteCalendar(int cal_no);
	
	int updateCalendar(Calendar calendar);
	
	int updateCalendar2(Calendar calendar);
	
}
