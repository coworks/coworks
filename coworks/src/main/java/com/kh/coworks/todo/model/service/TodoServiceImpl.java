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
	
	// 할 일 조회
	@Override
	public List<Map<String, String>> selectTodolist(Todo todo) {
		return todoDao.selectTodolist(todo);
	}
	
	// 완료 조회
	@Override
	public List<Map<String, String>> selectFinTodolist(Todo todo){
		return todoDao.selectFinTodolist(todo);
	}
	
	// 할 일 추가
	@Override
	public int insertTodo(Todo todo) {
		return todoDao.insertTodo(todo);
	}

	// 할 일 내용&상태 수정
	@Override
	public int updateTodo(Todo todo) {
		return todoDao.updateTodo(todo);
	}

	// 삭제
	@Override
	public int deleteTodo(Todo todo) {
		return todoDao.deleteTodo(todo);
	}
	
	// '완료'로 변경 (stauts -> 1로 변경)
	@Override
	public int changeTofinished(Todo todo) {
		return todoDao.changeTofinished(todo);
	}
	
}
