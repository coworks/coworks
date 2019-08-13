package com.kh.coworks.mail.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.coworks.employee.model.vo.Employee;
import com.kh.coworks.mail.model.vo.Mail;
import com.kh.coworks.mail.model.vo.MailAttach;

public interface MailDao {

	List<Mail> selectReceiveMailList(int cPage,int limit , String emp_email);
	int selectReceiveMailTotalContents(String emp_email);
	List<Mail> selectSendMailList(int cPage,int limit , String emp_email);
	int selectSendMailTotalContents(String emp_email);
	int mailFormEnd(Mail mail);
	int insertMailAttach(MailAttach att);
	Mail selectOneMail(int mail_no);
	List<MailAttach> selectAttachList(int mail_no);
	int updateMail(Mail mail);
	int deleteFromMail(int mail_no);
	int deleteToMail(int mail_no);
	int readMail(int mail_no);
	int readCount(String emp_email);
	List<Mail> selectDeleteMailList(int cPage, int limit, String emp_email);
	int selectDeleteMailTotalContents(String emp_email);
	int updateMark(Mail mail);
	List<Mail> selectMarkMailList(int cPage, int limit, Mail mail);
	int selectMarkMailTotalContents(Mail mail);
	int deleteMailAttach(int mail_no);
	int updateEmail(Employee emp);
	int updateStar(Mail mail);
	List<Mail> selectStarMailList(int cPage, int limit, Mail mail);
	int selectStarMailTotalContents(Mail mail);
	
}
