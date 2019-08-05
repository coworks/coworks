package com.kh.coworks.dm.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.coworks.dm.model.dao.DMDao;
import com.kh.coworks.dm.model.vo.DM;
import com.kh.coworks.employee.model.vo.Employee;
import com.kh.coworks.mail.model.dao.MailDao;
import com.kh.coworks.mail.model.exception.MailException;
import com.kh.coworks.mail.model.vo.Mail;
import com.kh.coworks.mail.model.vo.MailAttach;
@Service
public class DMServiceImple implements DMService {

	@Autowired
	DMDao dmDao;
	
	@Override
	public int dmListCount(int emp_no) {
		return  dmDao.dmListCount(emp_no);
	}


	@Override
	public List<DM> dmList(int cPage, int limit, int emp_no) {
		return dmDao.dmList(cPage,limit,emp_no);
	}


	@Override
	public List<DM> sendDmList(int cPage, int limit, int emp_no) {
		return dmDao.sendDmList(cPage,limit,emp_no);
	}


	@Override
	public int sendDmListCount(int emp_no) {
		return dmDao.sendDmListCount(emp_no);
	}


	@Override
	public List<DM> delDmList(int cPage, int limit, int emp_no) {
		return dmDao.delDmList(cPage,limit,emp_no);
	}


	@Override
	public int delDmListCount(int emp_no) {
		return dmDao.delDmListCount(emp_no);
	}


	@Override
	public int insertDM(DM dm) {
		return dmDao.insertDM(dm);
	}


	@Override
	public int insertDMTo(int dm_to) {
		return dmDao.insertDMTo(dm_to);
	}


	@Override
	public DM selectOneDm(int dm_no) {
		return dmDao.selectOneDm(dm_no);
	}





}
