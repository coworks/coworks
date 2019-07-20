package com.kh.coworks.mail.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MailController {

	@RequestMapping("/mail/app-email.do")
	public String selectMail() {
		return "mail/app-email";
	}
	
	@RequestMapping("/mail/app-compose.do")
	public String writeMail() {
		return "mail/app-compose";
	}
	
	@RequestMapping("/mail/app-email-detail.do")
	public String selectOneMail() {
		
		return "mail/app-email-detail";
	}
}
