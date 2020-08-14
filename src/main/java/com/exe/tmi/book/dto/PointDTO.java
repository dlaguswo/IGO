package com.exe.tmi.book.dto;

import org.springframework.stereotype.Component;

// 포인트,쿠폰 사용 로그 테이블 - logused
@Component("pointDTO")
public class PointDTO {

	private int l_num; // 로그 번호
	private String email; // 유저 아이디(참조키)
	private int cp_num; // 쿠폰번호(참조키)
	private int usepoint; // 사용 포인트
	private int addpoint; // 예약시 추가 포인트
	
	public int getL_num() {
		return l_num;
	}
	public void setL_num(int l_num) {
		this.l_num = l_num;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getCp_num() {
		return cp_num;
	}
	public void setCp_num(int cp_num) {
		this.cp_num = cp_num;
	}
	public int getUsepoint() {
		return usepoint;
	}
	public void setUsepoint(int usepoint) {
		this.usepoint = usepoint;
	}
	public double getAddpoint() {
		return addpoint;
	}
	public void setAddpoint(int addpoint) {
		this.addpoint = addpoint;
	}
	

}
