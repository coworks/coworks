package com.kh.coworks.pay.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Pay implements Serializable {
	private int emp_no;// ���
	private int pay_basepay;// �⺻��
	private int pay_jobtitle;// ��å����
	private int pay_overtime;// �������
	private int pay_hollyday;// ���ϼ���
	private int pay_bonus;// �󿩱�
	private int pay_meal;// �Ĵ�
	private int pay_transport;// �����
	private int pay_welfare;// �����Ļ�
	private int pay_others;// ��Ÿ
	private int pay_total;// �Ѿ�
	private Date pay_date;// ������

	public Pay() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Pay(int emp_no, int pay_basepay, int pay_jobtitle, int pay_overtime, int pay_hollyday, int pay_bonus,
			int pay_meal, int pay_transport, int pay_welfare, int pay_others, int pay_total, Date pay_date) {
		super();
		this.emp_no = emp_no;
		this.pay_basepay = pay_basepay;
		this.pay_jobtitle = pay_jobtitle;
		this.pay_overtime = pay_overtime;
		this.pay_hollyday = pay_hollyday;
		this.pay_bonus = pay_bonus;
		this.pay_meal = pay_meal;
		this.pay_transport = pay_transport;
		this.pay_welfare = pay_welfare;
		this.pay_others = pay_others;
		this.pay_total = pay_total;
		this.pay_date = pay_date;
	}

	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}

	public int getPay_basepay() {
		return pay_basepay;
	}

	public void setPay_basepay(int pay_basepay) {
		this.pay_basepay = pay_basepay;
	}

	public int getPay_jobtitle() {
		return pay_jobtitle;
	}

	public void setPay_jobtitle(int pay_jobtitle) {
		this.pay_jobtitle = pay_jobtitle;
	}

	public int getPay_overtime() {
		return pay_overtime;
	}

	public void setPay_overtime(int pay_overtime) {
		this.pay_overtime = pay_overtime;
	}

	public int getPay_hollyday() {
		return pay_hollyday;
	}

	public void setPay_hollyday(int pay_hollyday) {
		this.pay_hollyday = pay_hollyday;
	}

	public int getPay_bonus() {
		return pay_bonus;
	}

	public void setPay_bonus(int pay_bonus) {
		this.pay_bonus = pay_bonus;
	}

	public int getPay_meal() {
		return pay_meal;
	}

	public void setPay_meal(int pay_meal) {
		this.pay_meal = pay_meal;
	}

	public int getPay_transport() {
		return pay_transport;
	}

	public void setPay_transport(int pay_transport) {
		this.pay_transport = pay_transport;
	}

	public int getPay_welfare() {
		return pay_welfare;
	}

	public void setPay_welfare(int pay_welfare) {
		this.pay_welfare = pay_welfare;
	}

	public int getPay_others() {
		return pay_others;
	}

	public void setPay_others(int pay_others) {
		this.pay_others = pay_others;
	}

	public int getPay_total() {
		return pay_total;
	}

	public void setPay_total(int pay_total) {
		this.pay_total = pay_total;
	}

	public Date getPay_date() {
		return pay_date;
	}

	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}

	@Override
	public String toString() {
		return "Pay [emp_no=" + emp_no + ", pay_basepay=" + pay_basepay + ", pay_jobtitle=" + pay_jobtitle
				+ ", pay_overtime=" + pay_overtime + ", pay_hollyday=" + pay_hollyday + ", pay_bonus=" + pay_bonus
				+ ", pay_meal=" + pay_meal + ", pay_transport=" + pay_transport + ", pay_welfare=" + pay_welfare
				+ ", pay_others=" + pay_others + ", pay_total=" + pay_total + ", pay_date=" + pay_date + "]";
	}

}
