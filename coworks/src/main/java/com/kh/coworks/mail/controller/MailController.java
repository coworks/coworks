package com.kh.coworks.mail.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.mail.Address;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpSession;

import org.apache.tools.ant.types.CommandlineJava.SysProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.coworks.employee.model.vo.Employee;
import com.kh.coworks.mail.model.service.MailService;
import com.kh.coworks.mail.model.vo.Mail;
import com.kh.coworks.mail.model.vo.MailAttach;

@Controller
public class MailController {

	MailSetting mailSetting = new MailSetting();
	MailSetting mailReceive = new MailSetting();

	@Autowired
	MailService mailService;
	@RequestMapping("/mail/app-mail.do")
	public String selectInnerMail(Model model){
		
		int cPage = 1;//mailService.selectMaildTotalContents();
		int limit = 10;
		List<Map<String, String>> mails = mailService.selectMailList(cPage, limit);
		
		// 이너 메일 조회
		model.addAttribute("mails", mails);//.addAttribute("emp", emp);
		return "mail/app-email";
		
	}
		

	@RequestMapping("/mail/app-email.do")
	public String receiveEmail(Model model) {

		ArrayList<Mail> mails = new ArrayList<>();
		Mail mail;
		/*------------------------------------*/
		Employee emp = new Employee();
		emp.setEmp_email("mail_0318@naver.com");
		emp.setEmp_email_password("*cjfjas2");
		emp.setEmp_name("안현지");
		/*------------------------------------*/

		try {

			Message[] messages = mailSetting.receiveSetting();
			System.out.println("messages.length---" + messages.length);
			for (Message message : messages) {
				mail = new Mail();
				Address[] address = message.getFrom();
				InternetAddress ar = (InternetAddress) address[0];
				mail.setMail_no(message.getMessageNumber());
				mail.setMail_sendDate(new Timestamp(message.getSentDate().getTime()));
				mail.setMail_content(getTextFromMessage(message));
				mail.setMail_from(ar.getAddress());
				mail.setMail_subject(message.getSubject());
				mails.add(mail);
				System.out.println("---------------------------------");
				System.out.println("Subject: " + message.getSubject());
				System.out.println("getContentType : " + message.getContentType());
				System.out.println("From: " + ar.getAddress());
				System.out.println("Date: " + message.getHeader("Date")[0]);
				System.out.println("Body: " + getTextFromMessage(message));
			}
		} catch (NoSuchProviderException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		model.addAttribute("mails", mails).addAttribute("emp", emp);
		return "mail/app-email";
	}

	public static String getTextFromMessage(Message message) throws MessagingException, IOException {
		String result = "";
		if (message.isMimeType("text/plain")) {
			result = message.getContent().toString();
		} else if (message.isMimeType("multipart/*")) {
			MimeMultipart mimeMultipart = (MimeMultipart) message.getContent();
			result = getTextFromMimeMultipart(mimeMultipart);
		}
		return result;
	}

	public static String getTextFromMimeMultipart(MimeMultipart mimeMultipart) throws MessagingException, IOException {
		String result = "";
		int count = mimeMultipart.getCount();
		for (int i = 0; i < count; i++) {
			BodyPart bodyPart = mimeMultipart.getBodyPart(i);
			if (bodyPart.isMimeType("text/plain")) {
				result = result + "\n" + bodyPart.getContent();
				break; // without break same text appears twice in my tests
			} else if (bodyPart.isMimeType("text/html")) {
				String html = (String) bodyPart.getContent();
//				result = result + "\n" + org.jsoup.Jsoup.parse(html).text();
			} else if (bodyPart.getContent() instanceof MimeMultipart) {
				result = result + getTextFromMimeMultipart((MimeMultipart) bodyPart.getContent());
			}
		}
		return result;
	}

	@RequestMapping("/mail/app-compose.do")
	public String writeMail() {
		return "mail/app-compose";
	}

//	@ResponseBody
	@RequestMapping(value = "/mail/selectOneMail.do/{mail_no}" ,method = RequestMethod.GET)
	public String selectOneMail( Model model,
			HttpSession session , @PathVariable("mail_no")int mail_no ) {
		Mail mail = mailService.selectOneMail(mail_no);
		
		model.addAttribute("mail",mail);
		// 객체가 넘어오지 않음 mail 로 받아 오면 안된다.. 해결법 필요
//		model.addAttribute(attributeValue)
		return "mail/app-email-detail";
	}
	
	
	@RequestMapping("/mail/mailFormEnd.do")
	public String mailFormEnd(Mail mail, Model model, HttpSession session,
			@RequestParam(value = "upFile", required = false) MultipartFile[] upFile) {
		String saveDir = session.getServletContext().getRealPath("/resources/mail/attach");
		System.out.println("파일 길이 " + upFile.length);
		List<MailAttach> list = new ArrayList<>();

		if (new File(saveDir).exists()) {

			// 3. 파일 업로드 시작
			for (MultipartFile f : upFile) {

				if (!f.isEmpty()) {
					// 원본 이름 가져오기
					String originalName = f.getOriginalFilename();
					String ext = originalName.substring(originalName.lastIndexOf(".") + 1);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");

					int rndNum = (int) (Math.random() * 1000);

					// 서버에 저장하여 관리할 이름
					String renamedName = sdf.format(new Date()) + "_" + rndNum + "." + ext;
					// sample.png --> 2019718_145400_123.png

					// 파일 저장
					try {

						f.transferTo(new File(saveDir + "/" + renamedName));

					} catch (IllegalStateException | IOException e) {

						e.printStackTrace();

					}

					MailAttach at = new MailAttach();
					at.setAttach_oriname(originalName);
					at.setAttach_rename(renamedName);

					list.add(at);
				}
			}
		}
		int result = 0;
		Employee emp = new Employee();
		emp.setEmp_email("mail_0318@naver.com");
		mail.setMail_from(emp.getEmp_email());
		
		result = mailService.mailFormEnd(mail, list);
		System.out.println("list size " + list.size());

		String loc = "/mail/app-mail.do";
		String msg = "";
		if (result > 0) {
			sendingMail(mail, model, session, upFile);
			msg = "등록 성공!";
		} else {
			msg = "메일 전송 실패!";
		}

		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "redirect:app-mail.do";
	}

//	@RequestMapping("/mail/app-img-delete.do")
//	public String deleteImg() {
//		return "redirect:app-email.do";
//	}

	
	@RequestMapping("/mail/sendingMail.do")
	public void sendingMail(Mail mail, Model model, HttpSession session,
			@RequestParam(value = "upFiles", required = false) MultipartFile[] upFile) {
		/*------------------------------------*/
		Employee emp = new Employee();

		MimeMessage msg = mailSetting.sendingSetting();
		try {
			msg.setSentDate(new Date());

			msg.setFrom(new InternetAddress(mail.getMail_to_email()));
			InternetAddress to = new InternetAddress(mail.getMail_to_email());
			msg.setRecipient(Message.RecipientType.TO, to);
			msg.setSubject(mail.getMail_subject(), "UTF-8");
			msg.setText(mail.getMail_content(), "UTF-8");
			if (msg != null)
				Transport.send(msg);
		} catch (AddressException ae) {
			System.out.println("AddressException : " + ae.getMessage());
		} catch (MessagingException me) {
			System.out.println("MessageException : " + me.getMessage());
			me.printStackTrace();
			// 메일 계정 인증 관련 예외 처리
		}

	}
}
