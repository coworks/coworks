package com.kh.coworks.employee.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.coworks.authority.model.vo.Authority;
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
	public List<Employee> selectEmployee(int emp_no) {
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

	@Override
	public int selectSearchEmployeeTotalContents(String con, HashMap<String, String> hmap) {
		return employeeDao.selectSearchEmployeeTotalContents(con, hmap);
	}
	
	@Override
	public List<Employee> selectEmployeeList(){
		return employeeDao.selectEmployeeList();
	}

	@Override
	public List<Map<String, Object>> selectDeptEmpCount() {
		return employeeDao.selectDeptEmpCount();
	}

	@Override
	public Employee selectOneEmployee(int emp_no) {
		return  employeeDao.selectOneEmployee(emp_no);
	}

	@Override
	public int insertAuthority(Authority ah) {
		return employeeDao.insertAuthority(ah);
	}

	@Override
	public int employeeMoveUpdate(Employee employee) {
		return employeeDao.employeeMoveUpdate(employee);
	}

	@Override
	public int updateAuthority(Authority ah) {
		return employeeDao.updateAuthority(ah);
	}

	@Override
	public Authority selectOneAuthority(int emp_no) {
		return employeeDao.selectOneAuthority(emp_no);
	}


}
