package com.kh.coworks.pay.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.coworks.pay.model.vo.Pay;

@Repository
public class PayDaoImpl implements PayDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int insertPay(Pay pay) {
		return sqlSession.insert("pay.insertPay",pay);
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
