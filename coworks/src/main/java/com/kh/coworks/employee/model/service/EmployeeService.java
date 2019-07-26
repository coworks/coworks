package com.kh.coworks.employee.model.service;

import java.util.List;
import java.util.Map;

import com.kh.coworks.employee.model.vo.Employee;

public interface EmployeeService {
	
	int insertEmployee(Employee employee);
	
	List<Map<String, String>> selectEmployeeList(int cPage, int limit);
	
	int selectEmployeeTotalContents();
	
}
