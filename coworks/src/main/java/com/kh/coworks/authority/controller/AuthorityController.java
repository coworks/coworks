package com.kh.coworks.authority.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AuthorityController {
	
	@RequestMapping("/authority/authorityList.do")
	public String selectList() {
		return "authority/authorityList";
	}
}
