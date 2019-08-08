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
import com.kh.coworks.employee.model.service.EmployeeService;
import com.kh.coworks.employee.model.vo.Employee;

@Controller
public class ChatController {

	@Autowired
	private ChatService chatService;

	@Autowired
	private EmployeeService employeeService;

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
		model.addAttribute("empList", employeeService.selectEmployeeList());
		model.addAttribute("deptList", employeeService.selectDeptEmpCount());
		model.addAttribute("chatEmp", new Gson().toJson(chatService.selectChatEmp(croom_no)));

		return "chat/chatting";
	}

	@RequestMapping("/chat/chatview2.do")
	public String chatView2() {
		return "chat/chatting2";
	}

	@RequestMapping("/chat/insertChatRoom")
	public String insertChatRoom(@RequestParam String croom_title, @RequestParam int[] emp_no,
			HttpServletRequest request) {
		Employee emp = (Employee) request.getSession().getAttribute("employee");
		List<ChatRoom> crList = new ArrayList<ChatRoom>();

		for (int eno : emp_no) {
			ChatRoom cr = new ChatRoom();
			cr.setCroom_title(croom_title);
			cr.setEmp_no(eno);
			crList.add(cr);
		}
		ChatRoom cr = new ChatRoom();
		cr.setCroom_title(croom_title);
		cr.setEmp_no(emp.getEmp_no());
		crList.add(cr);

		int croom_no = chatService.insertChatRoom(crList);

		return "redirect:/chat/croom/" + croom_no;
	}

	@RequestMapping("/chat/inviteEmp")
	public String inviteEmp(@RequestParam int croom_no, @RequestParam int[] emp_no, @RequestParam String croom_title) {
		List<ChatRoom> crList = new ArrayList<ChatRoom>();
		
		for (int eno : emp_no) {
			ChatRoom cr = new ChatRoom();
			cr.setCroom_no(croom_no);
			cr.setEmp_no(eno);
			cr.setCroom_title(croom_title);
			crList.add(cr);
		}

		int result = chatService.inviteChatRoom(crList);

		return "redirect:/chat/croom/" + croom_no;
	}

	@RequestMapping("/chat/exitCroom/{croom_index}")
	public String exitCroom(@PathVariable int croom_index) {
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
