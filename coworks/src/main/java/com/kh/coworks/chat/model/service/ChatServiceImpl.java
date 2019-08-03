package com.kh.coworks.chat.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.coworks.chat.model.dao.ChatDao;
import com.kh.coworks.chat.model.vo.Chat;
import com.kh.coworks.chat.model.vo.ChatRoom;

@Service
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	private ChatDao chatDao;
	
	@Override
	public List<ChatRoom> selectChatRoomList(int emp_no){
		return chatDao.selectChatRoomList(emp_no);
	}
	
	@Override
	public List<Chat> selectRecentChat(int emp_no){
		return chatDao.selectRecentChat(emp_no);
	}

	@Override
	public void insertChat(Chat chat) {
		chatDao.insertChat(chat);
	}

}
