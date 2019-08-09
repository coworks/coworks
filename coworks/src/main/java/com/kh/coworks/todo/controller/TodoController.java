package com.kh.coworks.todo.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.coworks.employee.model.vo.Employee;
import com.kh.coworks.todo.model.service.TodoService;
import com.kh.coworks.todo.model.vo.Todo;

@Controller
public class TodoController {
	
	@Autowired
	TodoService todoService;

	// (할 일)조회
	@RequestMapping("/todo/todolist.do")
	public String selecttodolist(Model model, HttpServletRequest request ) {
		
		Todo todo = new Todo();
		HttpSession session = request.getSession();
		Employee emp = (Employee) session.getAttribute("employee");
		
		todo.setEmp_no(emp.getEmp_no());
		todo.setTodo_status(0);
		
		ArrayList<Map<String, String>> list 
			= new ArrayList<Map<String, String>>(todoService.selectTodolist(todo));
		
		ArrayList<Map<String, String>> finList 
			= new ArrayList<Map<String, String>>(todoService.selectFinTodolist(todo));
		
		model.addAttribute("todoList", list).addAttribute("finList", finList);
		
		return "todo/todolist";
	}
	
	// (할 일)추가
	@RequestMapping("/todo/addtodo.do")
	public String inserttodo(Model model, Todo todo) {
		
		int result = todoService.insertTodo(todo);
		
		model.addAttribute(todo);
		
		return "redirect:/todo/todolist.do";
	}
	
	// (할 일)추가 _ index화면에서
	@RequestMapping("/addtodohome.do")
	public String inserttodohome(Model model, Todo todo) {
		 
		
		int result = todoService.insertTodo(todo);
		
		model.addAttribute(todo);
		
		return "redirect:/common/gomain.do";
	}
	
	// (할 일) 내용&상태 수정
	@RequestMapping("/todo/correcttodo.do")
	public String updatetodo(Model model, Todo todo) {
		
		int result = todoService.updateTodo(todo);
		
		model.addAttribute(todo);
		
		return "redirect:/todo/todolist.do";
	}
	
	// (할 일 & 완료)삭제
	@RequestMapping("/todo/deletetodo.do")
	public String deletetodo(Model model, Todo todo) {
		
		int result = todoService.deleteTodo(todo);
		
		model.addAttribute(todo);
		
		return "redirect:/todo/todolist.do";
	}
	
	// '완료'로 변경 (status -> 1로 변경)
	@RequestMapping("/todo/finishtodo.do")
	public String changeTofinished(Model model, String todo_no ) {

		Todo todo = new Todo();
		int todo_number = Integer.parseInt(todo_no);
		todo.setTodo_no(todo_number);
		
		int result = todoService.changeTofinished(todo);
		
		model.addAttribute(todo);
		
		return "redirect:/todo/todolist.do";
	}
	
	// '완료'로 변경 _ HOME에서 (status -> 1로 변경)
	@RequestMapping("/todo/finishtodohome.do")
	@ResponseBody
	public Todo changeTofinishedHome(String todo_no , String todo_checked) {

		Todo todo = new Todo();
		int todo_number = Integer.parseInt(todo_no);
		todo.setTodo_no(todo_number);
		
		if(todo_checked.equals("true")) { //완료로 바꾸기 위해 체크가 되었다면
			int result = todoService.changeTofinished(todo);
		} else {
			int result = todoService.changeToIng(todo);
		}
		
		
		return todo;
	}
	
}
