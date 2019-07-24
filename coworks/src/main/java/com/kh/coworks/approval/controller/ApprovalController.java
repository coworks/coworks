package com.kh.coworks.approval.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.coworks.approval.model.service.ApprovalService;
import com.kh.coworks.approval.model.vo.ApprovalDoc;
import com.kh.coworks.approval.model.vo.ApprovalForm;

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
	@RequestMapping(value = "/approval/write/{docType}", method = RequestMethod.GET)
	public String approvalExpense(@PathVariable("docType") String docType) {
		return "approval/approvalDoc/approvalWriteForm/" + docType;
	}

	@RequestMapping(value = "/approval/writeApprovalDone", method = RequestMethod.POST,/* headers = "accept=application/json", produces="text/plain;charset=UTF-8"*/consumes = "application/x-www-form-urlencoded")
	public String approveCreate(@RequestBody Map<String,Object> body, Model model) {
		System.out.println(body);
		return "approval/approvalPending.do";
	}
}
