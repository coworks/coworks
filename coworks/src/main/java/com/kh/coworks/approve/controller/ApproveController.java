package com.kh.coworks.approve.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ApproveController {

	@RequestMapping("/approve/approveWrite.do")
	public String approveMain() {
		return "approve/approveWrite";
	}
	
	@RequestMapping("/error.do")
	public String error() {
		return "common/error";
	}
}
