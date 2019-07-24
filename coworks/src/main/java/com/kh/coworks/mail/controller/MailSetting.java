package com.kh.coworks.mail.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.kh.coworks.employee.model.vo.Employee;

public class MailSetting {

	public Message[] receiveSetting() {

		String host="";

		System.out.println("receve " + host);
		Message[] messages = null;
		Employee emp = new Employee();
		emp.setEmp_email("stillda@naver.com");
		emp.setEmp_email_password("tmaneldy28");
		emp.setEmp_name("안현지");
		Authenticator auth = new MailAuth();
		Properties prop = System.getProperties();

		
		host = emp.getEmp_email().substring(emp.getEmp_email().lastIndexOf("@")+1);
		host = "pop."+host;
		System.out.println("receve "   + host);
		
		prop.put("mail.pop3.host", host);
		prop.put("mail.pop3.port", "995");
		prop.put("mail.pop3.starttls.enable", "true");
		prop.put("mail.pop3.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		Session emailSession = Session.getDefaultInstance(prop, auth);
		
		try {
			Store store = emailSession.getStore("pop3");
			store.connect(host, emp.getEmp_email(), emp.getEmp_email_password());
			Folder emailFolder = store.getFolder("INBOX");
			emailFolder.open(Folder.READ_ONLY);
			messages = emailFolder.getMessages();
			System.out.println(messages[0].getContent());
		} catch (MessagingException | IOException e) {
			e.printStackTrace();
		}
		return messages;
	}

	public MimeMessage sendingSetting() {

		String host ="";
		System.out.println("host L " +host);

		Authenticator auth = new MailAuth();
		Employee emp = new Employee();
		emp.setEmp_email("stillda@naver.com");
		emp.setEmp_name("안현민");
		host = emp.getEmp_email().substring(emp.getEmp_email().lastIndexOf("@")+1);
		host = "smtp."+host;
		System.out.println("host sending mail"+host);
		System.out.println("sending mail 실행");
		Properties prop = System.getProperties();
		prop.put("mail.smtp.starttls.enabled", "true");
		// 로그인시 TLS 사용 여부
		prop.put("mail.smtp.host", host);
		// 이메일 발송 처리 SMTP
		prop.put("mail.smtp.auth", "true");
		// SMTP 서버의 인증을 사용
		prop.put("mail.smtp.port", "587");
		// TLS 의 포트번호는 587 // SSL 은 465
		prop.put("mail.smtp.starttls.required", "true");

		System.out.println("h "+host);
		System.out.println("a "+auth);
		Session psession = Session.getDefaultInstance(prop, auth);
		MimeMessage msg = new MimeMessage(psession);
	
		return msg;
	}
	
}
