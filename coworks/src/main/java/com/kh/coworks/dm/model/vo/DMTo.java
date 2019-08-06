package com.kh.coworks.dm.model.vo;

import java.io.Serializable;

import java.sql.Date;

import org.springframework.stereotype.Component;
@Component
public class DMTo implements Serializable{
	private int dm_to_no;
	private int dm_no;
	private int dm_to;
	private String dm_to_del;
	
	@Override
	public String toString() {
		return "DMTo [dm_to_no=" + dm_to_no + ", dm_no=" + dm_no + ", dm_to=" + dm_to + ", dm_to_del=" + dm_to_del
				+ "]";
	}
	public DMTo(int dm_to_no, int dm_no, int dm_to, String dm_to_del) {
		super();
		this.dm_to_no = dm_to_no;
		this.dm_no = dm_no;
		this.dm_to = dm_to;
		this.dm_to_del = dm_to_del;
	}
	public DMTo() {
		super();
	}
	public int getDm_to_no() {
		return dm_to_no;
	}
	public void setDm_to_no(int dm_to_no) {
		this.dm_to_no = dm_to_no;
	}
	public int getDm_no() {
		return dm_no;
	}
	public void setDm_no(int dm_no) {
		this.dm_no = dm_no;
	}
	public int getDm_to() {
		return dm_to;
	}
	public void setDm_to(int dm_to) {
		this.dm_to = dm_to;
	}
	public String getDm_to_del() {
		return dm_to_del;
	}
	public void setDm_to_del(String dm_to_del) {
		this.dm_to_del = dm_to_del;
	}
	
	
	
	
}
