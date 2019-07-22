package com.kh.coworks.mail.controller;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MailAuth extends Authenticator {

	//javax.mail 의 주요 메소드는 Session, Message, Address, Authenticator, Transport
	// SMTP서버에 연결해 사용자 인증을 하기 위해선 Authenticator 클래스가 필요하다.
	
	PasswordAuthentication pa;
	
	public MailAuth() {
		String mail_id = "kyurin123@gmail.com";
		String mail_pw = "zizi1069";
		
		pa = new PasswordAuthentication(mail_id,mail_pw);
	}

	public PasswordAuthentication getPasswordAuthentication() {
		// Authenticator를 사용하기 위해선 PasswordAuthenticator 클래스로 부터 인스턴스를 생성하고
		// getPasswordAuthentication 메소드로 데이터를 리턴 받아와야 한다.
		// PasswordAuthentication 클래스는 사용자의 아이디와 패스워드를 입력받아 반환하도록 정의한다.
		
		
		
		return pa;
	}
	
}
