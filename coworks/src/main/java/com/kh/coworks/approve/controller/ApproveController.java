package com.kh.coworks.approve.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ApproveController {

	@RequestMapping("/approval/approvalWrite.do")
	public String approveMain() {
		return "approval/approvalWrite";
	}
	
	@RequestMapping("/error.do")
	public String error() {
		return "common/error";
	}
	
	//approvDoc Mapping
	@RequestMapping("/approval/approvalDoc/vacation.do")
	public String approvalVaction() {
		return "approval/approvalDoc/approval_vacation";
	}
}
