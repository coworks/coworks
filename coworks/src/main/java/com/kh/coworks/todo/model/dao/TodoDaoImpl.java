package com.kh.coworks.todo.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.coworks.todo.model.vo.Todo;

@Repository
public class TodoDaoImpl implements TodoDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	
	// 할 일 조회
	@Override
	public List<Map<String, String>> selectTodolist(Todo todo) {
		return sqlSession.selectList("todo.selectTodolist", todo);
	}

	// 완료 조회
	@Override
	public List<Map<String, String>> selectFinTodolist(Todo todo){
		return sqlSession.selectList("todo.selectFinTodolist", todo);
	}
	
	// 할 일 추가
	@Override
	public int insertTodo(Todo todo) {
		return sqlSession.insert("todo.insertTodo", todo);
	}

	// 할 일 내용&상태 수정
	@Override
	public int updateTodo(Todo todo) {
		return sqlSession.update("todo.updateTodo", todo);
	}

	// 삭제
	@Override
	public int deleteTodo(Todo todo) {
		return sqlSession.delete("todo.deleteTodo", todo);
	}
	
	// '완료'로 변경 (stauts -> 1로 변경)
	@Override
	public int changeTofinished(Todo todo) {
		return sqlSession.update("todo.changeTofinished", todo);
	}
	
	// '진행중'으로 변경(status -> 0으로 변경)
	@Override
	public int changeToIng(Todo todo) {
		return sqlSession.update("todo.changeToIng", todo);
	}
	

}
