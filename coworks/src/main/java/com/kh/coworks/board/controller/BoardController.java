package com.kh.coworks.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	// 자료실 - 사규
	@RequestMapping("/board/companyrulesdata.do")
	public String companyrules() {
		return "board/companyrules";
	}

	// 자료실 - 통합자료실 - 업무문서
	@RequestMapping("/board/businessdocdata.do")
	public String businessdoc() {
		return "";
	}

	// 자료실 - 통합자료실 - 교육문서
	@RequestMapping("/board/empedudocdata.do")
	public String empedudoc() {
		return "";
	}

	// 자료실 - 부서별 자료실
	@RequestMapping("/board/deptdocdata.do")
	public String deptdoc() {
		return "";
	}

}
