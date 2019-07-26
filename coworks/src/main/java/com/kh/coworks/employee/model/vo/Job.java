package com.kh.coworks.employee.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Job implements Serializable {
	private String job_code; // 직급코드
	private String job_title; // 직급명
	public Job() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Job(String job_code, String job_title) {
		super();
		this.job_code = job_code;
		this.job_title = job_title;
	}
	public String getJob_code() {
		return job_code;
	}
	public void setJob_code(String job_code) {
		this.job_code = job_code;
	}
	public String getJob_title() {
		return job_title;
	}
	public void setJob_title(String job_title) {
		this.job_title = job_title;
	}
	@Override
	public String toString() {
		return "Job [job_code=" + job_code + ", job_title=" + job_title + "]";
	}

	
	
}
