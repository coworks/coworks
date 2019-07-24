package com.kh.coworks.employee.controller;

import java.util.ArrayList; 
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;

import com.kh.coworks.common.util.Utils;
import com.kh.coworks.employee.model.service.EmployeeService;
import com.kh.coworks.employee.model.vo.Department;
import com.kh.coworks.employee.model.vo.Employee;
import com.kh.coworks.employee.model.vo.Job;



@SessionAttributes(value= {"employee"})
@Controller
public class EmployeeController {
	
	@Autowired
	EmployeeService employeeService;
	
	@RequestMapping("/mypage/mypage.do")
	public String mypageView() {
		return "mypage/mypage";
	}
	
	@RequestMapping("mypage/editMypage.do")
	public String editMypageView() {
		return "mypage/editMypage";
	}
	
	@RequestMapping("mypage/updateEmpInfo.do")
	public String updateEmployee() {
		return "redirect:/mypage/mypage.do";
	}
	
	@RequestMapping("/employee/employeeList.do")
	public String selectEmployeeList(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage, Model model) {

		int limit = 2; // 한 페이지 당 게시글 수

		// 1. 현재 페이지 게시글 목록 가져오기
		ArrayList<Map<String, String>> list = new ArrayList<>(employeeService.selectEmployeeList(cPage, limit));

		// 2. 전체 페이지 게시글 수 가져오기
		int totalContents = employeeService.selectEmployeeTotalContents();

		// 3. 사원추가 SELECT 부서 목록
		ArrayList<Department> departmentList = new ArrayList<>(employeeService.selectDepartmentList());
		
		// 4. 사원추가 SELECT 사원 목록 
		ArrayList<Job> jobList = new ArrayList<>(employeeService.selectJobList());
		
		String pageBar = Utils.getPageBar(totalContents, cPage, limit, "employeeList.do");

		model.addAttribute("list", list).addAttribute("totalContents", totalContents).addAttribute("numPerPage", limit)
				.addAttribute("pageBar", pageBar).addAttribute("departmentList",departmentList).addAttribute("jobList",jobList);

		return "employee/employeeList";
	}
	
	@RequestMapping("/employee/employeeEnroll.do")
	public String employeeEnroll(Employee employee, Model model) {

		// 1. 비즈니스 로직 실행
		int result = employeeService.insertEmployee(employee);

		// 2. 실행 결과에 따른 화면 처리
		String loc = "/";
		String msg = "";

		if (result > 0)
			msg = "회원가입 성공!";
		else
			msg = "회원가입 실패!";

		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);

		return "employee/employeeList";
	}
}
