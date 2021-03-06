package com.kh.coworks.pay.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.coworks.employee.model.vo.Employee;
import com.kh.coworks.pay.model.dao.PayDao;
import com.kh.coworks.pay.model.vo.Pay;

@Service
public class PayServiceImpl implements PayService {

	@Autowired
	PayDao payDao;

	@Override
	public int insertPay(Pay pay) {
		return payDao.insertPay(pay);
	}

	@Override
	public List<Map<String, String>> selectPayList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Pay selectOnePay(int pay_no) {
		return payDao.selectOnePay(pay_no);
	}

	@Override
	public int updatePay(Pay pay) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Pay> empListPay(int cPage, int limit, int emp_no) {
		return payDao.empListPay(cPage, limit, emp_no);
	}

	@Override
	public int empPayCount(int emp_no) {
		return payDao.empPayCount(emp_no);
	}
}
