package com.kh.coworks.education.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.coworks.education.model.service.EducationService;
import com.kh.coworks.education.model.vo.EduApply;
import com.kh.coworks.education.model.vo.EduReport;
import com.kh.coworks.education.model.vo.Education;
import com.kh.coworks.employee.model.service.EmployeeService;
import com.kh.coworks.employee.model.vo.Employee;

@Controller
public class EducationController {

	@Autowired
	private EducationService educationService;

	@Autowired
	private EmployeeService employeeService;

	@RequestMapping("/education/edcationview.do")
	public ModelAndView eduView(ModelAndView mv, HttpServletRequest request) {

		Employee employee = (Employee) request.getSession().getAttribute("employee");
		System.out.println("세션값 : " + employee);
		System.out.println("아이디 : " + employee.getEmp_no());

		List<Education> list = educationService.selectListEducation(employee.getEmp_no());
		Date today=new Date();  
		
 		for(int i=0;i<list.size();i++) {
 			if(list.get(i).getEdu_applyBgDate().getTime()>today.getTime()){
 				list.get(i).setEdu_color("bg-info");
 			}else if(list.get(i).getEdu_applyBgDate().getTime()<today.getTime() && 
					list.get(i).getEdu_applyEndDate().getTime()>today.getTime()) {
				list.get(i).setEdu_color("bg-success");
			}
 			if(list.get(i).getEdu_applyEndDate().getTime()<today.getTime() || 
 					list.get(i).getEdu_limitCnt()-list.get(i).getEdu_curCnt()<=0) {
				list.get(i).setEdu_color("bg-danger");
			}else if((double)(list.get(i).getEdu_curCnt()) / (double)(list.get(i).getEdu_limitCnt())>0.8) {
				list.get(i).setEdu_color("bg-warning");
			}else {
				
			}
		} 
		
		mv.addObject("list", list);
		mv.setViewName("education/eduCalendar");

		return mv;
	}

	@RequestMapping("/education/eduDetail.do")
	public ModelAndView eduApplyView(@RequestParam("edu_no") int edu_no, ModelAndView mv, HttpServletRequest request) {

		Employee employee = (Employee) request.getSession().getAttribute("employee");
		EduApply eduapply=new EduApply();
		eduapply.setEdu_no(edu_no);
		eduapply.setEmp_no(employee.getEmp_no());
		Education edu = educationService.selectOneEducation(eduapply);

		mv.addObject("edu", edu);
		mv.setViewName("education/eduDetail");

		// 만약 인원 다차면 마감 띄우기~~
		return mv;

	}

	@RequestMapping("/education/insertEduApply.do")
	public void insertEduApply(HttpServletResponse resp, @RequestParam("edu_no") String edu_no, ModelAndView mv,
			HttpServletRequest request) throws IOException {

		Employee employee = (Employee) request.getSession().getAttribute("employee");
		EduApply ea = new EduApply();
		ea.setEdu_no(Integer.parseInt(edu_no));
		ea.setEmp_no(employee.getEmp_no());

		int result = educationService.insertEduApply(ea);

		resp.getWriter().print(result);
	}

	@RequestMapping("/education/deleteEduApply.do")
	public void deleteEduApply(HttpServletResponse resp, @RequestParam("edu_no") String edu_no, ModelAndView mv,
			HttpServletRequest request) throws IOException {

		Employee employee = (Employee) request.getSession().getAttribute("employee");
		EduApply ea = new EduApply();
		ea.setEdu_no(Integer.parseInt(edu_no));
		ea.setEmp_no(employee.getEmp_no());

		int result = educationService.deleteEduApply(ea);

		resp.getWriter().print(result);
	}

	@RequestMapping("/education/eduApplyview.do")
	public ModelAndView eduApplyview(ModelAndView mv, HttpServletRequest request) {
		Employee employee = (Employee) request.getSession().getAttribute("employee");

		List<Education> edu = educationService.selectEduApply(employee.getEmp_no());

		mv.addObject("list", edu);
		mv.setViewName("education/eduApplyview");

		return mv;
	}

	@RequestMapping("/education/insertEduReport.do")
	public String writeEduReportView(@RequestParam int edu_no, Model model) {
		model.addAttribute("edu_no", edu_no);

		return "education/eduReportForm";
	}

	@RequestMapping(value = "/education/writeEduReport", method = RequestMethod.POST)
	public String writeEduReport(@RequestParam Map<String, String> body, HttpServletRequest request) {
		System.out.println(body);

		EduReport erep = new EduReport();
		erep.setEdu_no(Integer.valueOf(body.get("edu_no")));
		Employee emp = (Employee) request.getSession().getAttribute("employee");
		EduApply eduapply=new EduApply();
		eduapply.setEdu_no(erep.getEdu_no());
		eduapply.setEmp_no(emp.getEmp_no());
		erep.setEmp_no(emp.getEmp_no());
		erep.setedurep_title(body.get("edurep_title"));

		body.remove("edu_no");
		body.remove("edurep_title");

		employeeService.selectOneEmployee(emp.getEmp_no());
		body.put("dept_name", emp.getDept_name());
		body.put("job_title", emp.getJob_title());
		body.put("writerName", emp.getEmp_name());
		
		Education edu = educationService.selectOneEducation(eduapply);
		body.put("edu_instructor", edu.getEdu_instructor());
		body.put("edu_title", edu.getEdu_title());
		String edu_date = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm").format((edu.getEdu_eduDate()));
		body.put("edu_date", edu_date);

		erep.setedurep_content(new JSONObject(body).toJSONString());

		educationService.insertEduReport(erep);

		return "redirect:/education/eduApplyview.do";
	}

	@RequestMapping(value = "/education/eduReport/v/{edurep_no}")
	public String eduReportView(@PathVariable int edurep_no, Model model) {
		model.addAttribute("eduRep", educationService.selectOneEduRep(edurep_no));

		return "education/eduReportView";
	}
	
	@RequestMapping(value = "/education/eduReport/edit/{edurep_no}")
	public String eduReportEdit(@PathVariable int edurep_no, Model model) {
		model.addAttribute("eduRep", educationService.selectOneEduRep(edurep_no));

		return "education/eduReportEditView";
	}
	
	@RequestMapping(value = "/education/editEduReport", method = RequestMethod.POST)
	public String editEduReport(@RequestParam Map<String, String> body, HttpServletRequest request) {
		System.out.println(body);

		EduReport erep = new EduReport();
		
		erep.setedurep_no(Integer.valueOf(body.get("edurep_no")));
		erep.setEdu_no(Integer.valueOf(body.get("edu_no")));
		Employee emp = (Employee) request.getSession().getAttribute("employee");
		EduApply eduapply=new EduApply();
		eduapply.setEdu_no(erep.getEdu_no());
		eduapply.setEmp_no(emp.getEmp_no());
		
		erep.setedurep_title(body.get("edurep_title"));

		body.remove("edurep_no");
		body.remove("edurep_title");

		employeeService.selectOneEmployee(emp.getEmp_no());
		body.put("dept_name", emp.getDept_name());
		body.put("job_title", emp.getJob_title());
		body.put("writerName", emp.getEmp_name());

		Education edu = educationService.selectOneEducation(eduapply);
		body.put("edu_instructor", edu.getEdu_instructor());
		body.put("edu_title", edu.getEdu_title());
		String edu_date = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm").format((edu.getEdu_eduDate()));
		body.put("edu_date", edu_date);

		erep.setedurep_content(new JSONObject(body).toJSONString());

		educationService.updateEduReport(erep);

		return "redirect:/education/eduApplyview.do";
	}

}
