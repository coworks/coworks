package com.kh.coworks.calendar.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.coworks.calendar.model.dao.CalendarDao;
import com.kh.coworks.calendar.model.vo.Calendar;

@Service
public class CalendarServiceImpl implements CalendarService {
	
	@Autowired
	private CalendarDao calDao;
	
	
	
@Override
	public List<Calendar> selectListAllCalendar(int emp_no) {
		// TODO Auto-generated method stub
		return calDao.selectListAllCalendar(emp_no);
	}



	
	/*
	  @Override public List<Calendar> selectListCalendar(int emp_no, String cal_type) { 
	  	// TODO Auto-generated method stub return
	  	calDao.selectListCalendar(emp_no, cal_type); }
	 */

	@Override
	public int insertCalendar(Calendar calendar) {
		// TODO Auto-generated method stub
		return calDao.insertCalendar(calendar);
	}
	
	@Override
	public int deleteCalendar(int cal_no) {
		// TODO Auto-generated method stub
		return calDao.deleteCalendar(cal_no);
	}
	
	@Override
	public int updateCalendar(Calendar calendar) {
		// TODO Auto-generated method stub
		return calDao.updateCalendar(calendar);
	}

}
