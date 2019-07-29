package com.kh.coworks.attendance.model.service;

import java.util.List;
import java.util.Map;

import com.kh.coworks.attendance.model.vo.Attendance;
import com.kh.coworks.calendar.model.vo.Calendar;

public interface AttendanceService {
	 
	static int BOARD_SRV_ERROR=0;
	static int BOARD_SRV_COMP=1;
	
	int insertAttendanceCome(Attendance attendance);
	
	Attendance selectOneAttendance(int emp_no);
	
	int updateAttendanceLeave(Attendance attendance);

	List<Attendance> selectListAttendance(int emp_no);

	List<Attendance> selectTypeAttendance(Attendance attendance);
	
	 
}
