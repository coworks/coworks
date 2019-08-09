package com.kh.coworks.employee.controller;

import java.util.ArrayList; 
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;

import com.kh.coworks.authority.model.vo.Authority;
import com.kh.coworks.common.util.Utils;
import com.kh.coworks.employee.model.service.EmployeeService;
import com.kh.coworks.employee.model.vo.Department;
import com.kh.coworks.employee.model.vo.Employee;
import com.kh.coworks.employee.model.vo.Job;


/*
@SessionAttributes(value={"employee"})*/
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

	@RequestMapping("mypage/editMypageEnd.do")
	public String editMypageEnd(Employee emp, 
			@RequestParam("address1")String address1, @RequestParam("address2")String address2,	HttpServletRequest request) {

		emp.setEmp_address(address1+" "+address2);
		HttpSession session = request.getSession();
		System.out.println("사원추가시 edit 오나용");
		Employee employee = (Employee) session.getAttribute("employee");
		employee.setEmp_email(emp.getEmp_email());
		employee.setEmp_emailpassword(emp.getEmp_emailpassword());
		employee.setEmp_password(emp.getEmp_password());
		employee.setEmp_address(emp.getEmp_address());
		employee.setEmp_phone(emp.getEmp_phone());
		
		int result = employeeService.updateEmployee(employee);
		
		if(result > 0)
            session.setAttribute("employee",employee);
		
		return "redirect:mypage.do";
	}

	
	@RequestMapping("/employee/employeeList.do")
	public String selectEmployeeList(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage, Model model) {

		int limit = 5; // 한 페이지 당 게시글 수

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
	public String employeeEnroll(Employee emp, Model model) {

		// 1. 비즈니스 로직 실행

		int result = employeeService.insertEmployee(emp);
		System.out.println(emp);
		String[] splitAuthority = emp.getEmp_authority();
		
		// authority 에 ㄱ아무것도 추가 안하면 null 에러 발생해요 이거만 고치면 될거같아요 
		Authority ah = new Authority();
		
		ah.setAuth_personnal("N");
		ah.setAuth_data("N");
		ah.setAuth_cal("N");
		ah.setAuth_board("N");
		ah.setAuth_approval("N");
		ah.setAuth_authority("N");
		ah.setAuth_pay("N");
		
		
		
		for(int i=0; i<splitAuthority.length;i++) {
			
			if(splitAuthority[i].equals("인사"))
				ah.setAuth_personnal("Y");
				
			if(splitAuthority[i].equals("자료실"))
				ah.setAuth_data("Y");
			
			if(splitAuthority[i].equals("회사일정"))
				ah.setAuth_cal("Y");
			
			if(splitAuthority[i].equals("게시판"))
				ah.setAuth_board("Y");
			
			if(splitAuthority[i].equals("결재서류"))
				ah.setAuth_approval("Y");
			
			if(splitAuthority[i].equals("권한관리"))
				ah.setAuth_authority("Y");
			
			if(splitAuthority[i].equals("급여"))
				ah.setAuth_pay("Y");
		}
		
		int auResult = employeeService.insertAuthority(ah);


		// 2. 실행 결과에 따른 화면 처리

		return "redirect:employeeList.do";
	}
	
	@RequestMapping("/employee/deptInsert.do")
	public String deptInsert(Department dept) {
		
		int result = employeeService.insertDeptName(dept);
		
		int  result2 = employeeService.insertBoradDept(dept);
		
		
		return "redirect:/employee/employeeList.do";
	}
	
	@RequestMapping("/employee/deptupdate.do")
	public String deptUpdate(Department dept) {
		
		int result = employeeService.updateDeptName(dept);
		
		return "redirect:/employee/employeeList.do";
	}
	
	@RequestMapping("/employee/employeeSearch.do")
	public String selectEmployeeSearch(@RequestParam(value = "cPage", required = false, defaultValue = "1") 
	int cPage, String con, String keyword, Model model) {

		int limit = 5; // 한 페이지 당 게시글 수

		
		HashMap<String, String> hmap = new HashMap<>();
		
		
		hmap.put("con", con); 
		hmap.put("keyword", keyword);
		
				
		// 1. 현재 페이지 게시글 목록 가져오기
		ArrayList<Map<String, String>> list = new ArrayList<>(employeeService.searchEmployee(cPage, limit, hmap));

		// 2. 전체 페이지 게시글 수 가져오기
		int totalContents = employeeService.selectSearchEmployeeTotalContents(con,hmap);
	

		String pageBar = Utils.getPageBar(totalContents, cPage, limit, "employeeList.do");

		model.addAttribute("list", list).addAttribute("totalContents", totalContents).addAttribute("numPerPage", limit)
				.addAttribute("pageBar", pageBar);
		
		return "employee/employeeList";
	}
	
	@RequestMapping("employee/employeeMove.do")
	public String employeeMove(String index , Model model) {
		
		Employee employee = employeeService.selectOneEmployee(Integer.parseInt(index));

		//System.out.println(employee.getEmp_authority());
		
		// 사원추가 SELECT 부서 목록
		ArrayList<Department> departmentList = new ArrayList<>(employeeService.selectDepartmentList());

		// 사원추가 SELECT 사원 목록
		ArrayList<Job> jobList = new ArrayList<>(employeeService.selectJobList());
		
		// 권한 SELECT 하기 
		Authority au = employeeService.selectOneAuthority(Integer.parseInt(index));
		
		model.addAttribute("employee",employee).addAttribute("departmentList",departmentList)
		.addAttribute("jobList",jobList).addAttribute("au",au);
		
		return "employee/employeeMove";
	}

	@RequestMapping("employee/employeeMoveUpdate.do")
	public String employeeMoveUpdate(Employee employee) {
		
		int result = employeeService.employeeMoveUpdate(employee);
		
		String[] splitAuthority = employee.getEmp_authority();
		
		Authority ah = new Authority();
		
		ah.setEmp_no(employee.getEmp_no());
		
		ah.setAuth_personnal("N");
		ah.setAuth_data("N");
		ah.setAuth_cal("N");
		ah.setAuth_board("N");
		ah.setAuth_approval("N");
		ah.setAuth_authority("N");
		ah.setAuth_pay("N");
		
		for(int i=0; i<splitAuthority.length;i++) {
			
			if(splitAuthority[i].equals("인사"))
				ah.setAuth_personnal("Y");
				
			if(splitAuthority[i].equals("자료실"))
				ah.setAuth_data("Y");
			
			if(splitAuthority[i].equals("회사일정"))
				ah.setAuth_cal("Y");
			
			if(splitAuthority[i].equals("게시판"))
				ah.setAuth_board("Y");
			
			if(splitAuthority[i].equals("결재서류"))
				ah.setAuth_approval("Y");
			
			if(splitAuthority[i].equals("권한관리"))
				ah.setAuth_authority("Y");
			
			if(splitAuthority[i].equals("급여"))
				ah.setAuth_pay("Y");
		}
		
		int auResult = employeeService.updateAuthority(ah);
		
		return "redirect:/employee/employeeList.do";
	}
	
	// 연락처
	@RequestMapping("employee/contactList.do")
	public String selectContactList(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage, Model model) {

		int limit = 10; // 한 페이지 당 게시글 수

		// 1. 현재 페이지 게시글 목록 가져오기
		ArrayList<Map<String, String>> list = new ArrayList<>(employeeService.selectEmployeeList(cPage, limit));
		
		// 2. 전체 페이지 게시글 수 가져오기
		int totalContents = employeeService.selectEmployeeTotalContents();

		// 3. 사원추가 SELECT 부서 목록
		ArrayList<Department> departmentList = new ArrayList<>(employeeService.selectDepartmentList());
		
		// 4. 사원추가 SELECT 사원 목록 
		ArrayList<Job> jobList = new ArrayList<>(employeeService.selectJobList());
		
		String pageBar = Utils.getPageBar(totalContents, cPage, limit, "contactList.do");

		model.addAttribute("list", list).addAttribute("totalContents", totalContents).addAttribute("numPerPage", limit)
				.addAttribute("pageBar", pageBar).addAttribute("departmentList",departmentList).addAttribute("jobList",jobList);

		return "contact/contactList";
	}
	
	// 연락처에서 조회
	@RequestMapping("/employee/contactSearch.do")
	public String selectContactSearch(@RequestParam(value = "cPage", required = false, defaultValue = "1") 
	int cPage, String con, String keyword, Model model) {

		int limit = 10; // 한 페이지 당 게시글 수

		
		HashMap<String, String> hmap = new HashMap<>();
		
		
		hmap.put("con", con); 
		hmap.put("keyword", keyword);
		
				
		// 1. 현재 페이지 게시글 목록 가져오기
		ArrayList<Map<String, String>> list = new ArrayList<>(employeeService.searchEmployee(cPage, limit, hmap));

		// 2. 전체 페이지 게시글 수 가져오기
		int totalContents = employeeService.selectSearchEmployeeTotalContents(con,hmap);
	

		String pageBar = Utils.getPageBar(totalContents, cPage, limit, "contactList.do");

		model.addAttribute("list", list).addAttribute("totalContents", totalContents).addAttribute("numPerPage", limit)
				.addAttribute("pageBar", pageBar);
		System.out.println("list : " + list);
		return "contact/contactList";
	}
	
	// 연락처 부서별 조회
	@RequestMapping("/employee/contactDeptSearch.do")
	@ResponseBody
	public List<Employee> selectContactDeptSearch(@RequestParam("dept_code") String dept_code) {
		System.out.println("!!dept_code : " + dept_code);
		List<Employee> contactList = employeeService.getDeptEmp(dept_code);
		return contactList;
	}
	
	
}
