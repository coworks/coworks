package com.kh.coworks.websocket;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kh.coworks.approval.model.service.ApprovalService;
import com.kh.coworks.approval.model.vo.ApprovalDoc;
import com.kh.coworks.chat.model.service.ChatService;
import com.kh.coworks.chat.model.vo.Chat;
import com.kh.coworks.employee.model.vo.Employee;

import net.sf.json.JSONArray;

public class chatviewHandler extends TextWebSocketHandler {

	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

	@Autowired
	private ChatService chatSrv;

	// 클라이언트와 연결 이후에 실행되는 메서드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		sessionList.add(session);
		//super.afterConnectionEstablished(session);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		Employee loginEmployee = (Employee) session.getAttributes().get("employee");
		JSONObject chatJson = new Gson().fromJson(message.getPayload(), JSONObject.class);

		Chat chat = new Chat();
		chat.setChat_content((String) chatJson.get("chat_content"));
		chat.setChat_sendno(loginEmployee.getEmp_no());
		chat.setCroom_no(Integer.valueOf((String) chatJson.get("croom_no")));
		chat.setSenderName(loginEmployee.getEmp_name());
		chat.setChat_sendtime(new Timestamp(System.currentTimeMillis()));
		
		chatSrv.insertChat(chat);
		
		//croom 셀럭트를 하고 보낼까 보내고 나서 셀렉트할까..
		
		for(WebSocketSession ws: sessionList) {
			ws.sendMessage(new TextMessage(new Gson().toJson(chat)));
		}
		

		super.handleTextMessage(session, message);
	}

	// 클라이언트와 연결을 끊었을 때 실행되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		super.afterConnectionClosed(session, status);
	}

}
