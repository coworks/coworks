package com.kh.coworks.approval.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
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
		List<ApprovalDoc> list = approvalService.approvalWait(employee.getEmp_no());

		model.addAttribute("docList", list);
		return "approval/approvalWait";
	}

	@RequestMapping("/approval/approvalSubmit.do")
	public String approvalSubmit() {
		return "approval/approvalSubmit";
	}

	@RequestMapping("/approval/approvalComplete.do")
	public String approvalComplete() {
		return "approval/approvalComplete";
	}

	@RequestMapping("/approval/approvalDetail.do")
	public String approvalDetail(@RequestParam int adoc_no) {
		return "approval/approvalDetail";
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
	public void fileDownload(HttpServletResponse response, HttpServletRequest request, @RequestParam String path,
			@RequestParam String name) {

		File file = new File(path);

		FileInputStream fileInputStream = null;
		ServletOutputStream servletOutputStream = null;

		try {
			String downName = null;
			String browser = request.getHeader("User-Agent");

			if (browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")) {
				downName = URLEncoder.encode(name, "UTF-8").replaceAll("\\+", "%20");

			} else {
				downName = new String(name.getBytes("UTF-8"), "ISO-8859-1");
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

		int status = (approvalAct.equals("approve") ? 1 : 2);

		ApprovalStatus st = new ApprovalStatus();
		st.setAdoc_no(adoc_no);
		st.setEmp_no(employee.getEmp_no());
		st.setAs_status(status);

		approvalService.updateApprovalStatus(st);

		return "redirect:/approval/approvalPending.do";
	}
}
