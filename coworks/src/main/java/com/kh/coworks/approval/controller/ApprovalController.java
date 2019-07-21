package com.kh.coworks.approve.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.coworks.approve.model.vo.ApprovDoc;

@Controller
public class ApproveController {

	@RequestMapping("/approval/approvalWrite.do")
	public String approvalMain() {
		return "approval/approvalWrite";
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
	@RequestMapping("/approval/approvalDoc/vacation.do")
	public String approvalVaction() {
		return "approval/approvalDoc/approval_vacation";
	}

	@RequestMapping("/approval/createApproval")
	public String approveCreate(ApprovDoc doc, Model model) {

		

		return "approval/approvalPending.do";
	}
}
