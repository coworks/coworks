package com.kh.coworks.mail.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MailController {

	@RequestMapping("/mail/app-email.do")
	public String mailList() {
		
		return "mail/app-email";
	}
}
