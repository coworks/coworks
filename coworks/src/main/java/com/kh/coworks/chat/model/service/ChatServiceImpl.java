package com.kh.coworks.chat.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.coworks.chat.model.dao.ChatDao;
import com.kh.coworks.chat.model.exception.ChatException;
import com.kh.coworks.chat.model.vo.Chat;
import com.kh.coworks.chat.model.vo.ChatRoom;
import com.kh.coworks.employee.model.vo.Employee;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	private ChatDao chatDao;

	@Override
	public List<ChatRoom> selectChatRoomList(int emp_no) {
		return chatDao.selectChatRoomList(emp_no);
	}

	@Override
	public List<Chat> selectRecentChat(int emp_no) {
		return chatDao.selectRecentChat(emp_no);
	}

	@Override
	public void insertChat(Chat chat) {
		chatDao.insertChat(chat);
	}

	@Override
	public List<Integer> selectCroomEmp(int croom_no) {
		return chatDao.selectCroomEmp(croom_no);
	}

	@Override
	public List<Chat> selectChatList(int croom_no) {
		return chatDao.selectChatList(croom_no);
	}

	@Override
	public ChatRoom selectCroom(ChatRoom cr) {
		return chatDao.selectCroom(cr);
	}

	@Override
	public int insertChatRoom(List<ChatRoom> crList) {
		int result = 0;
		int croom_no = chatDao.selectChatRoomSeq();

		for (ChatRoom cr : crList) {
			cr.setCroom_no(croom_no);
			result = chatDao.insertChatRoom(cr);

			if (result == 0) {
				throw new ChatException();
			}
		}

		return croom_no;
	}

	@Override
	public int inviteChatRoom(List<ChatRoom> crList) {
		int result = 0;
		for (ChatRoom cr : crList) {
			result = chatDao.insertChatRoom(cr);

			if (result == 0) {
				throw new ChatException();
			}
		}
		return result;
	}

	@Override
	public void deleteChatRoom(int croom_index) {
		chatDao.deleteChatRoom(croom_index);

	}

	@Override
	public void updateCroom(ChatRoom cr) {
		chatDao.updateCroom(cr);
	}

	@Override
	public List<Employee> selectChatEmp(int croom_no) {
		return chatDao.selectChatEmp(croom_no);
	}

	@Override
	public int insertChatRoom(ChatRoom cr) {
		// TODO Auto-generated method stub
		return 0;
	}

}
