package com.kh.coworks.chat.model.dao;

import java.util.List;

import com.kh.coworks.chat.model.vo.Chat;
import com.kh.coworks.chat.model.vo.ChatRoom;

public interface ChatDao {

	List<ChatRoom> selectChatRoomList(int emp_no);

	List<Chat> selectRecentChat(int emp_no);

}