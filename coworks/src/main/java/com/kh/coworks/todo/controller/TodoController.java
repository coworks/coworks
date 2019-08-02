package com.kh.coworks.todo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TodoController {

	@RequestMapping("/todo/todolist.do")
	public String selecttodolist() {
		return "todo/todolist";
	}
	
	@RequestMapping("/todo/addtodo.do")
	public String inserttodo() {
		return "todo/addtodo";
	}
	
	@RequestMapping("/todo/correcttodo.do")
	public String updatetodo() {
		return "todo/correcttodo";
	}
	
	
	
	
}
