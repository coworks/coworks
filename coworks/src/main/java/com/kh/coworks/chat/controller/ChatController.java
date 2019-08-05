package com.kh.coworks.chat.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.kh.coworks.chat.model.service.ChatService;
import com.kh.coworks.chat.model.vo.Chat;
import com.kh.coworks.chat.model.vo.ChatRoom;
import com.kh.coworks.employee.model.vo.Employee;

@Controller
public class ChatController {

	@Autowired
	private ChatService chatService;

	@RequestMapping("/chat/croom/{croom_no}")
	public String chatView(@PathVariable int croom_no, Model model, HttpServletRequest request) {
		Employee loginEmployee = (Employee) request.getSession().getAttribute("employee");

		List<Chat> cList = chatService.selectRecentChat(loginEmployee.getEmp_no());

		model.addAttribute("croomList", cList);
		if (cList.size() != 0 && croom_no == 0)
			croom_no = cList.get(0).getCroom_no();

		model.addAttribute("chatList", new Gson().toJson(chatService.selectChatList(croom_no)));
		ChatRoom cr = new ChatRoom();
		cr.setEmp_no(loginEmployee.getEmp_no());
		cr.setCroom_no(croom_no);
		model.addAttribute("croom", chatService.selectCroom(cr));

		return "chat/chatting";
	}

	@RequestMapping("/chat/chatview2.do")
	public String chatView2() {
		return "chat/chatting2";
	}

	@RequestMapping("/chat/insertChatRoom")
	public int insertChatRoom(@RequestParam String croom_title, @RequestParam int[] emp_no) {
		List<ChatRoom> crList = new ArrayList<ChatRoom>();

		for (int eno : emp_no) {
			ChatRoom cr = new ChatRoom();
			cr.setCroom_title(croom_title);
			cr.setEmp_no(eno);
			crList.add(cr);
		}

		int result = chatService.insertChatRoom(crList);

		return result;
	}

	@RequestMapping("/chat/inviteEmp")
	public int inviteEmp(@RequestParam int croom_no, @RequestParam int emp_no, @RequestParam String croom_title) {
		ChatRoom cr = new ChatRoom();
		cr.setCroom_no(croom_no);
		cr.setEmp_no(emp_no);
		cr.setCroom_title(croom_title);

		int result = chatService.insertChatRoom(cr);

		return result;
	}

	@RequestMapping("/chat/exitCroom")
	public String exitCroom(@RequestParam int croom_index) {
		chatService.deleteChatRoom(croom_index);

		return "redirect:/chat/croom/0";
	}

	@RequestMapping("/chat/renameCroom")
	public String renameCroom(@RequestParam int croom_index, @RequestParam String croom_title,
			@RequestParam int croom_no) {
		ChatRoom cr = new ChatRoom();
		cr.setCroom_index(croom_index);
		cr.setCroom_title(croom_title);

		chatService.updateCroom(cr);

		return "redirect:/chat/croom/" + croom_no;
	}

}
