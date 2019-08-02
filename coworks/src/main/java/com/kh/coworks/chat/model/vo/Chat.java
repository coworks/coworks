package com.kh.coworks.chat.model.vo;

import java.io.Serializable;
import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class Chat implements Serializable {

	private int chat_no;// 채팅 INDEX
	private int croom_no;// 채팅방 index
	private int chat_sendno;// 보낸사람 사번
	private String chat_content;// 내용
	private Timestamp chat_sendtime;// 보낸시간
	private String chat_isRead;// 읽기여부..?

	private String senderName;

	public Chat() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Chat(int chat_no, int croom_no, int chat_sendno, String chat_content, Timestamp chat_sendtime,
			String chat_isRead, String senderName) {
		super();
		this.chat_no = chat_no;
		this.croom_no = croom_no;
		this.chat_sendno = chat_sendno;
		this.chat_content = chat_content;
		this.chat_sendtime = chat_sendtime;
		this.chat_isRead = chat_isRead;
		this.senderName = senderName;
	}

	public int getChat_no() {
		return chat_no;
	}

	public void setChat_no(int chat_no) {
		this.chat_no = chat_no;
	}

	public int getCroom_no() {
		return croom_no;
	}

	public void setCroom_no(int croom_no) {
		this.croom_no = croom_no;
	}

	public int getChat_sendno() {
		return chat_sendno;
	}

	public void setChat_sendno(int chat_sendno) {
		this.chat_sendno = chat_sendno;
	}

	public String getChat_content() {
		return chat_content;
	}

	public void setChat_content(String chat_content) {
		this.chat_content = chat_content;
	}

	public Timestamp getChat_sendtime() {
		return chat_sendtime;
	}

	public void setChat_sendtime(Timestamp chat_sendtime) {
		this.chat_sendtime = chat_sendtime;
	}

	public String getChat_isRead() {
		return chat_isRead;
	}

	public void setChat_isRead(String chat_isRead) {
		this.chat_isRead = chat_isRead;
	}

	public String getSenderName() {
		return senderName;
	}

	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}

	@Override
	public String toString() {
		return "Chat [chat_no=" + chat_no + ", croom_no=" + croom_no + ", chat_sendno=" + chat_sendno
				+ ", chat_content=" + chat_content + ", chat_sendtime=" + chat_sendtime + ", chat_isRead=" + chat_isRead
				+ ", senderName=" + senderName + "]";
	}

}
