package com.kh.coworks.mail.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.coworks.employee.model.vo.Employee;
import com.kh.coworks.mail.model.vo.Mail;

@Controller
public class MailController {

//	@Autowired
//	MailService mailService;

	@RequestMapping("/mail/app-email.do")
	public String selectMail() {
		/*------------------------------------*/
		Employee emp = new Employee();
		emp.setEmp_email("mail_0318@naver.com");
		emp.setEmp_name("안현지");
		/*------------------------------------*/
		// 메일 조회 메소드

		Properties prop = System.getProperties();
		prop.put("mail.pop3.host", "pop.naver.com");
		prop.put("mail.pop3.port", "995");
		prop.put("mail.pop3.starttls.enable", "true");
		prop.put("mail.pop3.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		Session emailSession = Session.getDefaultInstance(prop, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(emp.getEmp_email(), "*cjfjas2");
			}
		});
		try {

			Store store = emailSession.getStore("pop3");
			store.connect("pop.naver.com", emp.getEmp_email(), "*cjfjas2");
			Folder emailFolder = store.getFolder("INBOX");
			emailFolder.open(Folder.READ_ONLY);

			Message[] messages = emailFolder.getMessages();
			System.out.println("messages.length---" + messages.length);
			// loength 말고 1개로 받아서 들어오는건 바로바로 db에 저장하는식으로 하던가 해야겠다.
			for(Message message : messages) {
			    Address[] address = message.getFrom();
			    InternetAddress ar = (InternetAddress)address[0];
				System.out.println("---------------------------------");
				System.out.println("messageNumber : " + message.getMessageNumber());
				System.out.println("Subject: " + message.getSubject());
				System.out.println("messageNumber : " + message.getMessageNumber());
				System.out.println("getContentType : " + message.getContentType());
//				(message.setFrom(), "UTF-8");
				System.out.println("From: " + ar.getAddress());
				System.out.println("Date: " + message.getHeader("Date")[0]);
				System.out.println("Body: " + getTextFromMessage(message));
			}
				/*
				 * emailFolder.close(false); store.close();
				 */
		} catch (NoSuchProviderException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

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

	@RequestMapping("/mail/app-email-detail.do")
	public String selectOneMail() {

		return "mail/app-email-detail";
	}
	/*
	 * @RequestMapping("/mail/app-img-upload.do") public String imgUpload() {
	 * 
	 * private List<File> file; private List<String> fileContentType; private
	 * List<String> fileFileName;
	 * 
	 * System.out.println("Inside Image upload ");
	 * System.out.print("\n\n---------------------------------------\n"); int i = 0;
	 * for (File f : file) { System.out.print("\nFile [" + i + "] ");
	 * System.out.print(" length: " + f.length()); System.out.print(" name:" +
	 * f.getFileFileName().get(i)); System.out.print(" contentType: " +
	 * getFileContentType().get(i));
	 * 
	 * i++; } System.out.println("\n---------------------------------------\n");
	 * 
	 * // getter setter return "mail/app-compose"; }
	 */

	@RequestMapping("/mail/app-img-upload.do")
	public String imgUpload() {
		return "mail/app-componse";
	}
	/*
	 * @RequestMapping("/mail/sendingMail") public String sendingMail(Mail mail,
	 * Model model, HttpSession session,
	 * 
	 * @RequestParam(value = "file", required = false) MultipartFile[] upFile) {
	 * String saveDir =
	 * session.getServletContext().getRealPath("/resources/mail/mailAttachment");
	 * 
	 * List<MailAttach> list = new ArrayList<>();
	 * 
	 * if(new File(saveDir).exists()) {
	 * 
	 * for(MultipartFile f : upFile) { if(!f.isEmpty()) { String originalName =
	 * f.getOriginalFilename(); String ext =
	 * originalName.substring(originalName.lastIndexOf(".")+1); SimpleDateFormat sdf
	 * = new SimpleDateFormat("yyyyMMdd_HHmmss"); int rndNum =
	 * (int)(Math.random()*1000);
	 * 
	 * String renamedName = sdf.format(new Date())+"_"+rndNum+"."+ext;
	 * 
	 * try { f.transferTo(new File(saveDir +"/"+renamedName));
	 * }catch(IllegalStateException | IOException e) { e.printStackTrace(); }
	 * MailAttach mat = new MailAttach(); mat.setAttach_rename(renamedName);
	 * mat.setAttach_oriname(originalName); list.add(mat); } } }
	 * 
	 * int result ; result = mailService.sendingMail(mail,list); String loc =
	 * "/mail/app-mail.do"; String msg=""; if(result > 0) msg = "전송 성공"; else msg =
	 * "전송 실패";
	 * 
	 * model.addAttribute("loc",loc).addAttribute("msg",msg);
	 * 
	 * return "mail/app-email.do"; }
	 */

	@RequestMapping("/mail/sendingMail.do")
	public String sendingMail(Mail mail, Model model, HttpSession session,
			@RequestParam(value = "file", required = false) MultipartFile[] upFile) throws AddressException {
		/*------------------------------------*/
		Employee emp = new Employee();
		emp.setEmp_email("mail_0318@naver.com");
		emp.setEmp_name("안현지");
		/*------------------------------------*/

		System.out.println("sending mail 실행");
		Properties prop = System.getProperties();
		prop.put("mail.smtp.starttls.enabled", "true");
		// 로그인시 TLS 사용 여부
		prop.put("mail.smtp.host", "smtp.gmail.com");
		// 이메일 발송 처리 SMTP
		prop.put("mail.smtp.auth", "true");
		// SMTP 서버의 인증을 사용
		prop.put("mail.smtp.prot", "587");
		// TLS 의 포트번호는 587 // SSL 은 465
		prop.put("mail.smtp.starttls.required", "true");

//		prop.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLScoketFactory");
//		prop.put("mail.smtp.socketFactory.fallback","false");
//		prop.put("mail.smtp.socketFactory.prot","587");

		Authenticator auth = new MailAuth();

		Session psession = Session.getDefaultInstance(prop, auth);
		MimeMessage msg = new MimeMessage(psession);

		try {
			msg.setSentDate(new Date());

			msg.setFrom(new InternetAddress(emp.getEmp_email(), emp.getEmp_name()));

			InternetAddress to = new InternetAddress(mail.getMail_to_email());

			msg.setRecipient(Message.RecipientType.TO, to);
			msg.setSubject(mail.getMail_subject(), "UTF-8");
			msg.setText(mail.getMail_content(), "UTF-8");

			Transport.send(msg);
		} catch (AddressException ae) {
			System.out.println("AddressException : " + ae.getMessage());
		} catch (MessagingException me) {
			System.out.println("MessageException : " + me.getMessage());
			// 메일 계정 인증 관련 예외 처리
		} catch (UnsupportedEncodingException e) {
			System.out.println("UnsupportedEncodingException : " + e.getMessage());
			// 지원하지 않는 인코딩의 경우 에러 처리
		}
		return "redirect:app-email.do";

	}
}
