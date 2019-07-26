package com.kh.coworks.attendance.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.coworks.attendance.model.dao.AttendanceDao;
import com.kh.coworks.attendance.model.vo.Attendance;

@Service
public class AttendanceServiceImpl implements AttendanceService {

	@Autowired
	private AttendanceDao attendancedao;
	
	@Override
	public int insertAttendanceCome(Attendance attendance) {
		int result=0;
		
		//int count=attendancedao.selectListCountAttendance(1);	

		//System.out.println("count값 22: "+count);
		//if(count<=0) {
			//System.out.println("count값 : "+count);
			result=attendancedao.insertAttendanceCome(attendance);
		//}

		return result;
	}
	
	@Override
	public Attendance selectOneAttendance(int emp_no){
		return attendancedao.selectOneAttendance(emp_no);
	}
	
	
	@Override
	public int updateAttendanceLeave(Attendance attendance) {
		int result=0;
		
		int count=attendancedao.selectListCountAttendance(1);
		if(count==1) {
			result= attendancedao.updateAttendanceLeave(attendance);
		}
		
		return result;
		
	}
 
}
