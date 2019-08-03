package com.kh.coworks.chat.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.coworks.chat.model.vo.ChatRoom;

@Repository
public class ChatDaoImpl implements ChatDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<ChatRoom> selectChatRoomList(int emp_no) {
		return sqlSession.selectList("chat.selectChatRoomList", emp_no);
	}

}