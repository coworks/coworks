package com.kh.coworks.survey.controller;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.coworks.survey.model.service.SurveyService;

@Controller
public class SurveyController {

	@Autowired
	SurveyService suveyService;
	
	@RequestMapping("/survey/surveyList.do")
	public String surveyChart() {
		
		
		
		return "survey/surveyList";
	}
	
	
	
	
}
