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
	public ChatRoom selectCroom(ChatRoom cr) {
		return sqlSession.selectOne("chat.selectCroom", cr);
	}

	@Override
	public int selectChatRoomSeq() {
		return sqlSession.selectOne("chat.selectChatRoomSeq");
	}

	@Override
	public int insertChatRoom(ChatRoom cr) {
		return sqlSession.insert("chat.insertChatRoom", cr);
	}

	@Override
	public void deleteChatRoom(int croom_index) {
		sqlSession.delete("chat.deleteChatRoom", croom_index);
	}

	@Override
	public void updateCroom(ChatRoom cr) {
		sqlSession.update("chat.updateCroom", cr);

	}

	@Override
	public List<Employee> selectChatEmp(int croom_no) {
		return sqlSession.selectList("chat.selectChatEmp", croom_no);
	}

}
