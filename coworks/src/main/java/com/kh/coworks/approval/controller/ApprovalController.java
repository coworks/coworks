package com.kh.coworks.approval.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	@RequestMapping("/approval/WriteLeaveApplication.do")
	public String approvalVacation() {
		return "approval/approvalDoc/approvalWriteForm/leaveApplicationForm";
	}

	@RequestMapping("/approval/WriteExpenseReport.do")
	public String approvalExpense() {
		return "approval/approvalDoc/approvalWriteForm/expenseReportForm";
	}

	@RequestMapping("/approval/createApproval")
	public String approveCreate(ApprovalDoc doc, Model model) {

		return "approval/approvalPending.do";
	}
}
