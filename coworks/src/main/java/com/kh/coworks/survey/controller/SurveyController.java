package com.kh.coworks.survey.controller;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SurveyController {

	@RequestMapping("/survey/surveyChart.do")
	public String surveyChart() {
		
		
		
		return "survey/surveyChart";
	}
	
	
}
