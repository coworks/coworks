package com.kh.coworks.employee.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.session.RowBounds;
import org.apache.tools.ant.types.CommandlineJava.SysProperties;
import org.mybatis.spring.SqlSessionTemplate; 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.coworks.employee.model.vo.Department;
import com.kh.coworks.employee.model.vo.Employee;
import com.kh.coworks.employee.model.vo.Job;

@Repository
public class EmployeeDaoImpl implements EmployeeDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertEmployee(Employee employee) {
		return sqlSession.insert("employee.insertEmployee", employee);
	}

	@Override
	public List<Map<String, String>> selectEmployeeList(int cPage, int limit) {
		RowBounds rows = new RowBounds((cPage-1) * limit, limit);
		return sqlSession.selectList("employee.selectEmployeeList", null, rows);
	}

	@Override
	public int selectEmployeeTotalContents() {
		
		return sqlSession.selectOne("employee.selectEmployeeTotalContents");
	}

	@Override
	public List<Department> selectDepartmentList() {
		
		return sqlSession.selectList("employee.selectDepartment");
	}

	@Override
	public List<Job> selectJobList() {
		return sqlSession.selectList("employee.selectJob");
	}
	
	@Override
	public Employee selectEmployee(int emp_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("employee.selectEmployee",emp_no);
	}

	@Override
	public int insertDeptName(Department dept) {
		return sqlSession.insert("employee.insertDeptName",dept);
	}

	@Override
	public int updateDeptName(Department dept) {
		return sqlSession.update("employee.updateDeptName",dept);
	}

	@Override
	public List<Map<String, String>> searchEmployee(int cPage, int limit, HashMap<String, String> hmap) {
		RowBounds rows = new RowBounds((cPage-1) * limit, limit);
		return sqlSession.selectList("employee.selectSerachEmployee", hmap, rows);
	}

	@Override
	public int selectSearchEmployeeTotalContents(String con, HashMap<String, String> hmap) {

		String searchType = "";
		String key = "";

		if (con.equals("empname")) {
			System.out.println("체크");
			searchType = "employee.selectSearchEmployeeTotalContents";
		} else if (con.equals("jobtitle")) {
			searchType = "employee.selectSearchJobTotalContents";
		} else if (con.equals("deptname")) {
			searchType = "employee.selectSearchDepartmentTotalContents";
		}

		return sqlSession.selectOne(searchType, hmap);
	}

}
