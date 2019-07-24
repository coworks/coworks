package com.kh.coworks.employee.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.coworks.employee.model.vo.Department;
import com.kh.coworks.employee.model.vo.Employee;
import com.kh.coworks.employee.model.vo.Job;

public interface EmployeeDao {
	
	int insertEmployee(Employee employee);
	
	List<Map<String, String>> selectEmployeeList(int cPage, int limit);
	
	int selectEmployeeTotalContents();
	
	List<Department> selectDepartmentList(); 
	
	List<Job> selectJobList();
}
