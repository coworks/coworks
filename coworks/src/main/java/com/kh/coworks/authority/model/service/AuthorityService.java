package com.kh.coworks.authority.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.kh.coworks.authority.model.vo.Authority;

public interface AuthorityService {
	
	List<Map<String, String>> selectAuthorityList(int cPage, int limit);

	int selectAuthorityTotalContents();

	List<Map<String, String>> searchAuthority(int cPage, int limit, HashMap<String, String> hmap);

	int selectSearchEmployeeTotalContents(String con, HashMap<String, String> hmap);

	int authorityUpdate(Authority authority);

	 Authority  selectEmpAuthority(int emp_no);

}
