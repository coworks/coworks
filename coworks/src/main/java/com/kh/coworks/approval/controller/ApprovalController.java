package com.kh.coworks.approval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.coworks.approval.model.vo.ApprovalDoc;

@Controller
public class ApprovalController {

	@RequestMapping("/approval/approvalSelectForm.do")
	public String approvalMain() {
		return "approval/approvalSelectForm";
	}

	@RequestMapping("/error.do")
	public String error() {
		return "common/error";
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
