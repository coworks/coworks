package com.kh.coworks.calendar.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.coworks.calendar.model.vo.Calendar;
import com.kh.coworks.calendar.model.vo.CalendarCategory;

@Service
public interface CalendarService {
	 
	static int BOARD_SRV_ERROR=0;
	static int BOARD_SRV_COMP=1;
	
	List<Calendar> selectListCalendar(Calendar calendar);
	
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
