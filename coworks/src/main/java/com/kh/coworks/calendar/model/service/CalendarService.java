package com.kh.coworks.calendar.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.coworks.calendar.model.vo.Calendar;

@Service
public interface CalendarService {
	 
	static int BOARD_SRV_ERROR=0;
	static int BOARD_SRV_COMP=1;
	
	//List<Calendar> selectListCalendar(int emp_no,String cal_type);
	
	List<Calendar> selectListAllCalendar(int emp_no);
	
	//int selectOne
	
	int insertCalendar(Calendar calendar);
	
	int deleteCalendar(int cal_no);
	
	int updateCalendar(Calendar calendar);
	 
}
