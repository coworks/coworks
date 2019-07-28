package com.kh.coworks.calendar.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.coworks.calendar.model.vo.Calendar;
import com.kh.coworks.employee.model.vo.Employee;


@Repository
public class CalendarDaoImpl implements CalendarDao {

	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	
	@Override
	public List<Calendar> selectListAllCalendar(Calendar calendar) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("calendar.selectListAllCalendar",calendar);
	}


	 
	
	 @Override 
	 public List<Calendar> selectListCalendar(Calendar calendar) { // TODO Auto-generated method stub return
		return sqlSession.selectList("calendar.selectListCalendar",calendar); 
	 }
	
 
	@Override
	public int insertCalendar(Calendar calendar) {
		// TODO Auto-generated method stub
		
		return sqlSession.insert("calendar.insertCalendar",calendar);
	}
	
	
	
	
	/*
	 * @Override public int insertCalendar2(Calendar calendar) { // TODO
	 * Auto-generated method stub return
	 * sqlSession.insert("calendar.insertCalendar",calendar); }
	 */




	@Override
	public int deleteCalendar(int cal_no) {
		// TODO Auto-generated method stub
		return sqlSession.delete("calendar.deleteCalendar",cal_no);
	}
	
	@Override
	public int updateCalendar(Calendar calendar) {
		// TODO Auto-generated method stub
		return sqlSession.update("calendar.updateCalendar",calendar);
	}
	
	@Override
	public int updateCalendar2(Calendar calendar) {
		// TODO Auto-generated method stub
		return sqlSession.update("calendar.updateCalendar2",calendar);
	}

}
