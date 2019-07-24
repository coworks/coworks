package com.kh.coworks.approval.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.coworks.approval.model.service.ApprovalService;
import com.kh.coworks.approval.model.vo.ApprovalAttach;
import com.kh.coworks.approval.model.vo.ApprovalDoc;
import com.kh.coworks.approval.model.vo.ApprovalForm;
import com.kh.coworks.approval.model.vo.ApprovalStatus;

@Controller
public class ApprovalController {

	@Autowired
	private ApprovalService approvalService;

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

	@RequestMapping("/approval/approvalPending.do")
	public String approvalPending() {
		return "approval/approvalPending";
	}

	@RequestMapping("/approval/approvalYet.do")
	public String approvalYet() {
		return "approval/approvalYet";
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
		return "approval/approvalDoc/approvalWriteForm/" + docType;
	}

	@RequestMapping(value = "/approval/writeApprovalDone", method = RequestMethod.POST)
	public String approveCreate(@RequestParam Map<String, Object> body,
			@RequestParam(required = false, value = "upfiles") MultipartFile[] upfiles, Model model) {

		ApprovalDoc doc = new ApprovalDoc();
		List<ApprovalStatus> signList = new ArrayList<ApprovalStatus>();
		List<ApprovalAttach> fileList = new ArrayList<ApprovalAttach>();

		doc.setAdoc_security(Integer.valueOf((String) body.get("adoc_security")));
		doc.setAdoc_subject((String) body.get("adoc_subject"));
		doc.setAdoc_writerno(Integer.valueOf((String) body.get("adoc_writerno")));
		doc.setAform_no(Integer.valueOf((String) body.get("aform_no")));

		body.remove("adoc_writerno");
		body.remove("aform_no");
		body.remove("adoc_security");
		body.remove("adoc_subject");
		body.remove("upFiles");

		doc.setAdoc_content(new JSONObject(body).toJSONString());

		System.out.println(doc);

		//approvalService.insertApprovalDoc(doc, signList, fileList);

		return "redirect:/approval/approvalPending.do";
	}
}
