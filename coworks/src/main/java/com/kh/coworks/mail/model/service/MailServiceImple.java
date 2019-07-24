package com.kh.coworks.mail.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.coworks.mail.model.dao.MailDao;
import com.kh.coworks.mail.model.exception.MailException;
import com.kh.coworks.mail.model.vo.Mail;
import com.kh.coworks.mail.model.vo.MailAttach;
@Service
public class MailServiceImple implements MailService {

	@Autowired
	MailDao mailDao ;
	@Override
	public List<Map<String, String>> selectMailList(int cPage, int limit) {
		return null;
	}

	@Override
	public int selectMaildTotalContents() {
		return 0;
	}

	@Override
	public int sendingMail(Mail mail, List<MailAttach> list) {
		
		int result = MAIL_SRV_ERROR;
		result = mailDao.sendingMail(mail);
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
		return null;
	}

	@Override
	public List<MailAttach> selectMailAttachList(int mail_no) {
		return null;
	}

	@Override
	public int updateMail(Mail mail, List<MailAttach> list) {
		return 0;
	}

	@Override
	public int deleteMail(int mail_no) {
		return 0;
	}

	@Override
	public int deleteAttach(int attach_no) {
		return 0;
	}

}
