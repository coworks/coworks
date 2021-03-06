package com.kh.coworks.pay.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.coworks.employee.model.vo.Employee;
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
		return sqlSession.selectOne("pay.selectOnePay",pay_no);
	}

	@Override
	public int updatePay(Pay pay) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Pay> empListPay(int cPage ,int limit, int emp_no) {
		RowBounds rows = new RowBounds((cPage-1) * limit, limit);
		return sqlSession.selectList("pay.empListPay",emp_no,rows);
	}

	@Override
	public int empPayCount(int emp_no) {
		return sqlSession.selectOne("pay.empPayCount",emp_no);
	}

}
