package com.kh.coworks.mail.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.coworks.employee.model.vo.Employee;
import com.kh.coworks.mail.model.dao.MailDao;
import com.kh.coworks.mail.model.exception.MailException;
import com.kh.coworks.mail.model.vo.Mail;
import com.kh.coworks.mail.model.vo.MailAttach;
@Service
public class MailServiceImple implements MailService {

	@Autowired
	MailDao mailDao ;
	public List<Mail> selectReceiveMailList(int cPage,int limit , String emp_email) {
		return mailDao.selectReceiveMailList(cPage, limit, emp_email);
	}

	@Override
	public int selectReceiveMailTotalContents(String emp_email) {
		return mailDao.selectReceiveMailTotalContents(emp_email);
	}
	@Override
	public List<Mail> selectSendMailList(int cPage, int limit, String emp_email) {
		return mailDao.selectSendMailList(cPage, limit, emp_email);
	}

	@Override
	public int selectSendMailTotalContents(String emp_email) {
		return mailDao.selectSendMailTotalContents(emp_email);
	}

	@Override
	public int mailFormEnd(Mail mail, List<MailAttach> list) {
		
		int result = MAIL_SRV_ERROR;
		result = mailDao.mailFormEnd(mail);
		if(result == MAIL_SRV_ERROR)
			throw new MailException("메일 전송 실패");
		
		if(list.size()>0)
			for(MailAttach ma : list) {
				result = mailDao.insertMailAttach(ma);
				if(result == MAIL_SRV_ERROR)
					throw new MailException("메일 첨부파일 처리 중 에러가 발생");
			}
		return result;
	}

	@Override
	public Mail selectOneMail(int mail_no) {
		return mailDao.selectOneMail(mail_no);
	}

	@Override
	public List<MailAttach> selectMailAttachList(int mail_no) {
		return mailDao.selectAttachList(mail_no);
	}

	@Override
	public int updateMail(Mail mail) {
		return mailDao.updateMail(mail);
	}

	@Override
	public int deleteFromMail(int mail_no) {
		return mailDao.deleteFromMail(mail_no);
	}

	@Override
	public int deleteToMail(int mail_no) {
		return mailDao.deleteToMail(mail_no);
	}

	@Override
	public int deleteAttach(int mail_no) {
		return mailDao.deleteMailAttach(mail_no);
	}

	@Override
	public int readMail(int mail_no) {
		// TODO Auto-generated method stub
		return mailDao.readMail(mail_no);
	}

	@Override
	public int readCount(String emp_email) {
		return mailDao.readCount(emp_email);
	}

	@Override
	public List<Mail> selectDeleteMailList(int cPage, int limit, String emp_email) {
		return mailDao.selectDeleteMailList(cPage,limit,emp_email);
	}

	@Override
	public int selectDeleteMailTotalContents(String emp_email) {
		return mailDao.selectDeleteMailTotalContents(emp_email);
	}

	@Override
	public int updateMark(Mail mail) {
		return mailDao.updateMark(mail);
	}

	@Override
	public List<Mail> selectMarkMailList(int cPage, int limit, Mail mail) {
		return mailDao.selectMarkMailList(cPage,limit,mail);
	}

	@Override
	public int selectMarkMailTotalContents(Mail mail) {
		return mailDao.selectMarkMailTotalContents(mail);
	}

	@Override
	public int updateEmail(Employee emp) {
		return mailDao.updateEmail(emp);
	}

	@Override
	public int updateStar(Mail mail) {
		return mailDao.updateStar(mail);
	}

	@Override
	public List<Mail> selectStarMailList(int cPage, int limit, Mail mail) {
		return mailDao.selectStarMailList(cPage, limit, mail);
	}

	@Override
	public int selectStarMailTotalContents(Mail mail) {
		return mailDao.selectStarMailTotalContents(mail);
	}




}
