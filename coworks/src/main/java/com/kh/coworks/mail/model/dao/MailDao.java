package com.kh.coworks.mail.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.coworks.mail.model.vo.Mail;
import com.kh.coworks.mail.model.vo.MailAttach;

public interface MailDao {

	List<Map<String,String>> selectMailList(int cPage,int limit);
	int selectMailTotalContents();
	int sendingMail(Mail mail);
	int insertMailAttach(MailAttach att);
	Mail selectOneMail(int mail_no);
	List<MailAttach> selectAttachList(int mail_no);
	int mailUpdate(Mail mail);
	int updateAttach(MailAttach att);
	int deleteMail(int mail_no);
	int deleteMailAttach(int mail_no);
	int deleteFile(int attNo);
	
}
