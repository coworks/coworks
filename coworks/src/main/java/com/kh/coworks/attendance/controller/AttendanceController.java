package com.kh.coworks.attendance.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.coworks.attendance.model.service.AttendanceService;

@Controller
public class AttendanceController {
	/*
	@Autowired
	private AttendanceService attendanceService;
	*/
	@RequestMapping("/mypage/attendanceview.do")
	public String attedndview() {
		return "mypage/attendancetable";
	}
	/*
	@RequestMapping("/mypage/attendancecome.do")
	public String insertAttendaceCome(HttpServletRequest request,Model model) {
		String emp_no=request.getParameter("emp_no");
		String atten_attIP=request.getParameter("atten_attIP");
		
		int result=attendanceService.insertAttendanceCome(emp_no,atten_attIP);
		
		model.addAttribute("atten_attiIP",atten_attIP);	// view에 넘겨주기
		
		return 
	}
	
	*/
}
