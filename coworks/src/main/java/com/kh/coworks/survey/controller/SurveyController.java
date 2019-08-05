package com.kh.coworks.survey.controller;

import java.util.ArrayList; 
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.coworks.common.util.Utils;
import com.kh.coworks.survey.model.service.SurveyService;


@Controller
public class SurveyController {

	@Autowired
	SurveyService surveyService;
	
	@RequestMapping("/survey/surveyList.do")
	public String surveyChart(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage, Model model) {
		
		int limit = 6; // 한 페이지 당 게시글 수

		// 1. 현재 페이지 게시글 목록 가져오기
		ArrayList<Map<String, String>> list = new ArrayList<>(surveyService.selectsurveyList(cPage, limit));
		
		// 2. 전체 페이지 게시글 수 가져오기
		int totalContents = surveyService.selectSurveyTotalContents();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, limit, "surveyList.do");

		model.addAttribute("list", list).addAttribute("totalContents", totalContents).addAttribute("numPerPage", limit)
				.addAttribute("pageBar", pageBar);
		
		return "survey/surveyList";
	}
}
