package com.kh.coworks.dm.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.coworks.common.util.Utils;
import com.kh.coworks.dm.model.service.DMService;
import com.kh.coworks.dm.model.vo.DM;
import com.kh.coworks.employee.model.service.EmployeeService;
import com.kh.coworks.employee.model.vo.Department;
import com.kh.coworks.employee.model.vo.Employee;

@Controller
public class DMController {

	@Autowired
	DMService dmService;

	@Autowired
	EmployeeService employeeService;

	@RequestMapping("/dm/dmList.do")
	public String dmList(Model model, HttpServletRequest request,
			@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage) {
		HttpSession session = request.getSession();
		Employee emp = (Employee) session.getAttribute("employee");
		int limit = 15;

		List<DM> list = dmService.dmList(cPage, limit, emp.getEmp_no());
		int totalContents = dmService.dmListCount(emp.getEmp_no());

		String pageBar = Utils.getPageBar(totalContents, cPage, limit, "dmList.do");

		model.addAttribute("list", list).addAttribute("totalContents", totalContents).addAttribute("numPerPage", limit)
				.addAttribute("pageBar", pageBar);

		return "dm/dmList";
	}

	@RequestMapping("/dm/sendDmList.do")
	public String sendDmList(Model model, HttpServletRequest request,
			@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage) {
		HttpSession session = request.getSession();
		Employee emp = (Employee) session.getAttribute("employee");
		int limit = 15;

		List<DM> list = dmService.sendDmList(cPage, limit, emp.getEmp_no());
		int totalContents = dmService.sendDmListCount(emp.getEmp_no());

		String pageBar = Utils.getPageBar(totalContents, cPage, limit, "sendDmList.do");

		model.addAttribute("list", list).addAttribute("totalContents", totalContents).addAttribute("numPerPage", limit)
				.addAttribute("pageBar", pageBar);
		return "dm/dmList";
	}

	@RequestMapping("/dm/delDmList.do")
	public String delDmList(Model model, HttpServletRequest request,
			@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage) {
		HttpSession session = request.getSession();
		Employee emp = (Employee) session.getAttribute("employee");
		int limit = 15;

		List<DM> list = dmService.delDmList(cPage, limit, emp.getEmp_no());
		int totalContents = dmService.delDmListCount(emp.getEmp_no());

		String pageBar = Utils.getPageBar(totalContents, cPage, limit, "delDmList.do");

		model.addAttribute("list", list).addAttribute("totalContents", totalContents).addAttribute("numPerPage", limit)
				.addAttribute("pageBar", pageBar);
		return "dm/dmList";
	}

	@RequestMapping("/dm/dmWriteForm.do")
	public String dmWriteFrom(Model model) {
		// 부서별로 모아서 화면으로 전송
		List<Department> dept = employeeService.selectDepartmentList();
		model.addAttribute("dept", dept);
		System.out.println(dept.get(0).getDept_code());
		return "dm/dmWriteForm";
	}

	@RequestMapping("/dm/ajxDept.do")
	@ResponseBody
	public List<Employee> ajxDept(@RequestParam("dept_code") String dept_code) {
		System.out.println("dept_code : " + dept_code);
		List<Employee> empList = employeeService.getDeptEmp(dept_code);
		return empList;
	}

	@RequestMapping("/dm/dmWriteFormEnd.do")
	public String dmWriteFromEnd(DM dm, @RequestParam(value = "to_no_emp", required = true) String[] to_no_emp,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		Employee e = (Employee) session.getAttribute("employee");
		dm.setDm_from(e.getEmp_no());
		System.out.println(dm);
		int result = dmService.insertDM(dm);
		for (String dm_to : to_no_emp) {
			if (dm_to.contains("D")) {
				List<Employee> empList = employeeService.getDeptEmp(dm_to);
				for(Employee emp : empList)
					result = dmService.insertDMTo(emp.getEmp_no());
			} else {
				result = dmService.insertDMTo(Integer.parseInt(dm_to));
			}
		
		}

		return "redirect:dmList.do";
	}
}
