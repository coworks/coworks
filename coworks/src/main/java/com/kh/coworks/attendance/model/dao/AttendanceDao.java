package com.kh.coworks.attendance.model.dao;

import java.util.List;

import com.kh.coworks.attendance.model.vo.Attendance;

public interface AttendanceDao {
	
	
	int insertAttendanceCome(Attendance attendance);
	
	int selectListCountAttendance(int emp_no);
	
	Attendance selectOneAttendance(int emp_no);
	
	int updateAttendanceLeave(Attendance attendance);
	
	List<Attendance> selectListAttendance(int emp_no);
}
