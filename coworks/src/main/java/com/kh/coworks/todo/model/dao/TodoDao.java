package com.kh.coworks.todo.model.dao;


import java.util.List;
import java.util.Map;

import com.kh.coworks.todo.model.vo.Todo;

public interface TodoDao {

	
	List<Map<String, String>> selectTodolist(Todo todo);
	
	
	
/*
	int insertTodo(Todo todo);
	
	
	

	int updateTodo(Todo todo);
	
	
	

	int deleteTodo(int todo_no, int todo_status);
	*/
	
}
