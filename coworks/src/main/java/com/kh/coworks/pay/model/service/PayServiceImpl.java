package com.kh.coworks.pay.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.coworks.pay.model.dao.PayDao;
import com.kh.coworks.pay.model.vo.Pay;

@Service
public class PayServiceImpl implements PayService{

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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updatePay(Pay pay) {
		// TODO Auto-generated method stub
		return 0;
	}

}
