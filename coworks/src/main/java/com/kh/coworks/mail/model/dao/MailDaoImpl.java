package com.kh.coworks.mail.model.dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.coworks.employee.model.vo.Employee;
import com.kh.coworks.mail.model.vo.Mail;
import com.kh.coworks.mail.model.vo.MailAttach;

@Repository
public class MailDaoImpl implements MailDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Mail> selectStarMailList(int cPage, int limit, Mail mail) {
		RowBounds rows = new RowBounds((cPage-1) * limit, limit);
		return sqlSession.selectList("mail.selectStarMailList",mail);
	}

	@Override
	public int selectStarMailTotalContents(Mail mail) {
		return sqlSession.selectOne("mail.selectStarMailTotalContents",mail);
	}


	@Override
	public List<Mail> selectMarkMailList(int cPage, int limit, Mail mail) {
		RowBounds rows = new RowBounds((cPage-1) * limit, limit);
		return sqlSession.selectList("mail.selectMarkMailList",mail);
	}

	@Override
	public int selectMarkMailTotalContents(Mail mail) {
		return sqlSession.selectOne("mail.selectMarkMailTotalContents",mail);
	}

	@Override
	public List<Mail> selectDeleteMailList(int cPage, int limit, String emp_email) {
		RowBounds rows = new RowBounds((cPage-1) * limit, limit);
		return sqlSession.selectList("mail.selectDeleteMailList",emp_email,rows);
	}

	@Override
	public int selectDeleteMailTotalContents(String emp_email) {
		return sqlSession.selectOne("mail.selectDeleteMailTotalContents",emp_email);
	}

	@Override
	public List<Mail> selectSendMailList(int cPage, int limit, String emp_email) {
		RowBounds rows = new RowBounds((cPage-1) * limit, limit);
		return sqlSession.selectList("mail.selectSendMailList",emp_email,rows);
	}

	@Override
	public int selectSendMailTotalContents(String emp_email) {
		return sqlSession.selectOne("mail.selectSendMailTotalContents",emp_email);
	}

	@Override
	public List<Mail> selectReceiveMailList(int cPage,int limit , String emp_email) {

		RowBounds rows = new RowBounds((cPage-1) * limit, limit);
		
		return sqlSession.selectList("mail.selectReceiveMailList", emp_email, rows);
	}

	@Override
	public int selectReceiveMailTotalContents(String emp_email) {
		return sqlSession.selectOne("mail.selectReceiveMailTotalContents",emp_email);
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
		return sqlSession.selectList("mail.selectMailAttachList",mail_no);
	}

	@Override
	public int updateMail(Mail mail) {
		return sqlSession.update("mail.updateMail",mail);
	}

	

	@Override
	public int deleteFromMail(int mail_no) {
		return sqlSession.update("mail.deleteFromMail",mail_no);
	}

	@Override
	public int deleteToMail(int mail_no) {
		return sqlSession.update("mail.deleteToMail",mail_no);
	}

	@Override
	public int deleteMailAttach(int mail_no) {
		return sqlSession.update("mail.deleteMailAttach",mail_no);
	}


	@Override
	public int readMail(int mail_no) {
		// TODO Auto-generated method stub
		return sqlSession.update("mail.readMail",mail_no);
	}

	@Override
	public int readCount(String emp_email) {
		return sqlSession.selectOne("mail.readCount",emp_email);
	}

	@Override
	public int updateMark(Mail mail) {
		return sqlSession.update("mail.updateMark",mail);
	}

	@Override
	public int updateEmail(Employee emp) {
		return sqlSession.update("mail.updateEmail",emp);
	}

	@Override
	public int updateStar(Mail mail) {
		return sqlSession.update("mail.updateStar",mail);
	}



}
