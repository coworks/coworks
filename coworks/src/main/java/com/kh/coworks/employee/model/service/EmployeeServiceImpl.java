package com.kh.coworks.employee.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.coworks.employee.model.dao.EmployeeDao;
import com.kh.coworks.employee.model.vo.Department;
import com.kh.coworks.employee.model.vo.Employee;
import com.kh.coworks.employee.model.vo.Job;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	EmployeeDao employeeDao;
	
	@Override
	public int insertEmployee(Employee employee) {
		return employeeDao.insertEmployee(employee);
	}

	@Override
	public List<Map<String, String>> selectEmployeeList(int cPage, int limit) {
		return employeeDao.selectEmployeeList(cPage, limit);
	}

	@Override
	public int selectEmployeeTotalContents() {
		// TODO Auto-generated method stub
		return employeeDao.selectEmployeeTotalContents();
	}

	@Override
	public List<Department> selectDepartmentList() {
		return employeeDao.selectDepartmentList();
	}

	@Override
	public List<Job> selectJobList() {
		return employeeDao.selectJobList();
	}
	
	
	@Override
	public Employee selectEmployee(int emp_no) {
		// TODO Auto-generated method stub
		return employeeDao.selectEmployee(emp_no);
	}

	@Override
	public int insertDeptName(Department dept) {
		return employeeDao.insertDeptName(dept);
	}

	@Override
	public int updateDeptName(Department dept) {
		return employeeDao.updateDeptName(dept);
	}

	@Override
	public List<Map<String, String>> searchEmployee(int cPage, int limit, HashMap<String, String> hmap) {
		return employeeDao.searchEmployee(cPage, limit, hmap);
	}
	



}
