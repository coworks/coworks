package com.kh.coworks.mail.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.coworks.employee.model.vo.Employee;
import com.kh.coworks.mail.model.vo.Mail;
import com.kh.coworks.mail.model.vo.MailAttach;

public interface MailDao {

	List<Map<String,String>> selectReceiveMailList(int cPage,int limit , String emp_email);
	int selectReceiveMailTotalContents();
	List<Map<String,String>> selectSendMailList(int cPage,int limit , String emp_email);
	int selectSendMailTotalContents();
	int mailFormEnd(Mail mail);
	int insertMailAttach(MailAttach att);
	Mail selectOneMail(int mail_no);
	List<MailAttach> selectAttachList(int mail_no);
	int updateMail(Mail mail);
	int deleteFromMail(int mail_no);
	int deleteToMail(int mail_no);
	int readMail(int mail_no);
	int readCount(String emp_email);
	List<Map<String, String>> selectDeleteMailList(int cPage, int limit, String emp_email);
	int selectDeleteMailTotalContents();
	int updateMark(Mail mail);
	List<Map<String, String>> selectMarkMailList(int cPage, int limit, Mail mail);
	int selectMarkMailTotalContents(Mail mail);
	int deleteMailAttach(int mail_no);
	int updateEmail(Employee emp);
	int updateStar(Mail mail);
	List<Map<String, String>> selectStarMailList(int cPage, int limit, Mail mail);
	int selectStarMailTotalContents(Mail mail);
	
}
