package com.kh.coworks.todo.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Todo implements Serializable {
	private int todo_no;// 인덱스
	private int emp_no;// 사번
	private String todo_content;// 내용
	private Date todo_endDate;// 만료일

	public Todo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Todo(int todo_no, int emp_no, String todo_content, Date todo_endDate) {
		super();
		this.todo_no = todo_no;
		this.emp_no = emp_no;
		this.todo_content = todo_content;
		this.todo_endDate = todo_endDate;
	}

	public int getTodo_no() {
		return todo_no;
	}

	public void setTodo_no(int todo_no) {
		this.todo_no = todo_no;
	}

	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}

	public String getTodo_content() {
		return todo_content;
	}

	public void setTodo_content(String todo_content) {
		this.todo_content = todo_content;
	}

	public Date getTodo_endDate() {
		return todo_endDate;
	}

	public void setTodo_endDate(Date todo_endDate) {
		this.todo_endDate = todo_endDate;
	}

	@Override
	public String toString() {
		return "Todo [todo_no=" + todo_no + ", emp_no=" + emp_no + ", todo_content=" + todo_content + ", todo_endDate="
				+ todo_endDate + "]";
	}

}
