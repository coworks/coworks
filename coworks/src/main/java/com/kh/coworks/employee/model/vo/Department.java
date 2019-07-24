package com.kh.coworks.employee.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Department implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2345L;
	private String dept_code; // �μ��ڵ�
	private String dept_name; // �μ���
	private int dept_mgrno; // ������
	private String dept_sup; // �����μ�
	private int dept_level; // �μ�����
	public Department() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Department(String dept_code, String dept_name, int dept_mgrno, String dept_sup, int dept_level) {
		super();
		this.dept_code = dept_code;
		this.dept_name = dept_name;
		this.dept_mgrno = dept_mgrno;
		this.dept_sup = dept_sup;
		this.dept_level = dept_level;
	}
	public String getDept_code() {
		return dept_code;
	}
	public void setDept_code(String dept_code) {
		this.dept_code = dept_code;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public int getDept_mgrno() {
		return dept_mgrno;
	}
	public void setDept_mgrno(int dept_mgrno) {
		this.dept_mgrno = dept_mgrno;
	}
	public String getDept_sup() {
		return dept_sup;
	}
	public void setDept_sup(String dept_sup) {
		this.dept_sup = dept_sup;
	}
	public int getDept_level() {
		return dept_level;
	}
	public void setDept_level(int dept_level) {
		this.dept_level = dept_level;
	}
	@Override
	public String toString() {
		return "Department [dept_code=" + dept_code + ", dept_name=" + dept_name + ", dept_mgrno=" + dept_mgrno
				+ ", dept_sup=" + dept_sup + ", dept_level=" + dept_level + "]";
	}
	
	
}
