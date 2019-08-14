package com.kh.coworks.employee.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;

import com.kh.coworks.authority.model.vo.Authority;
import com.kh.coworks.common.util.Utils;
import com.kh.coworks.employee.model.service.EmployeeService;
import com.kh.coworks.employee.model.vo.Department;
import com.kh.coworks.employee.model.vo.Employee;
import com.kh.coworks.employee.model.vo.Job;
import com.kh.coworks.mail.controller.MailSetting;


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

	@RequestMapping(value = "mypage/editMypageEnd.do", method = RequestMethod.POST)
	public String editMypageEnd(Employee emp, @RequestParam("address1") String address1,
			@RequestParam("address2") String address2, HttpServletRequest request,
			@RequestParam(value = "signature", required = true) MultipartFile signature) {

		emp.setEmp_address(address1 + "/" + address2);
		HttpSession session = request.getSession();
		Employee employee = (Employee) session.getAttribute("employee");
		
		employee.setEmp_email(emp.getEmp_email());
		employee.setEmp_emailpassword(emp.getEmp_emailpassword());

		if (!emp.getEmp_password().isEmpty() && emp.getEmp_password().length()!=0)
			employee.setEmp_password(emp.getEmp_password());
		employee.setEmp_address(emp.getEmp_address());
		employee.setEmp_phone(emp.getEmp_phone());

		if (!signature.isEmpty()) {
			String savePath = session.getServletContext().getRealPath("/resources/approval/empSign");
			new File(savePath + "/" + employee.getEmp_signature()).delete();
			try {
				signature.transferTo(new File(savePath + "/" + signature.getOriginalFilename()));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			employee.setEmp_signature(signature.getOriginalFilename());
		}
		System.out.println(employee);

		int result = employeeService.updateEmployee(employee);

		if (result > 0)
			session.setAttribute("employee", employee);

		return "redirect:mypage.do";
	}

	@RequestMapping("/employee/empEmail.do")
	@ResponseBody
	public Employee empEmail(@RequestParam("email") String email) {
		System.out.println("1");
		Employee emp = employeeService.selectEmail(email);

		String coemail = "email";//직접 넣으세요 ㅎㅎ
		String copassword = "password";//너꺼 넣으세요 ㅎ
		if (emp != null) {
			int rndNum = (int) (Math.random() * 10000) + 1;
			emp.setEmp_password(rndNum + "");
			int result = employeeService.updateEmployee(emp);
			MimeMessage msg = null;
			msg = new MailSetting().sendingSetting(coemail, copassword);
			try {
				msg.setSentDate(new Date());
				msg.setFrom(new InternetAddress(coemail, "COWORKS"));
				InternetAddress to = new InternetAddress(email);
				msg.setRecipient(Message.RecipientType.TO, to);
				msg.setSubject("coworks 변경된 비밀번호 입니다.", "UTF-8");
				msg.setText("변경된 비밀번호입니다. \n비밀번호 수정 후 이용해주세요: " + rndNum, "UTF-8");
				if (msg != null) {
					Transport.send(msg);
				}
			} catch (MessagingException e) {
				e.printStackTrace();
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}

		return emp;
	}

	@RequestMapping("/employee/employeeList.do")
	public String selectEmployeeList(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			Model model) {

		int limit = 10; // 한 페이지 당 게시글 수

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
				.addAttribute("pageBar", pageBar).addAttribute("departmentList", departmentList)
				.addAttribute("jobList", jobList);

		return "employee/employeeList";
	}

	@RequestMapping("/employee/employeeEnroll.do")
	public String employeeEnroll(Employee emp, Model model,Authority authority) {

		// 1. 비즈니스 로직 실행

		int result = employeeService.insertEmployee(emp);
		
		// authority 에 ㄱ아무것도 추가 안하면 null 에러 발생해요 이거만 고치면 될거같아요 

		if(authority.getAuth_personnal()!=null) {
			authority.setAuth_personnal("Y");
		}else
			authority.setAuth_personnal("N");
		
		if(authority.getAuth_data()!=null) {
			authority.setAuth_data("Y");
		}else
			authority.setAuth_data("N");
		
		if(authority.getAuth_cal()!=null) {
			authority.setAuth_cal("Y");
		}else
			authority.setAuth_cal("N");
		
		if(authority.getAuth_board()!=null) {
			authority.setAuth_board("Y");
		}else
			authority.setAuth_board("N");
		
		if(authority.getAuth_approval()!=null) {
			authority.setAuth_approval("Y");
		}else
			authority.setAuth_approval("N");
		
		if(authority.getAuth_authority()!=null) {
			authority.setAuth_authority("Y");
		}else
			authority.setAuth_authority("N");
		
		if(authority.getAuth_pay()!=null) {
			authority.setAuth_pay("Y");
		}else
			authority.setAuth_pay("N");

		int auResult = employeeService.insertAuthority(authority);

		// 2. 실행 결과에 따른 화면 처리
		String loc = "/";
		String msg = "";


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
	public String selectEmployeeSearch(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			String con, String keyword, Model model) {

		int limit = 10; // 한 페이지 당 게시글 수

		HashMap<String, String> hmap = new HashMap<>();

		hmap.put("con", con);
		hmap.put("keyword", keyword);

		// 1. 현재 페이지 게시글 목록 가져오기
		ArrayList<Map<String, String>> list = new ArrayList<>(employeeService.searchEmployee(cPage, limit, hmap));

		// 2. 전체 페이지 게시글 수 가져오기
		int totalContents = employeeService.selectSearchEmployeeTotalContents(con, hmap);

		String pageBar = Utils.getPageBar(totalContents, cPage, limit, "employeeList.do");

		model.addAttribute("list", list).addAttribute("totalContents", totalContents).addAttribute("numPerPage", limit)
				.addAttribute("pageBar", pageBar);

		return "employee/employeeList";
	}

	@RequestMapping("employee/employeeMove.do")
	public String employeeMove(String index, Model model) {

		Employee employee = employeeService.selectOneEmployee(Integer.parseInt(index));

		// System.out.println(employee.getEmp_authority());

		// 사원추가 SELECT 부서 목록
		ArrayList<Department> departmentList = new ArrayList<>(employeeService.selectDepartmentList());

		// 사원추가 SELECT 사원 목록
		ArrayList<Job> jobList = new ArrayList<>(employeeService.selectJobList());

		// 권한 SELECT 하기
		Authority au = employeeService.selectOneAuthority(Integer.parseInt(index));

		model.addAttribute("employee", employee).addAttribute("departmentList", departmentList)
				.addAttribute("jobList", jobList).addAttribute("au", au);

		return "employee/employeeMove";
	}

	@RequestMapping("employee/employeeMoveUpdate.do")
	public String employeeMoveUpdate(Employee employee,Authority authority) {

		int result = employeeService.employeeMoveUpdate(employee);


		authority.setEmp_no(employee.getEmp_no());
		
		System.out.println(employee.getEmp_no());
		System.out.println(authority.getAuth_personnal());
		
		if(authority.getAuth_personnal()!=null) {
			authority.setAuth_personnal("Y");
		}else
			authority.setAuth_personnal("N");
		
		if(authority.getAuth_data()!=null) {
			authority.setAuth_data("Y");
		}else
			authority.setAuth_data("N");
		
		if(authority.getAuth_cal()!=null) {
			authority.setAuth_cal("Y");
		}else
			authority.setAuth_cal("N");
		
		if(authority.getAuth_board()!=null) {
			authority.setAuth_board("Y");
		}else
			authority.setAuth_board("N");
		
		if(authority.getAuth_approval()!=null) {
			authority.setAuth_approval("Y");
		}else
			authority.setAuth_approval("N");
		
		if(authority.getAuth_authority()!=null) {
			authority.setAuth_authority("Y");
		}else
			authority.setAuth_authority("N");
		
		if(authority.getAuth_pay()!=null) {
			authority.setAuth_pay("Y");
		}else
			authority.setAuth_pay("N");

		int auResult = employeeService.updateAuthority(authority);

		return "redirect:/employee/employeeList.do";
	}

	// 연락처
	@RequestMapping("employee/contactList.do")
	public String selectContactList(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			Model model) {

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
				.addAttribute("pageBar", pageBar).addAttribute("departmentList", departmentList)
				.addAttribute("jobList", jobList);

		return "contact/contactList";
	}

	// 연락처에서 조회
	@RequestMapping("/employee/contactSearch.do")
	public String selectContactSearch(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			String con, String keyword, Model model) {

		int limit = 10; // 한 페이지 당 게시글 수

		HashMap<String, String> hmap = new HashMap<>();

		hmap.put("con", con);
		hmap.put("keyword", keyword);

		// 1. 현재 페이지 게시글 목록 가져오기
		ArrayList<Map<String, String>> list = new ArrayList<>(employeeService.searchEmployee(cPage, limit, hmap));

		// 2. 전체 페이지 게시글 수 가져오기
		int totalContents = employeeService.selectSearchEmployeeTotalContents(con, hmap);

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
