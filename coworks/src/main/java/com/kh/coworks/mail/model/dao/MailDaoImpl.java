package com.kh.coworks.mail.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.coworks.mail.model.vo.Mail;
import com.kh.coworks.mail.model.vo.MailAttach;

@Repository
public class MailDaoImpl implements MailDao {

//	@Autowired
//	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectMailList(int cPage, int limit) {
		return null;
	}

	@Override
	public int selectMailTotalContents() {
		return 0;
	}

	@Override
	public int sendingMail(Mail mail) {
		return sqlSession.insert("board.sendingMail",mail);
	}

	@Override
	public int insertMailAttach(MailAttach att) {
		return sqlSession.insert("mail.insertMailAttach",att);
	}

	@Override
	public Mail selectOneMail(int mail_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MailAttach> selectAttachList(int mail_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int mailUpdate(Mail mail) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateAttach(MailAttach att) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMail(int mail_no) {
		return 0;
	}

	@Override
	public int deleteMailAttach(int mail_no) {
		return 0;
	}

	@Override
	public int deleteFile(int attNo) {
		return 0;
	}

}
