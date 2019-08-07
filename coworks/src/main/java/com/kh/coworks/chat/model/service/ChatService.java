package com.kh.coworks.chat.model.service;

import java.util.List;

import com.kh.coworks.chat.model.vo.Chat;
import com.kh.coworks.chat.model.vo.ChatRoom;
import com.kh.coworks.employee.model.vo.Employee;

public interface ChatService {

	List<ChatRoom> selectChatRoomList(int emp_no);

	List<Chat> selectRecentChat(int emp_no);

	void insertChat(Chat chat);

	List<Integer> selectCroomEmp(int croom_no);
	
	List<Chat> selectChatList(int croom_no);

	ChatRoom selectCroom(ChatRoom cr);

	int insertChatRoom(List<ChatRoom> crList);

	int insertChatRoom(ChatRoom cr);

	void deleteChatRoom(int croom_index);

	void updateCroom(ChatRoom cr);

	List<Employee> selectChatEmp(int croom_no);

	int inviteChatRoom(List<ChatRoom> crList);

}
