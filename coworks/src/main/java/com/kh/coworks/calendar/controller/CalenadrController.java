package com.kh.coworks.calendar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CalenadrController {
	
	@RequestMapping("/calendar/calendarview.do")
	public String view() {
		return "calendar/app-calendar";
	}
	
 
	
}
