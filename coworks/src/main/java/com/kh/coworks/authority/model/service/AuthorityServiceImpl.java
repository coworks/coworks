package com.kh.coworks.authority.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.coworks.authority.model.dao.AuthorityDao;
import com.kh.coworks.authority.model.vo.Authority;

@Service
public class AuthorityServiceImpl implements AuthorityService {

	@Autowired
	AuthorityDao authorityDao;
	
	@Override
	public List<Map<String, String>> selectAuthorityList(int cPage, int limit) {
		
		return authorityDao.selectAuthorityList(cPage,limit);
	}

	@Override
	public int selectAuthorityTotalContents() {
		return authorityDao.selectAuthorityTotalContents();
	}

	@Override
	public List<Map<String, String>> searchAuthority(int cPage, int limit, HashMap<String, String> hmap) {
		return authorityDao.searchEmployee(cPage, limit, hmap);
	}

	@Override
	public int selectSearchEmployeeTotalContents(String con, HashMap<String, String> hmap) {
		return authorityDao.selectSearchEmployeeTotalContents(con,hmap);
	}

	@Override
	public int authorityUpdate(Authority authority) {
		return authorityDao.authorityUpdate(authority);
	}

	@Override
	public  Authority selectEmpAuthority(int emp_no) {
		return authorityDao.selectEmpAuthority(emp_no);
	}

	
}
