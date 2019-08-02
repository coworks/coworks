package com.kh.coworks.todo.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.coworks.todo.model.dao.TodoDao;
import com.kh.coworks.todo.model.vo.Todo;

@Service
public class TodoServiceImpl implements TodoService {

	@Autowired
	private TodoDao todoDao;
	
	@Override
	public List<Map<String, String>> selectTodolist(Todo todo) {
		return todoDao.selectTodolist(todo);
	}
	
/*
	@Override
	public int insertTodo(Todo todo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateTodo(Todo todo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteTodo(int todo_no, int todo_status) {
		// TODO Auto-generated method stub
		return 0;
	}
*/
	
}
