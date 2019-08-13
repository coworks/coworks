package com.kh.coworks.mail.model.service;

import java.util.List;
import java.util.Map;

import com.kh.coworks.employee.model.vo.Employee;
import com.kh.coworks.mail.model.vo.Mail;
import com.kh.coworks.mail.model.vo.MailAttach;

public interface MailService {

	static final int MAIL_SRV_ERROR=0;
	static final int MAIL_SRV_COMP=1;
	
	/**
	 * 삭제한 목록 조회 메소드
	 * @param cPage
	 * @param limit
	 * @return
	 */
	List<Mail> selectDeleteMailList(int cPage,int limit , String emp_email);
	/**
	 * 받은 메일 목록 조회 메소드
	 * @param cPage
	 * @param limit
	 * @return
	 */
	List<Mail> selectReceiveMailList(int cPage,int limit , String emp_email);
	
	/**
	 * 보낸 메일 목록 조회 메소드
	 * @param cPage
	 * @param limit
	 * @return
	 */
	List<Mail> selectSendMailList(int cPage,int limit , String emp_email);

	/***
	 * 페이지 처리
	 * @return
	 */
	int selectReceiveMailTotalContents(String emp_email);
	
	/***
	 * 페이지 처리
	 * @return
	 */
	int selectSendMailTotalContents(String emp_email);
	
	/***
	 * 메일 전송 메소드
	 * @param mail
	 * @param list
	 * @return
	 */
	int mailFormEnd(Mail mail, List<MailAttach> list);
	
	/***
	 * 메일 하나 조회
	 * @param mail_no
	 * @return
	 */
	Mail selectOneMail(int mail_no);
	
	/***
	 * 메일 첨부파일 조회용 메소드
	 * @param mail_no
	 * @return
	 */
	List<MailAttach> selectMailAttachList(int mail_no);
	
	/***
	 * 메일 수정 메소드
	 * @param mail
	 * @return
	 */
	int updateMail(Mail mail);
	
	/***
	 * 메일 삭제 메소드
	 * @param mail_no
	 * @return
	 */
	int deleteFromMail(int mail_no);
	int deleteToMail(int mail_no);

	/***
	 * 파일 한개 삭제 메소드
	 * @param attach_no
	 * @return
	 */
	int deleteAttach(int attach_no);
	
	int readMail(int mail_no);
	
	int readCount(String emp_email);
	int selectDeleteMailTotalContents(String emp_email);
	int updateMark(Mail mail);
	List<Mail> selectMarkMailList(int cPage, int limit, Mail mail);
	int selectMarkMailTotalContents(Mail mail);
	int updateEmail(Employee emp);
	int updateStar(Mail mail);
	List<Mail> selectStarMailList(int cPage, int limit, Mail mail);
	int selectStarMailTotalContents(Mail mail);

}
