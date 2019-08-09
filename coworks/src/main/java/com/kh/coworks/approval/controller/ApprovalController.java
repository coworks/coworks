package com.kh.coworks.approval.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;
import com.kh.coworks.approval.model.service.ApprovalService;
import com.kh.coworks.approval.model.vo.ApprovalAttach;
import com.kh.coworks.approval.model.vo.ApprovalDoc;
import com.kh.coworks.approval.model.vo.ApprovalForm;
import com.kh.coworks.approval.model.vo.ApprovalStatus;
import com.kh.coworks.employee.model.service.EmployeeService;
import com.kh.coworks.employee.model.vo.Employee;

@Controller
public class ApprovalController {

	@Autowired
	private ApprovalService approvalService;

	@Autowired
	private EmployeeService employeeService;

	@RequestMapping("/approval/approvalSelectForm.do")
	public String approvalFormFolderList(Model model) {
		List<String> list = approvalService.selectApprovalFormFolderList();

		model.addAttribute("folder", list);

		return "approval/approvalSelectForm";
	}

	@RequestMapping("/approval/approvalSelectFormFolder.do")
	public String approvalFormList(@RequestParam String folderName, Model model) {
		List<ApprovalForm> list = approvalService.selectApprovalFormList(folderName);

		model.addAttribute("forms", list);
		return "approval/approvalSelectForm";
	}

	@RequestMapping("/approval/approvalSearchForm.do")
	public String approvalSearchForm(@RequestParam String search, Model model) {
		List<ApprovalForm> list = approvalService.searchApprovalForm(search);

		model.addAttribute("forms", list);
		return "approval/approvalSelectForm";
	}

	@RequestMapping("/approval/approvalReceive.do")
	public String approvalReceive(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		Employee employee = (Employee) session.getAttribute("employee");
		List<ApprovalDoc> list = approvalService.selectApprovalReceive(employee.getEmp_no());

		model.addAttribute("docList", list);
		return "approval/approvalReceive";
	}

	@RequestMapping("/approval/approvalWait.do")
	public String approvalWait(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		Employee employee = (Employee) session.getAttribute("employee");
		List<ApprovalDoc> list = approvalService.selectApprovalWait(employee.getEmp_no());

		model.addAttribute("docList", list);
		return "approval/approvalWait";
	}

	@RequestMapping("/approval/approvalSubmit.do")
	public String approvalSubmit(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		Employee employee = (Employee) session.getAttribute("employee");
		List<ApprovalDoc> list = approvalService.selectApprovalSubmit(employee.getEmp_no());

		model.addAttribute("docList", list);
		return "approval/approvalSubmit";
	}

	@RequestMapping("/approval/approvalComplete.do")
	public String approvalComplete(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		Employee employee = (Employee) session.getAttribute("employee");
		List<ApprovalDoc> list = approvalService.selectApprovalComplete(employee.getEmp_no());

		model.addAttribute("docList", list);
		return "approval/approvalComplete";
	}

	// approvDoc Mapping
	@RequestMapping(value = "/approval/write/{docType}/{formNo}", method = RequestMethod.GET)
	public String approvalExpense(@PathVariable("docType") String docType, @PathVariable("formNo") int formNo,
			Model model) {
		model.addAttribute("formNo", formNo);
		model.addAttribute("empList", employeeService.selectEmployeeList());
		model.addAttribute("deptList", employeeService.selectDeptEmpCount());

		return "approval/approvalDoc/approvalWriteForm/" + docType;
	}

	@RequestMapping(value = "/approval/writeApprovalDone", method = RequestMethod.POST)
	public String approveCreate(@RequestParam Map<String, Object> body, @RequestParam(value = "signList") int[] sign,
			@RequestParam(value = "upFiles", required = false) MultipartFile[] upFiles, HttpSession session) {

		ApprovalDoc doc = new ApprovalDoc();
		List<ApprovalStatus> signList = new ArrayList<ApprovalStatus>();

		for (int i : sign) {
			ApprovalStatus as = new ApprovalStatus();
			as.setEmp_no(i);

			signList.add(as);
		}

		List<ApprovalAttach> fileList = new ArrayList<ApprovalAttach>();

		String savePath = "/resources/approval/attach";
		String saveDir = session.getServletContext().getRealPath(savePath);
		if (new File(saveDir).exists()) {

			for (MultipartFile f : upFiles) {
				if (!f.isEmpty()) {
					String originalName = f.getOriginalFilename();
					String ext = originalName.substring(originalName.lastIndexOf(".") + 1);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");

					int rndNum = (int) (Math.random() * 1000);

					String renamedName = sdf.format(new java.util.Date()) + "_" + rndNum + "." + ext;

					try {
						f.transferTo(new File(saveDir + "/" + renamedName));
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}

					ApprovalAttach attach = new ApprovalAttach();
					attach.setApAtt_oriname(originalName);
					attach.setApAtt_rename(renamedName);
					attach.setApAtt_path(savePath);

					fileList.add(attach);
				}
			}
		}

		doc.setAdoc_security(Integer.valueOf((String) body.get("adoc_security")));
		doc.setAdoc_subject((String) body.get("adoc_subject"));
		doc.setAdoc_writerno(Integer.valueOf((String) body.get("adoc_writerno")));
		doc.setAform_no(Integer.valueOf((String) body.get("aform_no")));

		Calendar cal = new GregorianCalendar();
		cal.add(Calendar.YEAR, Integer.valueOf((String) body.get("expiration")));
		doc.setAdoc_expiration(new Date(cal.getTimeInMillis()));

		body.remove("adoc_writerno");
		body.remove("aform_no");
		body.remove("adoc_security");
		body.remove("adoc_subject");
		body.remove("upFiles");
		body.remove("expiration");
		body.remove("signList");

		doc.setAdoc_content(new JSONObject(body).toJSONString());

		System.out.println(doc);

		approvalService.insertApprovalDoc(doc, signList, fileList);

		return "redirect:/approval/approvalWait.do";
	}

	@RequestMapping(value = "/approval/approvalAttachDown")
	public void fileDownload(HttpServletResponse response, HttpServletRequest request,
			@RequestParam("path") String filepath, @RequestParam String name) {

		String path = request.getSession().getServletContext().getRealPath(filepath);

		try {
			String browser = request.getHeader("User-Agent");
			// 파일 인코딩
			if (browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")) {
				name = URLEncoder.encode(name, "UTF-8").replaceAll("\\+", "%20");
			} else {
				name = new String(name.getBytes("UTF-8"), "ISO-8859-1");
			}
		} catch (UnsupportedEncodingException ex) {
			System.out.println("UnsupportedEncodingException");
		}

		System.out.println(path);
		File file1 = new File(path);
		if (!file1.exists()) {
			return;
		}

		// 파일명 지정
		response.setContentType("application/octer-stream");
		response.setHeader("Content-Transfer-Encoding", "binary;");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + name + "\"");
		try {
			OutputStream os = response.getOutputStream();
			FileInputStream fis = new FileInputStream(path);

			int ncount = 0;
			byte[] bytes = new byte[512];

			while ((ncount = fis.read(bytes)) != -1) {
				os.write(bytes, 0, ncount);
			}
			fis.close();
			os.close();
		} catch (FileNotFoundException ex) {
			System.out.println("FileNotFoundException");
		} catch (IOException ex) {
			System.out.println("IOException");
		}
	}

	@RequestMapping(value = "/approval/approvalDoc/v/{docNo}", method = RequestMethod.GET)
	public ModelAndView approvalDocView(@PathVariable("docNo") int adoc_no) {
		ModelAndView mv = new ModelAndView();

		ApprovalDoc doc = approvalService.selectOneApprovalDoc(adoc_no);

		mv.addObject("doc", doc).addObject("signList", approvalService.selectApprovalStatus(adoc_no))
				.addObject("attachList", approvalService.selectApprovalAttach(adoc_no))
				.addObject("form", approvalService.selectApprovalDocForm(doc.getAform_no()))
				.addObject("writer", employeeService.selectOneEmployee(doc.getAdoc_writerno()));

		mv.setViewName("approval/approvalDocDetail");

		return mv;
	}

	@RequestMapping(value = "/approval/{approvalAct}/{docNo}")
	public String approvalStatusUpdate(@PathVariable("approvalAct") String approvalAct,
			@PathVariable("docNo") int adoc_no, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Employee employee = (Employee) session.getAttribute("employee");

		int status = (approvalAct.equals("approve") ? 1 : -1);

		ApprovalStatus st = new ApprovalStatus();
		st.setAdoc_no(adoc_no);
		st.setEmp_no(employee.getEmp_no());
		st.setAs_status(status);

		approvalService.updateApprovalStatus(st);

		return "redirect:/approval/approvalReceive.do";
	}

	@RequestMapping(value = "/approval/approveList", method = RequestMethod.POST)
	public String approvalListApprove(@RequestParam("docNo") int[] docNoArr, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Employee employee = (Employee) session.getAttribute("employee");

		for (int docNo : docNoArr) {
			ApprovalStatus st = new ApprovalStatus();
			st.setAdoc_no(docNo);
			st.setEmp_no(employee.getEmp_no());
			st.setAs_status(1);

			approvalService.updateApprovalStatus(st);
		}

		return "redirect:/approval/approvalReceive.do";
	}

	@RequestMapping("/approval/approvalDoc/delete/{docNo}")
	public String approvalDelete(@PathVariable("docNo") int adoc_no) {
		int result = approvalService.deleteApprovalDoc(adoc_no);

		return "redirect:/approval/approvalWait.do";
	}

	@RequestMapping("/approval/approvalDoc/edit/{docNo}")
	public String approvalEdit(@PathVariable("docNo") int adoc_no, Model model) {

		ApprovalDoc doc = approvalService.selectOneApprovalDoc(adoc_no);
		ApprovalForm form = approvalService.selectApprovalDocForm(doc.getAform_no());

		model.addAttribute("doc", doc).addAttribute("signList", approvalService.selectApprovalStatus(adoc_no))
				.addAttribute("attachList", approvalService.selectApprovalAttach(adoc_no)).addAttribute("form", form)
				.addAttribute("writer", employeeService.selectOneEmployee(doc.getAdoc_writerno()));
		model.addAttribute("empList", employeeService.selectEmployeeList());
		model.addAttribute("deptList", employeeService.selectDeptEmpCount());

		return "approval/approvalDoc/approvalEditForm/" + form.getAform_formPage();
	}

	@RequestMapping(value = "/approval/editApprovalDone", method = RequestMethod.POST)
	public String approveEdit(@RequestParam Map<String, Object> body, @RequestParam(value = "signList") int[] sign,
			@RequestParam(value = "deleteAttach", required = false) int[] deleteAttach,
			@RequestParam(value = "upFiles", required = false) MultipartFile[] upFiles, HttpSession session) {

		ApprovalDoc doc = approvalService.selectOneApprovalDoc(Integer.valueOf((String) body.get("adoc_no")));
		doc.setAdoc_security(Integer.valueOf((String) body.get("adoc_security")));
		doc.setAdoc_subject((String) body.get("adoc_subject"));

		approvalService.deleteApprovalStatus(doc.getAdoc_no());
		List<ApprovalStatus> signList = new ArrayList<ApprovalStatus>();

		for (int i : sign) {
			ApprovalStatus as = new ApprovalStatus();
			as.setAdoc_no(doc.getAdoc_no());
			as.setEmp_no(i);

			signList.add(as);
		}

		if (deleteAttach != null)
			approvalService.deleteApprovalAttach(deleteAttach);
		List<ApprovalAttach> fileList = new ArrayList<ApprovalAttach>();

		String savePath = "/resources/approval/attach";
		String saveDir = session.getServletContext().getRealPath(savePath);
		if (new File(saveDir).exists()) {

			for (MultipartFile f : upFiles) {
				if (!f.isEmpty()) {
					String originalName = f.getOriginalFilename();
					String ext = originalName.substring(originalName.lastIndexOf(".") + 1);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");

					int rndNum = (int) (Math.random() * 1000);

					String renamedName = sdf.format(new java.util.Date()) + "_" + rndNum + "." + ext;

					try {
						f.transferTo(new File(saveDir + "/" + renamedName));
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}

					ApprovalAttach attach = new ApprovalAttach();
					attach.setAdoc_no(doc.getAdoc_no());
					attach.setApAtt_oriname(originalName);
					attach.setApAtt_rename(renamedName);
					attach.setApAtt_path(savePath);

					fileList.add(attach);
				}
			}
		}

		body.remove("adoc_no");
		body.remove("adoc_security");
		body.remove("adoc_subject");
		body.remove("upFiles");
		body.remove("signList");
		body.remove("adoc_writerno");
		body.remove("deleteAttach");

		doc.setAdoc_content(new JSONObject(body).toJSONString());

		approvalService.updateApprovalDoc(doc, signList, fileList);

		return "redirect:/approval/approvalDoc/v/" + doc.getAdoc_no();
	}
}
