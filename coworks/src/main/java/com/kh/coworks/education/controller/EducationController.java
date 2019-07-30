package com.kh.coworks.education.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.coworks.education.model.service.EducationService;
import com.kh.coworks.education.model.vo.Education;
import com.kh.coworks.employee.model.vo.Employee;

@Controller
public class EducationController {
	
	@Autowired
	private EducationService educationService;
	
	@RequestMapping("/education/edcationview.do")
	 public ModelAndView eduView(ModelAndView mv,HttpServletRequest request) {
		 
		Employee employee=(Employee) request.getSession().getAttribute("employee");
		System.out.println("세션값 : "+employee);
		System.out.println("아이디 : "+employee.getEmp_no());
		
		List<Education> list=educationService.selectListEducation();
		
		mv.addObject("list",list);
		mv.setViewName("education/eduCalendar");
		
		return mv;
	}
	
	@RequestMapping("/education/eduDetail.do")
	public ModelAndView eduApplyView(@RequestParam("edu_no") int edu_no, ModelAndView mv,HttpServletRequest request) {
		
		
		
		Education edu=educationService.selectOneEducation(edu_no);
		
		mv.addObject("edu",edu);
		mv.setViewName("education/eduDetail");
		
		// 만약 인원 다차면 마감 띄우기~~
		return mv;
	
	}
}
