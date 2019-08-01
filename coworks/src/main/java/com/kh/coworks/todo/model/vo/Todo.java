package com.kh.coworks.todo.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Todo implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 4020L;
	
	
	private int todo_no;// todo 인덱스
	private int emp_no;// 사원번호
	private String todo_content;// 내용
	private int todo_condition; //상태 0:긴급, 1:보통, 2:여유 --> default:1
	private int todo_status;// 0 : 할일, 1 :  완료, 2 : 삭제 --> default:0
	
	

	public Todo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Todo(int todo_no, int emp_no, String todo_content, int todo_status, int todo_condition) {
		super();
		this.todo_no = todo_no;
		this.emp_no = emp_no;
		this.todo_content = todo_content;
		this.todo_status = todo_status;
		this.todo_condition = todo_condition;
	}



	public int getTodo_no() {
		return todo_no;
	}

	public int getEmp_no() {
		return emp_no;
	}

	public String getTodo_content() {
		return todo_content;
	}

	public int getTodo_condition() {
		return todo_condition;
	}

	public int getTodo_status() {
		return todo_status;
	}

	public void setTodo_no(int todo_no) {
		this.todo_no = todo_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}

	public void setTodo_content(String todo_content) {
		this.todo_content = todo_content;
	}

	public void setTodo_condition(int todo_condition) {
		this.todo_condition = todo_condition;
	}

	public void setTodo_status(int todo_status) {
		this.todo_status = todo_status;
	}

	@Override
	public String toString() {
		return "Todo [todo_no=" + todo_no + ", emp_no=" + emp_no + ", todo_content=" + todo_content
				+ ", todo_condition=" + todo_condition + ", todo_status=" + todo_status + "]";
	}

}
