package com.kh.coworks.dm.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
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
				.addAttribute("pageBar", pageBar).addAttribute("type","rece").addAttribute("type", "rece");

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
		System.out.println(list);
		model.addAttribute("list", list).addAttribute("totalContents", totalContents).addAttribute("numPerPage", limit)
				.addAttribute("pageBar", pageBar).addAttribute("type", "send");
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
				.addAttribute("pageBar", pageBar).addAttribute("type", "del");
		return "dm/dmList";
	}

	@RequestMapping("/dm/dmWriteForm.do")
	public String dmWriteFrom(Model model) {
		// 부서별로 모아서 화면으로 전송
		List<Department> dept = employeeService.selectDepartmentList();
		model.addAttribute("dept", dept);
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
	public String dmWriteFromEnd(DM dm, @RequestParam(value = "to_no_emp", required = true) String[] to_no_emp,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		Employee e = (Employee) session.getAttribute("employee");
		int result = 0;
		dm.setDm_from(e.getEmp_no());
		for (String dm_to : to_no_emp) {
			if (dm_to.contains("D")) {
				List<Employee> empList = employeeService.getDeptEmp(dm_to);
				for (Employee emp : empList) {
					dm.setDm_to(emp.getEmp_no());
					result = dmService.insertDM(dm);
				}
			}else {
				dm.setDm_to(Integer.parseInt(dm_to));
				result = dmService.insertDM(dm);
			}

		}

		return "redirect:dmList.do";
	}

	@RequestMapping("/dm/selectOneDm.do/{dm_no}")
	public String selectOneDm(@PathVariable(value = "dm_no") int dm_no, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Employee e = (Employee) session.getAttribute("employee"); 
		DM dm = dmService.selectOneDm(dm_no);
		
		dm.setDm_to_read("Y");

		int result = dmService.updateDm(dm);
		Employee emp = employeeService.selectOneEmployee(dm.getDm_to());
		System.out.println("to : "  + emp);
		model.addAttribute("dm",dm).addAttribute("emp",emp);
		return "dm/dmDetail";

	}
		

	@RequestMapping("/dm/replyDm.do/{dm_no}")
	public String replyDm( @PathVariable(value = "dm_no") int dm_no ,Model model) {
		DM dm =dmService.selectOneDm(dm_no); 
		
		Employee emp = employeeService.selectOneEmployee(dm.getDm_to());
				
		model.addAttribute("dm",dm).addAttribute("emp",emp)
		.addAttribute("type","reply").addAttribute("dept", employeeService.selectDepartmentList());
		return "dm/dmWriteForm";
	}
	
	@RequestMapping("/dm/forwardDm.do/{dm_no}")
	public String forwardDm(@PathVariable(value = "dm_no") int dm_no, Model model) {
	DM dm =dmService.selectOneDm(dm_no); 
		Employee emp = employeeService.selectOneEmployee(dm.getDm_to());
		model.addAttribute("dm", dm).addAttribute("emp",emp)
		.addAttribute("dept", employeeService.selectDepartmentList()).addAttribute("type", "forward");
		return "dm/dmWriteForm";

	}

	@RequestMapping(value = "/dm/storeDm.do")
	@ResponseBody
	public DM storeDm(@RequestBody int[] chkdms,
		HttpServletRequest request) {
			HttpSession session = request.getSession();
			Employee e = (Employee) session.getAttribute("employee");
			
		System.out.println(chkdms);
		DM dm = null;
		if (chkdms != null)
			for (int no : chkdms) {
				System.out.println("store : " + dmService.selectOneDm(no));
				dm = dmService.selectOneDm(no);
				int result = dmService.insertDM(dm);
			}
	
		return dm;
	}
	
	@RequestMapping(value = "/dm/deleteDm.do/{type}")
	@ResponseBody
	public DM deleteDm(@RequestBody int[] chkdms,
		HttpServletRequest request,@PathVariable("type") String type  ) {
			HttpSession session = request.getSession();
			Employee e = (Employee) session.getAttribute("employee");
		int result = 0;
		System.out.println(chkdms);
		DM dm = null;
		if (chkdms != null)
			for (int no : chkdms) {
				System.out.println("no : " + no);
				dm = dmService.selectOneDm(no);
				System.out.println(dm);
				if(type.equals("send")) {
					dm.setDm_from_del("Y");
					result = dmService.updateDm(dm);
					System.out.println("보낸 삭제");
				}else if(type.equals("rece")) {
					dm.setDm_to_del("Y");
					result = dmService.updateDm(dm);
				}
			}
	
		return dm;
	}
	
	@RequestMapping(value = "/dm/readDm.do/{type}")
	public String readDm(@RequestBody int[] chkdms,
		HttpServletRequest request,@PathVariable("type") String type  ) {
			HttpSession session = request.getSession();
			Employee e = (Employee) session.getAttribute("employee");
		int result = 0;
		System.out.println(chkdms);
		DM dm = null;
		if (chkdms != null)
			for (int no : chkdms) {

				System.out.println("no : " + no);
				dm = dmService.selectOneDm(no);
				dm.setDm_to_read("Y");
				result = dmService.updateDm(dm);
				
			}
		return "redirect:dmList.do";
	}

}
