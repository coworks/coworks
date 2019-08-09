package com.kh.coworks.survey.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.tools.ant.types.CommandlineJava.SysProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.kh.coworks.board.model.vo.Attach;
import com.kh.coworks.common.util.Utils;
import com.kh.coworks.survey.model.service.SurveyService;
import com.kh.coworks.survey.model.vo.Survey;
import com.kh.coworks.survey.model.vo.SurveyAnswer;
import com.kh.coworks.survey.model.vo.SurveyApply;

@Controller
public class SurveyController {

	@Autowired
	SurveyService surveyService;

	// 설문조사 전체 리스트
	@RequestMapping("/survey/surveyList.do")
	public String surveyChart(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			Model model) {

		int limit = 6; // 한 페이지 당 게시글 수

		// 1. 현재 페이지 게시글 목록 가져오기
		ArrayList<Map<String, String>> list = new ArrayList<>(surveyService.selectsurveyList(cPage, limit));

		// 2. 전체 페이지 게시글 수 가져오기
		int totalContents = surveyService.selectSurveyTotalContents();
		
		// 설문 응답 리스트 가져오기
		//ArrayList<Map<String, String>> answerlist = new ArrayList<>(surveyService.selectsurveyAnswerList(cPage, limit));

		String pageBar = Utils.getPageBar(totalContents, cPage, limit, "surveyList.do");

		model.addAttribute("list", list).addAttribute("totalContents", totalContents).addAttribute("numPerPage", limit)
				.addAttribute("pageBar", pageBar);

		return "survey/surveyList";
	}

	// 설문조사 추가
	@RequestMapping("/survey/surveyInsert.do")
	public String surveyInsert(Survey survey, Model model, HttpSession session,
			@RequestParam(value = "survey_content", required = false) String[] answer) {

		List<SurveyAnswer> list = new ArrayList<>();

		for (String a : answer) {

			SurveyAnswer surveyAnswer = new SurveyAnswer();
			surveyAnswer.setSurvey_content(a);
			list.add(surveyAnswer);
		}

		int result = surveyService.insertSurvey(survey, list);

		return "redirect:surveyList.do";
	}
	
	// (index화면) 설문조사 응답 -> DB에 넣기
	@RequestMapping("/survey/surveyInsertApply.do")
	public String surveyInsertApply(int emp_no ,int survey_no, int surveyyan_no) {

		SurveyApply sa = new SurveyApply();
		
		sa.setEmp_no(emp_no);
		sa.setSurvey_no(survey_no);
		sa.setSurveyan_no(surveyyan_no);
		
		int result = surveyService.surveyInsertApply(sa);
	

		return "redirect:surveyList.do";
	}
	
	
	
	
}
