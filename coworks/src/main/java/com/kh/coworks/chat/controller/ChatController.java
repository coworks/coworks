package com.kh.coworks.chat.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.coworks.chat.model.service.ChatService;
import com.kh.coworks.chat.model.vo.Chat;
import com.kh.coworks.chat.model.vo.ChatRoom;
import com.kh.coworks.employee.model.vo.Employee;

@Controller
public class ChatController {

	@Autowired
	private ChatService chatService;

	@RequestMapping("/chat/chatview.do")
	public String chatView(Model model, HttpServletRequest request) {
		Employee loginEmployee = (Employee) request.getSession().getAttribute("employee");

		List<Chat> cList = chatService.selectRecentChat(loginEmployee.getEmp_no());

		model.addAttribute("croomList", cList);

		return "chat/chatting";
	}

	@RequestMapping("/chat/chatview2.do")
	public String chatView2() {
		return "chat/chatting2";
	}
}
