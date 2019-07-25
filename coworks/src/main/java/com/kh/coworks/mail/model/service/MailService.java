package com.kh.coworks.mail.model.service;

import java.util.List;
import java.util.Map;

import com.kh.coworks.mail.model.vo.Mail;
import com.kh.coworks.mail.model.vo.MailAttach;

public interface MailService {

	static final int MAIL_SRV_ERROR=0;
	static final int MAIL_SRV_COMP=1;
	
	/**
	 * 메일 목록 조회 메소드
	 * @param cPage
	 * @param limit
	 * @return
	 */
	List<Map<String, String>> selectMailList(int cPage, int limit);

	/***
	 * 페이지 처리
	 * @return
	 */
	int selectMaildTotalContents();
	
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
	 * @param list
	 * @return
	 */
	int updateMail(Mail mail , List<MailAttach> list);
	
	/***
	 * 메일 삭제 메소드
	 * @param mail_no
	 * @return
	 */
	int deleteMail(int mail_no);

	/***
	 * 파일 한개 삭제 메소드
	 * @param attach_no
	 * @return
	 */
	int deleteAttach(int attach_no);
}
