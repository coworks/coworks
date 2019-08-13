package com.kh.coworks.dm.model.service;

import java.util.List;
import java.util.Map;

import com.kh.coworks.dm.model.vo.DM;
import com.kh.coworks.employee.model.vo.Employee;
import com.kh.coworks.mail.model.vo.Mail;
import com.kh.coworks.mail.model.vo.MailAttach;

public interface DMService {

	int dmListCount(int emp_no);

	List<DM> dmList(int cPage, int limit,int emp_no);

	List<DM> sendDmList(int cPage, int limit, int emp_no);

	int sendDmListCount(int emp_no);

	List<DM> delDmList(int cPage, int limit, int emp_no);

	int delDmListCount(int emp_no);

	int insertDM(DM dm);

	DM selectOneDm(int dm_no);
	
	List<DM> receiveDMList(int emp_no);


	int updateDm(DM dm);

	List<DM> selectUnreadDM(int emp_no);





	
}
