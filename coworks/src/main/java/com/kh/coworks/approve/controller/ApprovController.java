package com.kh.coworks.approve.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ApprovController {
	int i= 2523;

	@RequestMapping("/approval/approvalWrite.do")
	public String approveMain() {
		return "approval/approvalWrite";
	}
	
	@RequestMapping("/error.do")
	public String error() {
		return "common/error";
	}
}
