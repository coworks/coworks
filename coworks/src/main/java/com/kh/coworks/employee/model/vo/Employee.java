package com.kh.coworks.employee.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.Arrays;

import org.springframework.stereotype.Component;

@Component
public class Employee implements Serializable {
 
	  
	private static final long serialVersionUID = 2346;
	private int emp_no; // �����ȣ
	private String emp_name; // �����
	private String emp_password;
	private String job_code; // �����ڵ�
	private String dept_code; // �μ��ڵ�
	private String emp_phone; // ����ó
	private String emp_email; // �̸�� 
	private String emp_emailpassword;
	private Date emp_birth; // �������
	private String emp_gender; // ����
	private Date emp_hireDate; // �Ի���
	private Date emp_resignDate; // �����
	private String emp_isWork; // ��������
	private String emp_signature; // ���μ���
	private String[] emp_authority;
	private String dept_name;
	private String emp_address;
	private String job_title;
	 
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getEmp_password() {
		return emp_password;
	}
	public void setEmp_password(String emp_password) {
		this.emp_password = emp_password;
	}
	public String getJob_code() {
		return job_code;
	}
	public void setJob_code(String job_code) {
		this.job_code = job_code;
	}
	public String getDept_code() {
		return dept_code;
	}
	public void setDept_code(String dept_code) {
		this.dept_code = dept_code;
	}
	public String getEmp_phone() {
		return emp_phone;
	}
	public void setEmp_phone(String emp_phone) {
		this.emp_phone = emp_phone;
	}
	public String getEmp_email() {
		return emp_email;
	}
	public void setEmp_email(String emp_email) {
		this.emp_email = emp_email;
	}
	public String getEmp_emailpassword() {
		return emp_emailpassword;
	}
	public void setEmp_emailpassword(String emp_emailpassword) {
		this.emp_emailpassword = emp_emailpassword;
	}
	public Date getEmp_birth() {
		return emp_birth;
	}
	public void setEmp_birth(Date emp_birth) {
		this.emp_birth = emp_birth;
	}
	public String getEmp_gender() {
		return emp_gender;
	}
	public void setEmp_gender(String emp_gender) {
		this.emp_gender = emp_gender;
	}
	public Date getEmp_hireDate() {
		return emp_hireDate;
	}
	public void setEmp_hireDate(Date emp_hireDate) {
		this.emp_hireDate = emp_hireDate;
	}
	public Date getEmp_resignDate() {
		return emp_resignDate;
	}
	public void setEmp_resignDate(Date emp_resignDate) {
		this.emp_resignDate = emp_resignDate;
	}
	public String getEmp_isWork() {
		return emp_isWork;
	}
	public void setEmp_isWork(String emp_isWork) {
		this.emp_isWork = emp_isWork;
	}
	public String getEmp_signature() {
		return emp_signature;
	}
	public void setEmp_signature(String emp_signature) {
		this.emp_signature = emp_signature;
	}
	public String[] getEmp_authority() {
		return emp_authority;
	}
	public void setEmp_authority(String[] emp_authority) {
		this.emp_authority = emp_authority;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	public Employee() {
		super();
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public String getJob_title() {
		return job_title;
	}
	public void setJob_title(String job_title) {
		this.job_title = job_title;
	}
	public Employee(int emp_no, String emp_name, String emp_password, String job_code, String dept_code,
			String emp_phone, String emp_email, String emp_emailpassword, Date emp_birth, String emp_gender,
			Date emp_hireDate, Date emp_resignDate, String emp_isWork, String emp_signature, String[] emp_authority,
			String dept_name, String job_title) {
		super();
		this.emp_no = emp_no;
		this.emp_name = emp_name;
		this.emp_password = emp_password;
		this.job_code = job_code;
		this.dept_code = dept_code;
		this.emp_phone = emp_phone;
		this.emp_email = emp_email;
		this.emp_emailpassword = emp_emailpassword;
		this.emp_birth = emp_birth;
		this.emp_gender = emp_gender;
		this.emp_hireDate = emp_hireDate;
		this.emp_resignDate = emp_resignDate;
		this.emp_isWork = emp_isWork;
		this.emp_signature = emp_signature;
		this.emp_authority = emp_authority;
		this.dept_name = dept_name;
		this.job_title = job_title;
	}
	@Override
	public String toString() {
		return "Employee [emp_no=" + emp_no + ", emp_name=" + emp_name + ", emp_password=" + emp_password
				+ ", job_code=" + job_code + ", dept_code=" + dept_code + ", emp_phone=" + emp_phone + ", emp_email="
				+ emp_email + ", emp_emailpassword=" + emp_emailpassword + ", emp_birth=" + emp_birth + ", emp_gender="
				+ emp_gender + ", emp_hireDate=" + emp_hireDate + ", emp_resignDate=" + emp_resignDate + ", emp_isWork="
				+ emp_isWork + ", emp_signature=" + emp_signature + ", emp_authority=" + Arrays.toString(emp_authority)
				+ ", dept_name=" + dept_name + ", job_title=" + job_title + "]";
	}
	
	public void setEmp_address(String emp_address) {
		this.emp_address = emp_address;
	}
	public String getEmp_address() {
		return emp_address;
	}
	
	
	
  

}
