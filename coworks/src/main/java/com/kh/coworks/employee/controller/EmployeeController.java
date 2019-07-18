package com.kh.coworks.employee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EmployeeController {
	
	@RequestMapping("/mypage/mypage.do")
	public String mypageView() {
		return "mypage/mypage";
	}
	
	@RequestMapping("mypage/editMypage.do")
	public String editMypageView() {
		return "mypage/editMypage";
	}

}
