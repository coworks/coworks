package com.kh.coworks.employee.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.coworks.employee.model.dao.EmployeeDao;
import com.kh.coworks.employee.model.vo.Employee;

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

}
