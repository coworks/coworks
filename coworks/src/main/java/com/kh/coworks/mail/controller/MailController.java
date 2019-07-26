package com.kh.coworks.mail.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
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
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.coworks.common.util.Utils;
import com.kh.coworks.employee.model.vo.Employee;
import com.kh.coworks.mail.model.service.MailService;
import com.kh.coworks.mail.model.vo.Mail;
import com.kh.coworks.mail.model.vo.MailAttach;

@Controller
public class MailController {

	MailSetting mailSetting = new MailSetting();
	MailSetting mailReceive = new MailSetting();
	ArrayList<Mail> mailList = new ArrayList<>();

	@Autowired
	MailService mailService;

	@RequestMapping("/mail/app-mail.do")
	public String selectInnerMail(Model model,
			@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage) {

		int limit = 10;
		List<Map<String, String>> mails = mailService.selectMailList(cPage, limit);
		int totalContents = mailService.selectMailTotalContents();
		// 이너 메일 조회

		String pageBar = Utils.getPageBar(totalContents, cPage, limit, "app-mail.do");

		model.addAttribute("mails", mails).addAttribute("totalContents", totalContents)
				.addAttribute("numPerPage", limit).addAttribute("pageBar", pageBar).addAttribute("type", "mail");

		// .addAttribute("emp", emp);
		return "mail/app-mail";

	}

	@RequestMapping("/mail/app-email.do")
	public String receiveEmail(Model model) {

//		ArrayList<Mail> mails = new ArrayList<>();
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
				mail.setMail_no(message.getMessageNumber() - 1);
				mail.setMail_sendDate(new Timestamp(message.getSentDate().getTime()));
				mail.setMail_content(getTextFromMessage(message));
				mail.setMail_from_email(ar.getAddress());
				mail.setMail_subject(message.getSubject());
				mailList.add(mail);
				System.out.println("---------------------------------");
				System.out.println("Subject: " + message.getSubject());
				System.out.println("number : " + message.getMessageNumber());
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

	@RequestMapping("/mail/app-compose.do")
	public String writeMail() {
		return "mail/app-compose";
	}

//	@ResponseBody
	@RequestMapping(value = "/mail/selectOneMail.do/{mail_no}/{type}", method = RequestMethod.GET)
	public String selectOneMail(Model model, HttpSession session, @PathVariable("mail_no") int mail_no,
			@PathVariable("type") String type) {

		if (type.equals("mail")) {
			model.addAttribute("mail", mailService.selectOneMail(mail_no)).addAttribute("attachList",
					mailService.selectMailAttachList(mail_no));
		} else {
			model.addAttribute("mail", mailList.get(mail_no));
		}
		// 객체가 넘어오지 않음 mail 로 받아 오면 안된다.. 해결법 필요
//		model.addAttribute(attributeValue)
		return "mail/app-email-detail";
	}

//	@ResponseBody
	/*
	 * @Override
	 * 
	 * @RequestMapping(value = "/mail/selectOneMail.do/{mail_no}/email" ,method =
	 * RequestMethod.GET) public String selectOneMail( Model model,HttpSession
	 * session , @PathVariable("mail_no")int mail_no,
	 * 
	 * @RequestParam("mail_subject") String mail_subject ) {
	 */
	/*
	 * Mail mail = new Mail(); mail.setMail_content(mail_content);
	 * mail.setMail_from_email(mail_from_email);
	 * mail.setMail_to_email(mail_to_email); mail.setMail_subject(mail_subject);
	 */
	// 객체가 넘어오지 않음 mail 로 받아 오면 안된다.. 해결법 필요
//		model.addAttribute(attributeValue)
	/*
	 * return "mail/app-email-detail"; }
	 */

	/*
	 * // @ResponseBody
	 * 
	 * @RequestMapping(value = "/mail/selectOneEMail.do/{mail_no}" ,method =
	 * RequestMethod.GET) public String selectOneEMail( Model model, HttpSession
	 * session , @PathVariable("mail_no")int mail_no ) {
	 * 
	 * model.addAttribute("mail", mailService.selectOneMail(mail_no))
	 * .addAttribute("attachList", mailService.selectMailAttachList(mail_no)); //
	 * 객체가 넘어오지 않음 mail 로 받아 오면 안된다.. 해결법 필요 // model.addAttribute(attributeValue)
	 * return "mail/app-email-detail"; }
	 */

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
						String savePath = "${pageContext.request.contextPath}/resources/mail/attach/";
						f.transferTo(new File(savePath + "/" + renamedName));

					} catch (IllegalStateException | IOException e) {

						e.printStackTrace();

					}

					MailAttach at = new MailAttach();
					at.setAttach_path(saveDir);
					at.setAttach_oriname(originalName);
					at.setAttach_rename(renamedName);

					list.add(at);
				}
			}
		}
		int result = 0;
		Employee emp = new Employee();
		emp.setEmp_email("mail_0318@naver.com");
		mail.setMail_from_email(emp.getEmp_email());

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

	@RequestMapping("/mail/deleteMail.do")
	public String deleteMail(@RequestParam(value = "chkMails", required = false) int[] chkMails) {
		for (int mail_no : chkMails) {
			int result = mailService.deleteMail(mail_no);
			if (result > 0)
				result = mailService.deleteAttach(mail_no);
		}
		return "mail/app-mail";
	}

	@RequestMapping("/mail/updateFolder.do/{folder}")
	public String updateFolder(@RequestParam(value = "chkMails", required = false) int[] chkMails,  @PathVariable(value="mail_no") int folder) {
		for (int mail_no : chkMails) {

			Mail mail = mailService.selectOneMail(mail_no);
			if(mail != null)
					mail.setMfolder_no(folder);
					mailService.updateMail(mail);

			/*
			 * for(int mail_no : chkMails) { List list = null; // 나중에 리스트 추가하기
			 * mailService.mailFormEnd(mailList.get(mail_no), list);
			 */
		}
		return "mail/app-mail";
	}

	@RequestMapping("/mail/storeMail.do")
	public String storeMail(@RequestParam(value = "chkMails", required = false) int[] chkMails) {
		// chkMails 가 아니라 check 한 mail_no 를 가져와야함
		if(chkMails != null)
		for (int mail_no : chkMails) {
			List list = null; // 나중에 리스트 추가하기
			mailService.mailFormEnd(mailList.get(mail_no), list);
		}
		return "redirect:app-mail.do";
	}

	@RequestMapping("/mail/sendingMail.do")
	public void sendingMail(Mail mail, Model model, HttpSession session,
			@RequestParam(value = "upFiles", required = false) MultipartFile[] upFile) {
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
