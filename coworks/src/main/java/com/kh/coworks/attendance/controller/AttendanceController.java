package com.kh.coworks.attendance.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AttendanceController {

	@RequestMapping("/mypage/attendanceview.do")
	public String attedndview() {
		return "mypage/attendancetable";
	}
}
