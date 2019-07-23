package com.kh.coworks.calendar.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.coworks.calendar.model.vo.Calendar;


@Repository
public class CalendarDaoImpl implements CalendarDao {

	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	
	@Override
	public List<Calendar> selectListAllCalendar(int emp_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("calendar.selectListAllCalendar",emp_no);
	}


	/*
	
	 @Override public List<Calendar> selectListCalendar() { // TODO Auto-generated method stub return
	 sqlSession.selectList("calendar.selectListCalendar",); }
	
*/
	@Override
	public int insertCalendar(Calendar calendar) {
		// TODO Auto-generated method stub
		
		return sqlSession.insert("calendar.insertCalendar",calendar);
	}
	
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
