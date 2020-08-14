package com.exe.tmi.main.dto;

import org.springframework.stereotype.Component;

@Component("monthsChartDTO")
public class MonthsChartDTO {
	
	private String mc_startMonths;		// 예약 시작일
	private String mc_endMonths;		// 예약 종료일
	private int mc_count;		//  총 예약 횟수
	private int mc_price;		// 총 예약 가격
	
	
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
