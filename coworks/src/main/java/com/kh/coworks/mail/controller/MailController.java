package com.kh.coworks.mail.controller;

import java.awt.FileDialog;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.activation.FileDataSource;
import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.NoSuchProviderException;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tools.ant.types.CommandlineJava.SysProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.coworks.common.util.Utils;
import com.kh.coworks.employee.model.service.EmployeeService;
import com.kh.coworks.employee.model.vo.Employee;
import com.kh.coworks.mail.model.service.MailService;
import com.kh.coworks.mail.model.vo.Mail;
import com.kh.coworks.mail.model.vo.MailAttach;

@Controller
public class MailController {

	MailSetting mailSetting = new MailSetting();
	MailSetting mailReceive = new MailSetting();
	ArrayList<Mail> mailList = new ArrayList<>();
	int remain;

	@Autowired
	MailService mailService;
	@Autowired
	EmployeeService employeeService;

//	@RequestMapping("/mail/sendingMailMulti.do")
//	public void sendingMailMulti(Mail mail, Model model, List<MailAttach> list, HttpServletRequest request,
//			HttpSession session) {
//		String saveDir = session.getServletContext().getRealPath("/resources/mail/attach");
//
//		try {
//			EmailAttachment attachment = new EmailAttachment();
//			attachment.setURL(new URL("https://www.bloter.net/wp-content/uploads/2016/08/%EC%8A%A4%EB%A7%88%ED%8A%B8%ED%8F%B0-%EC%82%AC%EC%A7%84.jpg"));
//			attachment.setDisposition(EmailAttachment.ATTACHMENT);
//			attachment.setDescription("test");
//			attachment.setName(list.get(0).getAttach_rename());
//
//			MultiPartEmail email = new MultiPartEmail();
//			email.addTo("mail_0318@naver.com");
//			email.setFrom("Testing <test@test.com>");
//			email.setSubject("Testing email");
//			email.attach(attachment);
//			email.setMsg("test email");
//			email.send();
//		} catch (EmailException ex) {
//			System.out.println(ex.getMessage());
//		} catch (MalformedURLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//	}

	@RequestMapping("/mail/sendingMail.do")
	public void sendingMail(Mail mail, Model model, List<MailAttach> list, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Employee emp = (Employee) session.getAttribute("employee");

		MimeMessage msg = mailSetting.sendingSetting(request);
		try {

			// ----------------------------------------
			// ----------------------------------------
			msg.setSentDate(new Date());
			msg.setFrom(new InternetAddress(emp.getEmp_email(), "COWORKS : " + emp.getEmp_name()));
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
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/mail/reAuth.do")
	public String reAuth(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Employee emp = (Employee) session.getAttribute("employee");
		emp.setEmp_email(null);
		emp.setEmp_emailpassword(null);
		int result = employeeService.updateEmployee(emp);
		if (result > 0)
			session.setAttribute("employee", emp);
		return "mail/auth-check";
	}

	@RequestMapping("/mail/authCheck.do")
	public String authCheck(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Employee emp = (Employee) session.getAttribute("employee");

		if (emp.getEmp_email() == null || emp.getEmp_emailpassword() == null) {
			return "mail/auth-check";
		} else
			return "redirect:innerMail.do";
	}

	@RequestMapping(value = "/mail/authCheckEnd.do", method = RequestMethod.POST)
	@ResponseBody
	public int authCheckEnd(@RequestParam("emp_email") String emp_email,
			@RequestParam("emp_emailpassword") String emp_emailpassword) {

		MimeMessage msg = null;
		msg = //mailSetting.sendingSetting(emp_email, emp_emailpassword);
				new MailSetting().sendingSetting(emp_email, emp_emailpassword);
		Message[] msgr = null;

		try {
			msgr = //mailSetting.receiveSetting(emp_email,emp_emailpassword);
					new MailSetting().receiveSetting(emp_email,emp_emailpassword);
		} catch (MessagingException e1) {
			e1.printStackTrace();
			System.out.println("받은 메일");
			return 99999;
		}

		System.out.println(emp_email);
		System.out.println(emp_emailpassword);
		int rnd = (int) (Math.random() * 1000);
		System.out.println("random : " + rnd);
		try {
			msg.setSentDate(new Date());
			msg.setFrom(new InternetAddress(emp_email,"COWORKS"));
			InternetAddress to = new InternetAddress(emp_email);
			msg.setRecipient(Message.RecipientType.TO, to);
			msg.setSubject("coworks 이메일 인증 메일입니다", "UTF-8");
			msg.setText("해당 값을 입력해주세요 : " + rnd, "UTF-8");
			if (msg != null) {
				Transport.send(msg,emp_email,emp_emailpassword);
				}
		} catch (MessagingException e) {
			System.out.println("보낸 메일");
			e.printStackTrace();
			return 99999;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return rnd;
	}

	@RequestMapping("/mail/saveEmail.do")
	public String saveEmail(@RequestParam("emp_email") String emp_email,
			@RequestParam("emp_emailpassword") String emp_emailpassword, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Employee emp = (Employee) session.getAttribute("employee");
		emp.setEmp_email(emp_email);
		emp.setEmp_emailpassword(emp_emailpassword);
		int result = mailService.updateEmail(emp);
		if (result > 0)
			System.out.println("emp email 등록 성공");
		else
			System.out.println("실패");
		return "redirect:innerMail.do";
	}

	@RequestMapping("/mail/innerMail.do") // 내부 메일 조회
	public String selectInnerMail(Model model,
			@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		Employee emp = (Employee) session.getAttribute("employee");
		int limit = 10;

		List<Map<String, String>> mails = mailService.selectReceiveMailList(cPage, limit, emp.getEmp_email());
		int totalContents = mailService.selectReceiveMailTotalContents();
		// 이너 메일 조회

		String pageBar = Utils.getPageBar(totalContents, cPage, limit, "innerMail.do");

		model.addAttribute("mails", mails).addAttribute("totalContents", totalContents)
				.addAttribute("numPerPage", limit).addAttribute("pageBar", pageBar).addAttribute("type", "mail");

		// .addAttribute("emp", emp);
		return "mail/app-mail";

	}

	@RequestMapping("/mail/deleteMail.do") // 휴지통 보기
	public String selectDeleteMail(Model model,
			@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			HttpServletRequest request) {

		HttpSession session = request.getSession();
		Employee emp = (Employee) session.getAttribute("employee");
		int limit = 10;

		List<Map<String, String>> mails = mailService.selectDeleteMailList(cPage, limit, emp.getEmp_email());
		int totalContents = mailService.selectDeleteMailTotalContents();
		// 이너 메일 조회

		String pageBar = Utils.getPageBar(totalContents, cPage, limit, "innerMail.do");

		model.addAttribute("mails", mails).addAttribute("totalContents", totalContents)
				.addAttribute("numPerPage", limit).addAttribute("pageBar", pageBar).addAttribute("type", "mail");
		return "mail/app-mail";
	}

	@RequestMapping("/mail/readCount") // 안읽은 메일 개수
	public String readCount(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Employee emp = (Employee) session.getAttribute("employee");
		System.out.println("readCount");
		System.out.println(mailService.readCount(emp.getEmp_email()));
		model.addAttribute("readCount", mailService.readCount(emp.getEmp_email()));
		return "mail/mail-common";
	}

	@RequestMapping("/mail/outerMail.do") // 외부 메일 조회
	public String selectOuterMail(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Employee emp = (Employee) session.getAttribute("employee");
		Mail mail;

		try {

			Message[] messages = mailSetting.receiveSetting(request);
			System.out.println("messages.length---" + messages.length);
			remain = messages.length - 15;
			int count = 0;
			System.out.println("remain : " + remain);
			System.out.println("message size : " + messages.length);
			System.out.println("mailList L " + mailList.size());
			if ((remain + mailList.size()) != messages.length) {
				mailList = new ArrayList<>();
				for (int i = messages.length - 1; i > remain; i--) {
					mail = new Mail();
					Address[] address = messages[i].getFrom();
					InternetAddress ar = (InternetAddress) address[0];
					mail.setMail_no(count++/* messages[i].getMessageNumber() - 1 */);
					mail.setMail_sendDate(new Timestamp(messages[i].getSentDate().getTime()));
					System.out.println("메일 받은 시간 " + mail.getMail_sendDate());
					mail.setMail_content(getTextFromMessage(messages[i]));
					mail.setMail_from_email(ar.getAddress());
					mail.setMail_to_email(emp.getEmp_email());
					mail.setMail_subject(messages[i].getSubject());
					mail.setMail_name(ar.getPersonal());
					mailList.add(mail);
				}
			}

//			
//			if (messages.length != mailList.size())
//				for (Message message : messages) {
//					mail = new Mail();
//					Address[] address = message.getFrom();
//					InternetAddress ar = (InternetAddress) address[0];
//					mail.setMail_no(message.getMessageNumber() - 1);
//					mail.setMail_sendDate(new Timestamp(message.getSentDate().getTime()));
//					System.out.println("메일 받은 시간 " + mail.getMail_sendDate());
//					mail.setMail_content(getTextFromMessage(message));
//					mail.setMail_from_email(ar.getAddress());
//					mail.setMail_to_email(emp.getEmp_email());
//					mail.setMail_subject(message.getSubject());
//					mail.setMail_name(ar.getPersonal());
//					mailList.add(mail);
//				}
		} catch (NoSuchProviderException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		model.addAttribute("mails", mailList).addAttribute("type", "email");
		return "mail/app-mail";
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

	@RequestMapping("/mail/sendMail.do") // 보낸 메일함
	public String sendMail(Model model, @RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			HttpServletRequest request) {

		HttpSession session = request.getSession();
		Employee emp = (Employee) session.getAttribute("employee");
		int limit = 10;

		List<Map<String, String>> mails = mailService.selectSendMailList(cPage, limit, emp.getEmp_email());
		int totalContents = mailService.selectSendMailTotalContents();
		// 이너 메일 조회

		String pageBar = Utils.getPageBar(totalContents, cPage, limit, "sendMail.do");

		model.addAttribute("mails", mails).addAttribute("totalContents", totalContents)
				.addAttribute("numPerPage", limit).addAttribute("pageBar", pageBar).addAttribute("type", "send");
		return "mail/app-mail";
	}

	@RequestMapping("/mail/app-compose.do") // 메일 작성 페이지로 이동
	public String writeMail() {
		return "mail/app-compose";
	}

	@RequestMapping(value = "/mail/selectOneMail.do/{mail_no}/{type}", method = RequestMethod.GET)
	public String selectOneMail(Model model, HttpSession session, @PathVariable("mail_no") int mail_no,
			@PathVariable("type") String type) {
		// 메일 상세보기
		if (type.equals("email")) {
			model.addAttribute("mail", mailList.get(mail_no)).addAttribute("type", type);
		} else {
			mailService.readMail(mail_no);
			model.addAttribute("mail", mailService.selectOneMail(mail_no))
					.addAttribute("attachList", mailService.selectMailAttachList(mail_no)).addAttribute("type", type);
			System.out.println(mailService.selectMailAttachList(mail_no));
		}
		return "mail/app-email-detail";
	}

	@RequestMapping("/mail/mailFormEnd.do")
	public String mailFormEnd(Mail mail, Model model,
			@RequestParam(value = "upFile", required = false) MultipartFile[] upFile, HttpServletRequest request) {
		// 메일 전송
		HttpSession session = request.getSession();
		Employee emp = (Employee) session.getAttribute("employee");
		String saveDir = session.getServletContext().getRealPath("/resources/mail/attach");
//		mail.setMail_name(emp.getEmp_name());
		if (mail.getMail_sendDate() == null)
			mail.setMail_sendDate(new Timestamp(new Date().getTime()));

		System.out.println("파일 길이 " + upFile.length);
		List<MailAttach> list = new ArrayList<>();
		String savePath = "";
		if (new File(saveDir).exists()) {
			for (MultipartFile f : upFile) {
				if (!f.isEmpty()) {
					String originalName = f.getOriginalFilename();
					String ext = originalName.substring(originalName.lastIndexOf(".") + 1);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
					int rndNum = (int) (Math.random() * 1000);
					String renamedName = sdf.format(new Date()) + "_" + rndNum + "." + ext;
					try {
						f.transferTo(new File(saveDir + "/" + renamedName));
						System.out.println(f.getName());
						System.out.println(saveDir + "/" + renamedName);
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
//					savePath = "resources/mail/attach";
					MailAttach at = new MailAttach();
					at.setAttach_path(saveDir);
					at.setAttach_oriname(originalName);
					at.setAttach_rename(renamedName);

					list.add(at);
				}
			}
		}
		int result = 0;
		System.out.println("mailFormEnd emp.getEmp_email " + emp.getEmp_email());
		System.out.println("mailFormEnd wqe : ");
		mail.setMail_from_email(emp.getEmp_email());

		result = mailService.mailFormEnd(mail, list);
		System.out.println("list size " + list.size());

		String loc = "/mail/innerMail.do";
		String msg = "";
		if (result > 0) {
			sendingMail(mail, model, list, request);
			msg = "등록 성공!";
		} else {
			msg = "메일 전송 실패!";
		}

//		model.addAttribute("loc", loc).addAttribute("msg", msg);

		return "redirect:innerMail.do";
	}

	@RequestMapping("/mail/readMail.do")
	public String readMail(@RequestBody String[] chkMails) {
		// 메일 읽기 표시
		if (chkMails != null)
			for (String no : chkMails) {
				int mail_no = Integer.parseInt(no);
				mailService.readMail(mail_no);
			}
		return "redirect:innerMail.do";
	}

	@RequestMapping("/mail/updateMark.do/{num}")
	public String updateMark(@RequestBody String[] chkMails, @PathVariable(value = "num") int num) {
		// mark 추가하기
		Mail mail;
		for (String no : chkMails) {
			mail = new Mail();
			int mail_no = Integer.parseInt(no);
			mail.setMail_no(mail_no);
			mail.setMail_mark(num);
			System.out.println("mail_no : " + mail_no);
			int result = mailService.updateMark(mail);
		}
		return "mail/app-mail";
	}

	@RequestMapping("/mail/updateStar.do/{value}")
	public String updateStar(@RequestBody String[] chkMails, @PathVariable(value = "value") String value) {
		// mark 추가하기
		Mail mail;
		for (String no : chkMails) {
			mail = new Mail();
			int mail_no = Integer.parseInt(no);
			mail.setMail_no(mail_no);
			mail.setMail_star(value);
			System.out.println("mail_no : " + mail_no);

			int result = mailService.updateStar(mail);
		}
		return "mail/app-mail";
	}

	@RequestMapping("/mail/selectStar.do")
	public String selectStar(Model model,
			@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			HttpServletRequest request) {
		// 마크별 메일 보기
		HttpSession session = request.getSession();
		Employee emp = (Employee) session.getAttribute("employee");
		int limit = 10;
		Mail mail = new Mail();
		mail.setMail_to_email(emp.getEmp_email());
		mail.setMail_star("Y");
		List<Map<String, String>> mails = mailService.selectStarMailList(cPage, limit, mail);
		int totalContents = mailService.selectStarMailTotalContents(mail);
		// 이너 메일 조회

		String pageBar = Utils.getPageBar(totalContents, cPage, limit, "innerMail.do");

		model.addAttribute("mails", mails).addAttribute("totalContents", totalContents)
				.addAttribute("numPerPage", limit).addAttribute("pageBar", pageBar).addAttribute("type", "mail");

		return "mail/app-mail";
	}

	@RequestMapping("/mail/selectMark.do/{num}")
	public String selectMark(Model model,
			@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage, HttpServletRequest request,
			@PathVariable("num") int num) {
		// 마크별 메일 보기
		HttpSession session = request.getSession();
		Employee emp = (Employee) session.getAttribute("employee");
		int limit = 10;
		Mail mail = new Mail();
		mail.setMail_to_email(emp.getEmp_email());
		mail.setMail_mark(num);
		List<Map<String, String>> mails = mailService.selectMarkMailList(cPage, limit, mail);
		int totalContents = mailService.selectMarkMailTotalContents(mail);
		// 이너 메일 조회

		String pageBar = Utils.getPageBar(totalContents, cPage, limit, "innerMail.do");

		model.addAttribute("mails", mails).addAttribute("totalContents", totalContents)
				.addAttribute("numPerPage", limit).addAttribute("pageBar", pageBar).addAttribute("type", "mail");

		return "mail/app-mail";
	}

	@RequestMapping(value = "/mail/deleteMail.do/{type}")
	public String deleteMail(@RequestBody String[] chkMails, @PathVariable("type") String type) {
		// 메일 휴지통으로 옮기기
		if (chkMails != null) {
			if (type.equals("mail")) {
				for (String no : chkMails) {
					int mail_no = Integer.parseInt(no);
					int result = mailService.deleteToMail(mail_no);
				}
			} else if (type.equals("send")) {
				for (String no : chkMails) {
					System.out.println("send mail delete");
					int mail_no = Integer.parseInt(no);
					int result = mailService.deleteFromMail(mail_no);
				}
			}
		}
		return "mail/app-mail";
	}

	@RequestMapping(value = "/mail/replyMail.do/{mail_no}/{type}")
	public String replyMail(Model model, @PathVariable("mail_no") int mail_no, @PathVariable("type") String type) {
		Mail mail;
		if (type != null) {
			if (type.equals("email")) {
				mail = mailList.get(mail_no);
			} else {
				mail = mailService.selectOneMail(mail_no);
			}
			model.addAttribute("mail", mail).addAttribute("type", "reply");
			System.out.println("mail. : " + mail);
		}

		return "mail/app-compose";
	}

	@RequestMapping(value = "/mail/forwardMail.do/{mail_no}/{type}")
	public String forwardMail(Model model, @PathVariable("mail_no") int mail_no, @PathVariable("type") String type) {

		Mail mail;
		if (type.equals("email")) {
			mail = mailList.get(mail_no);
		} else {
			mail = mailService.selectOneMail(mail_no);
		}
		model.addAttribute("mail", mail).addAttribute("type", "forward");
		System.out.println("mail. : " + mail);
		return "mail/app-compose";
	}

	@RequestMapping(value = "/mail/storeMail.do")
	public String storeMail(@RequestBody String[] chkMails) {
		// 외부에서 내부로 메일 저장하기
		System.out.println("Store Mail 실행중");
		System.out.println(chkMails.getClass());
		if (chkMails != null)
			for (String no : chkMails) {
				List list = new ArrayList<>(); // 나중에 리스트 추가하기
				int mail_no = Integer.parseInt(no);
				mailService.mailFormEnd(mailList.get(mail_no), list);
			}
		return "redirect:innerMail.do";
	}

}
