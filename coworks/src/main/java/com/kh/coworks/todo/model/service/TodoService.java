package com.kh.coworks.todo.model.service;

import java.util.List;
import java.util.Map;

import com.kh.coworks.todo.model.vo.Todo;

public interface TodoService {

	
	static final int TODO_SRV_ERROR = 0;
	static final int TODO_SRV_COMP = 1;
	
	/**
	 * Todo 목록조회 --> status 0(진행중) & 1(완료내역) 보이도록 하기
	 * @param todo_status
	 * @return
	 */
	List<Map<String, String>> selectTodolist(Todo todo);
	
	
//	
//	/**
//	 * Todo 추가
//	 * @param todo
//	 * @return
//	 */
//	int insertTodo(Todo todo);
//	
//	
//	
//	/**
//	 * Todo 내용&상태 수정
//	 * @param todo
//	 * @return
//	 */
//	int updateTodo(Todo todo);
//	
//	
//	
//	/**
//	 * Todo 삭제 --> status 2로 바꾸기
//	 * @param todo_no
//	 * @param todo_status
//	 * @return
//	 */
//	int deleteTodo(int todo_no, int todo_status);





	
	
	
}
