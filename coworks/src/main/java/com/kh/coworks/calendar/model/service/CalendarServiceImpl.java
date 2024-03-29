package com.kh.coworks.calendar.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.coworks.calendar.model.dao.CalendarDao;
import com.kh.coworks.calendar.model.vo.Calendar;
import com.kh.coworks.calendar.model.vo.CalendarCategory;


@Service
public class CalendarServiceImpl implements CalendarService {
	
	@Autowired
	private CalendarDao calDao;
	
	
	
@Override
	public List<Calendar> selectListAllCalendar(HashMap<String,String> hmap) {
		// TODO Auto-generated method stub
		return calDao.selectListAllCalendar(hmap);
	}



	
	 
	  @Override 
	  public List<Calendar> selectListCalendar(Calendar calendar) { 
	  	// TODO Auto-generated method stub return
	  	return calDao.selectListCalendar(calendar); 
	  	}
	 

	@Override
	public int insertCalendar(Calendar calendar) {
		// TODO Auto-generated method stub
		return calDao.insertCalendar(calendar);
	}
	
	
	
	/*
	 * @Override public int insertCalendar2(Calendar calendar) { // TODO
	 * Auto-generated method stub return calDao.insertCalendar2(calendar); }
	 */





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
	
	@Override
	public int updateCalendar2(Calendar calendar) {
		return calDao.updateCalendar2(calendar);
	}

 
	@Override
	public int insertCalendarCategory(HashMap hmap) {
		// TODO Auto-generated method stub
		return calDao.insertCalendarCategory(hmap);
	}

 

	@Override
	public List<CalendarCategory> selectListCategory(int emp_no) {
		// TODO Auto-generated method stub
		return calDao.selectListCategory(emp_no);
	}

 

	@Override
	public int deleteCalendarCategory(HashMap<String, Integer> hmap) {
		// TODO Auto-generated method stub
		return calDao.deleteCalendarCategory(hmap);
	}
	
	
	
	

}
