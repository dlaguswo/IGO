package com.exe.tmi.main.dto;

import org.springframework.stereotype.Component;

@Component("monthsChartDTO")
public class MonthsChartDTO {
	
	private String mc_startMonths;		// ���� ������
	private String mc_endMonths;		// ���� ������
	private int mc_count;		//  �� ���� Ƚ��
	private int mc_price;		// �� ���� ����
	
	
	public String getMc_startMonths() {
		return mc_startMonths;
	}
	public void setMc_startMonths(String mc_startMonths) {
		this.mc_startMonths = mc_startMonths;
	}
	public String getMc_endMonths() {
		return mc_endMonths;
	}
	public void setMc_endMonths(String mc_endMonths) {
		this.mc_endMonths = mc_endMonths;
	}
	public int getMc_count() {
		return mc_count;
	}
	public void setMc_count(int mc_count) {
		this.mc_count = mc_count;
	}
	public int getMc_price() {
		return mc_price;
	}
	public void setMc_price(int mc_price) {
		this.mc_price = mc_price;
	}
	
	
	
	
	
	

}
