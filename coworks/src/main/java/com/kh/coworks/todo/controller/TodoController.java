package com.kh.coworks.todo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.coworks.employee.model.vo.Employee;
import com.kh.coworks.todo.model.service.TodoService;
import com.kh.coworks.todo.model.vo.Todo;

@Controller
public class TodoController {
	
	@Autowired
	TodoService todoService;

	@RequestMapping("/todo/todolist.do")
	public String selecttodolist(Model model, HttpServletRequest request ) {
		
		Todo todo = new Todo();
		HttpSession session = request.getSession();
		Employee emp = (Employee) session.getAttribute("employee");
		
		todo.setEmp_no(emp.getEmp_no());
		todo.setTodo_status(0);
		
		ArrayList<Map<String, String>> list = new ArrayList<Map<String, String>>(todoService.selectTodolist(todo));
		
		
		model.addAttribute("todoList", list);		
		System.out.println("model : " + model);
		
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
