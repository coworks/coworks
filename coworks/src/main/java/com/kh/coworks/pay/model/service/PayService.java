package com.kh.coworks.pay.model.service;

import java.util.List;
import java.util.Map;

import com.kh.coworks.employee.model.vo.Employee;
import com.kh.coworks.pay.model.vo.Pay;

public interface PayService {
	
	int insertPay(Pay pay);
	List<Map<String,String>> selectPayList();
	Pay selectOnePay(int pay_no);
	int updatePay(Pay pay);
	List<Pay> empListPay(int cPage ,int limit, int emp_no);
	int empPayCount(int parseInt);

}
