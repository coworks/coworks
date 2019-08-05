package com.kh.coworks.chat.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.coworks.chat.model.vo.Chat;
import com.kh.coworks.chat.model.vo.ChatRoom;
import com.kh.coworks.employee.model.vo.Employee;

@Repository
public class ChatDaoImpl implements ChatDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<ChatRoom> selectChatRoomList(int emp_no) {
		return sqlSession.selectList("chat.selectChatRoomList", emp_no);
	}

	@Override
	public List<Chat> selectRecentChat(int emp_no) {
		return sqlSession.selectList("chat.selectRecentChat", emp_no);
	}

	@Override
	public void insertChat(Chat chat) {
		sqlSession.insert("chat.insertChat", chat);
	}

	@Override
	public List<Integer> selectCroomEmp(int croom_no) {
		return sqlSession.selectList("chat.selectCroomEmp", croom_no);
	}

	@Override
	public List<Chat> selectChatList(int croom_no) {
		return sqlSession.selectList("chat.selectChatList", croom_no);
	}

	@Override
	public ChatRoom selectCroom(int croom_no) {
		return sqlSession.selectOne("chat.selectCroom", croom_no);
	}

}
