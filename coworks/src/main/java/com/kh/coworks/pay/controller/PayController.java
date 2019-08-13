package com.kh.coworks.pay.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.kh.coworks.authority.model.service.AuthorityService;
import com.kh.coworks.authority.model.vo.Authority;
import com.kh.coworks.common.util.Utils;
import com.kh.coworks.employee.model.service.EmployeeService;
import com.kh.coworks.employee.model.vo.Department;
import com.kh.coworks.employee.model.vo.Employee;
import com.kh.coworks.employee.model.vo.Job;
import com.kh.coworks.mail.model.vo.MailAttach;
import com.kh.coworks.pay.model.service.PayService;
import com.kh.coworks.pay.model.vo.Pay;

@Controller
public class PayController {

	@Autowired
	EmployeeService employeeService;

	@Autowired
	AuthorityService authorityService;

	@Autowired
	PayService payService;

	String filename = "";

	@RequestMapping("/pay/employeeList.do")
	public String selectEmployeeList(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Employee emp = (Employee) session.getAttribute("employee");
		Authority au = authorityService.selectEmpAuthority(emp.getEmp_no());
		if (au != null) {
			if (au.getAuth_authority().equals("Y")) {

				int limit = 5; // 한 페이지 당 게시글 수
				ArrayList<Map<String, String>> list = new ArrayList<>(employeeService.selectEmployeeList(cPage, limit));
				int totalContents = employeeService.selectEmployeeTotalContents();
				ArrayList<Department> departmentList = new ArrayList<>(employeeService.selectDepartmentList());
				ArrayList<Job> jobList = new ArrayList<>(employeeService.selectJobList());
				String pageBar = Utils.getPageBar(totalContents, cPage, limit, "employeeList.do");
				model.addAttribute("list", list).addAttribute("totalContents", totalContents)
						.addAttribute("numPerPage", limit).addAttribute("pageBar", pageBar)
						.addAttribute("departmentList", departmentList).addAttribute("jobList", jobList)
						.addAttribute("empList", employeeService.selectEmployeeList())
						.addAttribute("deptList", employeeService.selectDeptEmpCount());

				return "pay/payEmpList";
			} else
				return "redirect:empListPay.do/" + emp.getEmp_no();
		} else
			return "redirect:empListPay.do/" + emp.getEmp_no();

	}

	@RequestMapping("/pay/payInputForm.do")
	public String goInput() {
		return "pay/payInputForm";
	}

	@RequestMapping(value = "/pay/inputPayRoll.do", method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String, String>> inputPayRoll(Model model, @RequestParam("payRoll") MultipartFile payRoll,
			HttpServletRequest request) {
		ExcelReadOption excel = new ExcelReadOption();
		ExcelRead er = new ExcelRead();
		System.out.println(payRoll);
		String renamedName = "";
		HttpSession session = request.getSession();
//		Employee emp = (Employee) session.getAttribute("employee");
		String saveDir = session.getServletContext().getRealPath("/resources/pay/payroll");
		System.out.println("saveDIr : " + saveDir);
		if (new File(saveDir).exists()) {
			if (!payRoll.isEmpty()) {
				String originalName = payRoll.getOriginalFilename();
				String ext = originalName.substring(originalName.lastIndexOf(".") + 1);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
				int rndNum = (int) (Math.random() * 1000);
				renamedName = sdf.format(new Date()) + "_" + rndNum + "." + ext;
				try {
					payRoll.transferTo(new File(saveDir + "/" + renamedName));
					System.out.println(payRoll.getName());
					System.out.println(saveDir + "/" + renamedName);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
		}

//		JSONArray json = new JSONArray();
//		json.addAll(list);
//		System.out.println("json : " + json);
		String savePath = saveDir.replace("\\", "/");
		excel.setFilePath(savePath + "/" + renamedName);
		filename = savePath + "/" + renamedName;
		excel.setOutputColumns("A", "B", "C", "D", "F", "L", "S", "T");
		excel.setStartRow(0);
		List<Map<String, String>> list = null;
		list = er.read(excel);
		return list;
	}

	@RequestMapping("/pay/savePayRoll.do")
	public String savePayRoll(Model model, @RequestParam("payRoll") MultipartFile payRoll, HttpServletRequest request) {
		ExcelReadOption excel = new ExcelReadOption();
		ExcelRead er = new ExcelRead();
		excel.setFilePath(filename);
		excel.setOutputColumns("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R",
				"S", "T");
		excel.setStartRow(0);
		Pay pay;

		List<Map<String, String>> list = null;
		list = er.read(excel);
//		String tem = list.get(0).get("B") +list.get(0).get("D") +list.get(0).get("F");
		String tem = list.get(0).get("B");
		String m = "";
		String d = "";
		if (list.get(0).get("D").length() <= 1)
			m = "0" + list.get(0).get("D");
		else
			m =  list.get(0).get("D");
		if (list.get(0).get("F").length() <= 1)
			d = "0" + list.get(0).get("F");
		else 
			d =  list.get(0).get("F");

		tem = tem + m + d;
		System.out.println(tem);
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyyMMdd");
		java.util.Date date = null;
		java.sql.Date sqlDate = null;
		try {
			date = transFormat.parse(tem);
			sqlDate = new java.sql.Date(date.getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
//		System.out.println(tempdate);
		System.out.println("날짜 : ");
//		System.out.println(tem);
//		System.out.println(tempdate);
//		java.sql.Date date = java.sql.Date.valueOf(tempdate);
		System.out.println(date);
		for (int i = 2; i < list.size() - 1; i++) {

			pay = new Pay();
			pay.setEmp_no(Integer.parseInt(list.get(i).get("A")));
			pay.setPay_emp_name(list.get(i).get("B"));
			pay.setPay_emp_job(list.get(i).get("C"));
			pay.setPay_basepay(Integer.parseInt(list.get(i).get("D")));
			pay.setPay_jobtitle(Integer.parseInt(list.get(i).get("E")));
			pay.setPay_overtime(Integer.parseInt(list.get(i).get("F")));
			pay.setPay_hollyday(Integer.parseInt(list.get(i).get("G")));
			pay.setPay_bonus(Integer.parseInt(list.get(i).get("H")));
			pay.setPay_meal(Integer.parseInt(list.get(i).get("I")));
			pay.setPay_transport(Integer.parseInt(list.get(i).get("J")));
			pay.setPay_welfare(Integer.parseInt(list.get(i).get("K")));
			pay.setPay_income(Integer.parseInt(list.get(i).get("M")));
			pay.setPay_resident(Integer.parseInt(list.get(i).get("N")));
			pay.setPay_empins(Integer.parseInt(list.get(i).get("O")));
			pay.setPay_nation(Integer.parseInt(list.get(i).get("P")));
			pay.setPay_healins(Integer.parseInt(list.get(i).get("Q")));
			pay.setPay_others(Integer.parseInt(list.get(i).get("R")));
			pay.setPay_ptotal(Integer.parseInt(list.get(i).get("L")));
			pay.setPay_mtotal(Integer.parseInt(list.get(i).get("S")));
			pay.setPay_total(Integer.parseInt(list.get(i).get("T")));
			pay.setPay_date(sqlDate);

			payService.insertPay(pay);
		}
		return "redirect:employeeList.do";
	}

	@RequestMapping(value = "/pay/empListPay.do/{emp_no}", method = RequestMethod.GET)
	public String empListPay(@PathVariable("emp_no") String emp_no, Model model,
			@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage) {

		int limit = 5; // 한 페이지 당 게시글 수
		List<Pay> list = payService.empListPay(cPage, limit, Integer.parseInt(emp_no));
		int totalContents = payService.empPayCount(Integer.parseInt(emp_no));
		String pageBar = Utils.getPageBar(totalContents, cPage, limit, emp_no);

		model.addAttribute("list", list).addAttribute("totalContents", totalContents).addAttribute("numPerPage", limit)
				.addAttribute("pageBar", pageBar);

//		JSONArray json = new JSONArray();
//		json.addAll(list);
//		System.out.println("json : " + json);
		return "pay/empListPay";
	}

	@RequestMapping(value = "/pay/detailPay.do/{pay_no}", method = RequestMethod.GET)
//	@ResponseBody
	public String detailPay(@PathVariable("pay_no") String pay_no, Model model) {
		System.out.println("pay_no  " + pay_no);
		Pay pay = payService.selectOnePay(Integer.parseInt(pay_no));
//		JSONArray json = new JSONArray();
//		json.addAll(list);
//		System.out.println("json : " + json);
		model.addAttribute("pay", pay);
		return "pay/payDetail";
	}

	@RequestMapping("/pay/employeeSearch.do")
	public String selectEmployeeSearch(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			String con, String keyword, Model model) {
		int limit = 5; // 한 페이지 당 게시글 수
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

		return "pay/payEmpList";
	}

	@RequestMapping(value = "/pay/searchDatePay.do") // 아직 미구현 날짜 검색
	public String searchDataPay(@RequestParam("sdate") Date sdate, @RequestParam("edate") Date edate, Model model) {

		return "pay/empListPay";
	}

	@RequestMapping(value = "/pay/payDirect.do")
	public String payDirect() {
		return "pay/payDirect";
	}

	@RequestMapping(value = "/pay/payDriectGetInfo")
	@ResponseBody
	public Employee payDriectGetInfo(@RequestParam("emp_no") int emp_no) {
		System.out.println("getInfo 실행");
		Employee emp = employeeService.selectOneEmployee(emp_no);
		return emp;
	}

	@RequestMapping(value = "/pay/payDirectSetInfo.do")
	public String payDirectSetInfo(Pay pay) {
		System.out.println(pay);
		int result = payService.insertPay(pay);
		return "redirect:employeeList.do";
	}

	@RequestMapping(value = "/pay/writePayExcel.do")
	@ResponseBody
	public void writePayExcel(HttpServletRequest request,HttpServletResponse response,
			@RequestParam("empList") int[] empList,
			@RequestParam(value="paydate") String paydate) {
		// 엑셀로 쓸 데이터 생성

//      부서 선택해서 값 입력 받기!! 모달창으로 입력 받자 
		System.out.println(paydate.toString());
		List<Employee> list = new ArrayList<Employee>();
		for (int emp : empList)
			list.add(employeeService.selectOneEmployee(emp));

		ExcelWrite excelWriter = new ExcelWrite();
		// xls 파일 쓰기
//        excelWriter.xlsWiter(list,request);

		// xlsx 파일 쓰기
		String path = excelWriter.xlsxWiter(list, request,paydate);
		

		File file = new File(path);
		FileInputStream fileInputStream = null;
		ServletOutputStream servletOutputStream = null;

		try {
			String downName = null;
			String browser = request.getHeader("User-Agent");

			if (browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")) {
				downName = URLEncoder.encode(file.getName(), "UTF-8").replaceAll("\\+", "%20");

			} else {
				downName = new String(file.getName().getBytes("UTF-8"), "ISO-8859-1");
			}

			response.setHeader("Content-Disposition", "attachment;filename=\"" + downName + "\"");
			response.setContentType("application/octer-stream");
			response.setHeader("Content-Transfer-Encoding", "binary;");
			fileInputStream = new FileInputStream(file);
			servletOutputStream = response.getOutputStream();

			byte b[] = new byte[1024];
			int data = 0;

			while ((data = (fileInputStream.read(b, 0, b.length))) != -1) {

				servletOutputStream.write(b, 0, data);

			}

			servletOutputStream.flush();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (servletOutputStream != null) {
				try {
					servletOutputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (fileInputStream != null) {
				try {
					fileInputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
