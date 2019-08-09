package com.kh.coworks.calendar.model.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.kh.coworks.calendar.model.vo.Calendar;
import com.kh.coworks.calendar.model.vo.CalendarCategory;
import com.kh.coworks.employee.model.vo.Employee;

@Repository
public interface CalendarDao { 
	
	
	List<Calendar> selectListCalendar(Calendar calendar);	// 개인,부서,회사 별로 보기

	List<Calendar> selectListAllCalendar(HashMap<String,String> mmap);
	
	int insertCalendar(Calendar calendar);
	/*
	 * int insertCalendar2(Calendar calendar);
	 */
	
	int deleteCalendar(int cal_no);
	
	int updateCalendar(Calendar calendar);
	
	int updateCalendar2(Calendar calendar);
	
	int insertCalendarCategory(HashMap hmap);

	List<CalendarCategory> selectListCategory(int emp_no);
	
	int deleteCalendarCategory(HashMap<String, Integer> hmap);
	
}
