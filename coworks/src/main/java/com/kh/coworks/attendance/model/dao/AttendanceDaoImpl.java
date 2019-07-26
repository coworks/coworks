package com.kh.coworks.attendance.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.coworks.attendance.model.vo.Attendance;

@Repository
public class AttendanceDaoImpl implements AttendanceDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertAttendanceCome(Attendance attendance) {
		// TODO Auto-generated method stub
		return sqlSession.insert("attendance.insertAttendanceCome",attendance);
	}
	
	@Override
	public Attendance selectOneAttendance(int emp_no){
		return sqlSession.selectOne("attendance.selectOneAttendance",emp_no);
	}
	
	@Override
	public int updateAttendanceLeave(Attendance attendance) {
		// TODO Auto-generated method stub
		return sqlSession.insert("attendance.updateAttendanceLeave",attendance);
	}
	
	
	@Override
	public int selectListCountAttendance(int emp_no) {
		// TODO Auto-generated method stub
		return sqlSession.insert("attendance.selectListCountAttendance",emp_no);
	}
}
