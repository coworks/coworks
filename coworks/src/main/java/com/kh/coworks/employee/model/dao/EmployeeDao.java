package com.kh.coworks.employee.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.coworks.authority.model.vo.Authority;
import com.kh.coworks.employee.model.vo.Department;
import com.kh.coworks.employee.model.vo.Employee;
import com.kh.coworks.employee.model.vo.Job;

public interface EmployeeDao {
	
	int insertEmployee(Employee employee);
	
	List<Map<String, String>> selectEmployeeList(int cPage, int limit);
	
	int selectEmployeeTotalContents();
	
	List<Department> selectDepartmentList(); 
	
	List<Job> selectJobList();
	
	List<Employee> selectEmployee(int emp_no);

	int insertDeptName(Department dept);

	int updateDeptName(Department dept);

	List<Map<String, String>> searchEmployee(int cPage, int limit, HashMap<String, String> hmap);

	int selectSearchEmployeeTotalContents(String con, HashMap<String, String> hmap);

	List<Employee> selectEmployeeList();

	List<Map<String, Object>> selectDeptEmpCount();
	
	Employee selectOneEmployee(int emp_no);

	int insertAuthority(Authority ah);

	int employeeMoveUpdate(Employee employee);

	int updateAuthority(Authority ah);

	Authority selectOneAuthority(int emp_no);

	int updateEmployee(Employee emp);

	List<Employee> getDeptEmp(String dept_code);
	
}
