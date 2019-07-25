package com.kh.coworks.mail.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.coworks.mail.model.vo.Mail;
import com.kh.coworks.mail.model.vo.MailAttach;

@Repository
public class MailDaoImpl implements MailDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectMailList(int cPage, int limit) {
		RowBounds rows = new RowBounds((cPage-1) * limit, limit);
		return sqlSession.selectList("mail.selectMailList", null, rows);
	}

	@Override
	public int selectMailTotalContents() {
		return 0;
	}

	@Override
	public int mailFormEnd(Mail mail) {
		System.out.println("dao");
		return sqlSession.insert("mail.mailFormEnd",mail);
	}

	@Override
	public int insertMailAttach(MailAttach att) {
		System.out.println("dao atta");
		return sqlSession.insert("mail.insertMailAttach",att);
	}

	@Override
	public Mail selectOneMail(int mail_no) {
		return sqlSession.selectOne("mail.selectOneMail", mail_no);
	}

	@Override
	public List<MailAttach> selectAttachList(int mail_no) {
		return sqlSession.selectList("mail.selectAttachList",mail_no);
	}

	@Override
	public int updateMail(Mail mail) {
		return sqlSession.update("mail.updateMail",mail);
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
