package com.kh.coworks.authority.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.coworks.authority.model.vo.Authority;

public interface AuthorityDao {

	List<Map<String, String>> selectAuthorityList(int cPage, int limit);

	int selectAuthorityTotalContents();

	List<Map<String, String>> searchEmployee(int cPage, int limit, HashMap<String, String> hmap);

	int selectSearchEmployeeTotalContents(String con, HashMap<String, String> hmap);

	int authorityUpdate(Authority authority);

}
