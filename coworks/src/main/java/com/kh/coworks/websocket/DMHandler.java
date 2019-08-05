package com.kh.coworks.websocket;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.kh.coworks.approval.model.service.ApprovalService;
import com.kh.coworks.approval.model.vo.ApprovalDoc;
import com.kh.coworks.chat.model.service.ChatService;
import com.kh.coworks.dm.model.service.DMService;
import com.kh.coworks.employee.model.vo.Employee;

import net.sf.json.JSONArray;

public class DMHandler extends TextWebSocketHandler {

	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

	@Autowired
	private DMService dmSrv;

	// 클라이언트와 연결 이후에 실행되는 메서드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		sessionList.add(session);

		Employee loginEmployee = (Employee) session.getAttributes().get("employee");

		String DMJson = new Gson().toJson(dmSrv.receiveDMList(loginEmployee.getEmp_no()));

		session.sendMessage(new TextMessage(DMJson));

		// super.afterConnectionEstablished(session);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		// super.handleTextMessage(session, message);
	}

	// 클라이언트와 연결을 끊었을 때 실행되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		// super.afterConnectionClosed(session, status);
	}

}
