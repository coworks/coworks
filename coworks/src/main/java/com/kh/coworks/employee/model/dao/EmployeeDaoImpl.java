package com.kh.coworks.employee.model.dao;

import java.util.ArrayList; 
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
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

}
