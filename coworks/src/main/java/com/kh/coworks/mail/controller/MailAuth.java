package com.kh.coworks.mail.controller;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.kh.coworks.employee.model.vo.Employee;

public class MailAuth extends Authenticator {

	//javax.mail 의 주요 메소드는 Session, Message, Address, Authenticator, Transport
	// SMTP서버에 연결해 사용자 인증을 하기 위해선 Authenticator 클래스가 필요하다.
	
	PasswordAuthentication pa  ;

	
	public MailAuth(HttpServletRequest request) {
		HttpSession session=request.getSession();
	    Employee emp=(Employee) session.getAttribute("employee");
	    
//		emp.setEmp_email("mail_0318@naver.com");
//		emp.setEmp_emailpassword("*cjfjas2");
		String mail_id = emp.getEmp_email();
		String mail_pw = emp.getEmp_emailpassword();
		
		 pa = new PasswordAuthentication(mail_id,mail_pw);
	}
	
	public MailAuth(String mail_id, String mail_pw) {
		pa = new PasswordAuthentication(mail_id,mail_pw);
	}


	public PasswordAuthentication getPasswordAuthentication() {
		// Authenticator를 사용하기 위해선 PasswordAuthenticator 클래스로 부터 인스턴스를 생성하고
		// getPasswordAuthentication 메소드로 데이터를 리턴 받아와야 한다.
		// PasswordAuthentication 클래스는 사용자의 아이디와 패스워드를 입력받아 반환하도록 정의한다.
		
		return pa;
	}
	
}
