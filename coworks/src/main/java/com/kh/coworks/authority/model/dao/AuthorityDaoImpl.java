package com.kh.coworks.authority.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.coworks.authority.model.vo.Authority;

@Repository
public class AuthorityDaoImpl implements AuthorityDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectAuthorityList(int cPage, int limit) {
		RowBounds rows = new RowBounds((cPage-1) * limit, limit);
		return sqlSession.selectList("authority.selectAuthorityList", null, rows);
	}

	@Override
	public int selectAuthorityTotalContents() {
		return sqlSession.selectOne("authority.selectAuthorityTotalContents");
	}

	@Override
	public List<Map<String, String>> searchEmployee(int cPage, int limit, HashMap<String, String> hmap) {
		RowBounds rows = new RowBounds((cPage-1) * limit, limit);
		return sqlSession.selectList("authority.selectSerachAuthority", hmap, rows);
	}

	@Override
	public int selectSearchEmployeeTotalContents(String con, HashMap<String, String> hmap) {
	
		String searchType = "";
		String key = "";

		if (con.equals("empname")) {
			searchType = "authority.selectSearchEmployeeTotalContents";
		} else if (con.equals("jobtitle")) {
			searchType = "authority.selectSearchJobTotalContents";
		} else if (con.equals("deptname")) {
			searchType = "authority.selectSearchDepartmentTotalContents";
		}

		return sqlSession.selectOne(searchType, hmap);
	}

	@Override
	public int authorityUpdate(Authority authority) {
		return sqlSession.update("authority.authorityUpdate",authority);
	}

}
