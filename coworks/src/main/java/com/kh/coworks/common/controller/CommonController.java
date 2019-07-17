package com.kh.coworks.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonController {

	@RequestMapping("/common/goLogin.do")
	public String goLogin() {
		return "login";
	}
	
}
