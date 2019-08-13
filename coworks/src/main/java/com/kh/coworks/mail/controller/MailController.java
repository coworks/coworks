package com.kh.coworks.mail.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Address;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.NoSuchProviderException;
import javax.mail.Part;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.tomcat.util.codec.binary.Base64;
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

	@RequestMapping("/mail/sendingMail.do")
	public void sendingMail(Mail mail, Model model, List<MailAttach> list, HttpServletRequest request,
			List<MailAttach> maList) {
		HttpSession session = request.getSession();
		Employee emp = (Employee) session.getAttribute("employee");

		MimeMessage msg = mailSetting.sendingSetting(request);

		try {

			msg.setSentDate(new Date());
			msg.setFrom(new InternetAddress(emp.getEmp_email(), "COWORKS : " + emp.getEmp_name()));
			InternetAddress to = new InternetAddress(mail.getMail_to_email());
			msg.setRecipient(Message.RecipientType.TO, to);
			msg.setSubject(mail.getMail_subject(), "UTF-8");

			// ---------------------첨부--------------------------
			MimeBodyPart messageBodyPart = null;
			;
			MimeBodyPart textBodyPart = new MimeBodyPart();

			Multipart multipart = new MimeMultipart();

			textBodyPart.setContent(mail.getMail_content(), "text/html;charset=UTF-8");
			for (MailAttach ma : maList) {
				messageBodyPart = new MimeBodyPart();
				String fileName = ma.getAttach_rename();
				String file = session.getServletContext().getRealPath("/resources/mail/attach/" + fileName);
				DataSource source = new FileDataSource(file);
				messageBodyPart.setDataHandler(new DataHandler(source));
				messageBodyPart.setFileName(ma.getAttach_oriname());

				multipart.addBodyPart(messageBodyPart);
			}
			multipart.addBodyPart(textBodyPart);

			msg.setContent(multipart, "text/html;charset=UTF-8");

			// ----------------------첨부 끝-------------------------

			if (msg != null)
				Transport.send(msg, emp.getEmp_email(), emp.getEmp_emailpassword());
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
		msg = new MailSetting().sendingSetting(emp_email, emp_emailpassword);
		Message[] msgr = null;

		try {
			msgr = new MailSetting().receiveSetting(emp_email, emp_emailpassword);
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
			msg.setFrom(new InternetAddress(emp_email, "COWORKS"));
			InternetAddress to = new InternetAddress(emp_email);
			msg.setRecipient(Message.RecipientType.TO, to);
			msg.setSubject("coworks 이메일 인증 메일입니다", "UTF-8");
			msg.setText("해당 값을 입력해주세요 : " + rnd, "UTF-8");
			if (msg != null) {
				Transport.send(msg, emp_email, emp_emailpassword);
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

		List<Mail> mails = mailService.selectReceiveMailList(cPage, limit, emp.getEmp_email());
		
		int totalContents = mailService.selectReceiveMailTotalContents(emp.getEmp_email());
		System.out.println("count : "+totalContents);
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

		List<Mail> mails = mailService.selectDeleteMailList(cPage, limit, emp.getEmp_email());
		int totalContents = mailService.selectDeleteMailTotalContents(emp.getEmp_email());
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

	// ---------------------------------------
	public List<InputStream> getAttachments(Message message) throws Exception {
		Object content = message.getContent();
		if (content instanceof String)
			return null;

		if (content instanceof Multipart) {
			Multipart multipart = (Multipart) content;
			List<InputStream> result = new ArrayList<InputStream>();

			for (int i = 0; i < multipart.getCount(); i++) {
				result.addAll(getAttachments(multipart.getBodyPart(i)));
			}
			return result;

		}
		return null;
	}

	private List<InputStream> getAttachments(BodyPart part) throws Exception {
		List<InputStream> result = new ArrayList<InputStream>();
		Object content = part.getContent();
		if (content instanceof InputStream || content instanceof String) {
			if (Part.ATTACHMENT.equalsIgnoreCase(part.getDisposition()) || StringUtils.isNotBlank(part.getFileName())) {
				result.add(part.getInputStream());
				return result;
			} else {
				return new ArrayList<InputStream>();
			}
		}

		if (content instanceof Multipart) {
			Multipart multipart = (Multipart) content;
			for (int i = 0; i < multipart.getCount(); i++) {
				BodyPart bodyPart = multipart.getBodyPart(i);
				result.addAll(getAttachments(bodyPart));
			}
		}
		return result;
	}

	// --------------------------------------
	@RequestMapping("/mail/outerMail.do") // 외부 메일 조회
	public String selectOuterMail(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Employee emp = (Employee) session.getAttribute("employee");
		Mail mail;
		try {

			// -------------------첨부---------------------
			List<File> attachments = new ArrayList<File>();
			// -------------------첨부끝------------------
			Message[] messages = mailSetting.receiveSetting(request);
			System.out.println("messages.length---" + messages.length);
			remain = messages.length - 15;
			int count = 0;
			System.out.println("ms size: "+messages.length);
			if ((remain + mailList.size()) != messages.length) {
				mailList = new ArrayList<>();
				for (int i = messages.length - 1; i > remain; i--) {
				
					mail = new Mail();
					Address[] address = messages[i].getFrom();
					InternetAddress ar = (InternetAddress) address[0];
					mail.setMail_no(count++/* messages[i].getMessageNumber() - 1 */);
					System.out.println(messages[i].getSentDate().getTime());
					System.out.println(new Timestamp(messages[i].getSentDate().getTime()));
					mail.setMail_sendDate(new Timestamp(messages[i].getSentDate().getTime()));
					System.out.println("메일 받은 시간 " + mail.getMail_sendDate());

					mail.setMail_content(new String(messages[i].getContent().toString().getBytes("UTF-8")));
					mail.setMail_from_email(ar.getAddress());
					mail.setMail_to_email(emp.getEmp_email());
					mail.setMail_subject(messages[i].getSubject());
					mail.setMail_name(ar.getPersonal());
					mailList.add(mail);
					// ----------------------------
					String contentType = messages[i].getContentType();
					String attachFiles = "";
					String messageContent = "";
					String saveDir = "";
					String fileName = "";

				}
			}
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

	@RequestMapping("/mail/sendMail.do") // 보낸 메일함
	public String sendMail(Model model, @RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			HttpServletRequest request) {

		HttpSession session = request.getSession();
		Employee emp = (Employee) session.getAttribute("employee");
		int limit = 10;

		List<Mail> mails = mailService.selectSendMailList(cPage, limit, emp.getEmp_email());
		int totalContents = mailService.selectSendMailTotalContents(emp.getEmp_email());
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
			HttpServletRequest request, @PathVariable("type") String type) {
		// 메일 상세보기

		if (type.equals("email")) {
			List<MailAttach> attachments = null;
			Message[] temp = mailSetting.receiveSetting(request);
			int len = temp.length;
			attachments = attachMailCheck(temp[len - mail_no - 1], mail_no, request);
			model.addAttribute("mail", mailList.get(mail_no)).addAttribute("type", type).addAttribute("attachList",
					attachments);

		} else {
			mailService.readMail(mail_no);
			model.addAttribute("mail", mailService.selectOneMail(mail_no))
					.addAttribute("attachList", mailService.selectMailAttachList(mail_no)).addAttribute("type", type);
			System.out.println(mailService.selectMailAttachList(mail_no));
		}
		return "mail/app-email-detail";
	}

	public List<MailAttach> attachMailCheck(Message message, int mail_no, HttpServletRequest request) {
		List<MailAttach> attachments = new ArrayList<MailAttach>();
		try {
			Object obj = (Object) message.getContent();
			MimeMultipart multipart = null;
			if (obj instanceof Multipart) {
				multipart = (MimeMultipart) obj;
			}

			System.out.println("1 "+multipart.getContentType());
			System.out.println("2 "+multipart.getContentType());
			if (multipart != null)
				for (int i = 0; i < multipart.getCount(); i++) {
					BodyPart bodyPart = multipart.getBodyPart(i);
					if (!Part.ATTACHMENT.equalsIgnoreCase(bodyPart.getDisposition())
							&& StringUtils.isBlank(bodyPart.getFileName())) {
						if(bodyPart.isMimeType("multipart/alternative")) {
							// alternative 형 처리
							Object bpObj = bodyPart.getContent().getClass();
							System.out.println(" : "+bpObj);
							
							// 
						}else {
							// 그냥 text 형
							System.out.println("bodypart.getContent() : "+bodyPart.getContent().toString());
							System.out.println("type : "+bodyPart.getContentType());
							mailList.get(mail_no).setMail_content(bodyPart.getContent().toString()); //bodyPart.getContent().toString()
						}
						continue;
					}
					String filename=bodyPart.getFileName();
					String name ="";
					System.out.println(bodyPart.getContentType());
					System.out.println(filename.substring(0,10));
					if(filename.substring(0,10).equals("=?utf-8?B?")) {
						name = new String(Base64.decodeBase64(filename.substring(10)));
						System.out.println("alter : "+name);
					}else {
						name = filename.toString();
					}
					System.out.println("contentType : " + bodyPart.getContentType());
					InputStream is = bodyPart.getInputStream();
					String path = request.getSession().getServletContext()
							.getRealPath("/resources/mail/receiveattach/");
					System.out.println("path "  + path);
					File file = new File(path + name);
					System.out.println(file.getPath());
					FileOutputStream fos = new FileOutputStream(file);
					byte[] buf = new byte[4096];
					int byteRead;
					while ((byteRead = is.read(buf)) != -1) {
						fos.write(buf, 0, byteRead);
					}
					fos.close();

					MailAttach ma = new MailAttach();
					ma.setAttach_oriname(file.getName());
					ma.setAttach_rename(file.getName());
					ma.setAttach_path("/resources/mail/receiveattach");
					attachments.add(ma);
				}

		} catch (IOException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return attachments;

	}

	@RequestMapping("/mail/mailFormEnd.do")
	public String mailFormEnd(Mail mail, Model model,
			@RequestParam(value = "upFile", required = false) MultipartFile[] upFile, HttpServletRequest request) {
		// 메일 전송
		HttpSession session = request.getSession();
		Employee emp = (Employee) session.getAttribute("employee");
		String savePath = "/resources/mail/attach";
		String saveDir = session.getServletContext().getRealPath(savePath);
		if (mail.getMail_sendDate() == null)
			mail.setMail_sendDate(new Timestamp(new Date().getTime()));

		System.out.println("파일 길이 " + upFile.length);
		List<MailAttach> list = new ArrayList<>();
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

					MailAttach at = new MailAttach();
					at.setAttach_path(savePath);
					at.setAttach_oriname(originalName);
					at.setAttach_rename(renamedName);

					list.add(at);
				}
			}
		}
		int result = 0;
		mail.setMail_from_email(emp.getEmp_email());
		mail.setMail_name("COWORKS : " + emp.getEmp_name());
		result = mailService.mailFormEnd(mail, list);

		String loc = "/mail/innerMail.do";
		String msg = "";
		if (result > 0) {
			sendingMail(mail, model, list, request, list);
			msg = "등록 성공!";
		} else {
			msg = "메일 전송 실패!";
		}

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
		List<Mail> mails = mailService.selectStarMailList(cPage, limit, mail);
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
		List<Mail> mails = mailService.selectMarkMailList(cPage, limit, mail);
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
	public String storeMail(@RequestBody String[] chkMails, HttpServletRequest request) {
		// 외부에서 내부로 메일 저장하기
		// 마크별 메일 보기
		System.out.println("Store Mail 실행중");
		int[] chkMailsNum = new int[chkMails.length];
		System.out.println(chkMails.getClass());
		if (chkMails != null)
			
			for (int i = 0  ; i < chkMails.length;i++) {
				chkMailsNum[ chkMails.length-i-1] = Integer.parseInt(chkMails[i]);
			}
			
			for (int mail_no : chkMailsNum) {
				Message[] temp = mailSetting.receiveSetting(request);
				int len = temp.length;
				Message message = temp[len - mail_no - 1];
				List list = attachMailCheck(message, mail_no, request);
				mailService.mailFormEnd(mailList.get(mail_no), list);
			}
		return "redirect:innerMail.do";
	}

	@RequestMapping(value = "/mail/fileDownload")
	public void fileDownload(HttpServletResponse response, HttpServletRequest request,
			@RequestParam("path") String filepath, @RequestParam String name) {

		String path = request.getSession().getServletContext().getRealPath(filepath);

		try {
			String browser = request.getHeader("User-Agent");
			// 파일 인코딩
			if (browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")) {
				name = URLEncoder.encode(name, "UTF-8").replaceAll("\\+", "%20");
			} else {
				name = new String(name.getBytes("UTF-8"), "ISO-8859-1");
			}
		} catch (UnsupportedEncodingException ex) {
			System.out.println("UnsupportedEncodingException");
		}

		System.out.println(path);
		File file1 = new File(path);
		if (!file1.exists()) {
			return;
		}

		// 파일명 지정
		response.setContentType("application/octer-stream");
		response.setHeader("Content-Transfer-Encoding", "binary;");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + name + "\"");
		try {
			OutputStream os = response.getOutputStream();
			FileInputStream fis = new FileInputStream(path);

			int ncount = 0;
			byte[] bytes = new byte[512];

			while ((ncount = fis.read(bytes)) != -1) {
				os.write(bytes, 0, ncount);
			}
			fis.close();
			os.close();
		} catch (FileNotFoundException ex) {
			System.out.println("FileNotFoundException");
		} catch (IOException ex) {
			System.out.println("IOException");
		}
	}
}
