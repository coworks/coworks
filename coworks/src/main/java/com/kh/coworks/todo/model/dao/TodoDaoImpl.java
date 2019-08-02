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
	
	@Override
	public List<Map<String, String>> selectTodolist(Todo todo) {
		return sqlSession.selectList("todo.selectTodolist", todo);
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
