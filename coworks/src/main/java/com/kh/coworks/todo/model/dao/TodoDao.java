package com.kh.coworks.todo.model.dao;


import java.util.List;
import java.util.Map;

import com.kh.coworks.todo.model.vo.Todo;

public interface TodoDao {

	// 할 일 조회
	List<Map<String, String>> selectTodolist(Todo todo);
	
	
	// 완료 조회
	List<Map<String, String>> selectFinTodolist(Todo todo);
	
	
	// 할 일 추가
	int insertTodo(Todo todo);
	
	
	// 할 일 내용&상태 수정
	int updateTodo(Todo todo);
	
	
	// 삭제
	int deleteTodo(Todo todo);
	
	
	// '완료'로 변경 (stauts -> 1로 변경)
	int changeTofinished(Todo todo);
	
	
}
