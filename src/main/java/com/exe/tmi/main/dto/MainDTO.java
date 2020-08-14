package com.exe.tmi.main.dto;

import org.springframework.stereotype.Component;

@Component("mainDTO")
public class MainDTO {

	private int m_num; //건물번호
	private String email; //이메일
	private int cate_num; //건물의 종류
	private String m_name;  //건물 이름
	private String m_addr; //건물 주소
	private int r_num; //룸번호
	private String r_mainimage; //룸 메인 이미지
	private int hitcount; //조회수
	private String cate_name; //건물 종류의 이름 ex> 1=호텔

	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getCate_num() {
		return cate_num;
	}

	public void setCate_num(int cate_num) {
		this.cate_num = cate_num;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_addr() {
		return m_addr;
	}

	public void setM_addr(String m_addr) {
		this.m_addr = m_addr;
	}
	
	public int getR_num() {
		return r_num;
	}

	public void setR_num(int r_num) {
		this.r_num = r_num;
	}

	public String getR_mainimage() {
		return r_mainimage;
	}

	public void setR_mainimage(String r_mainimage) {
		this.r_mainimage = r_mainimage;
	}

	public int getHitcount() {
		return hitcount;
	}

	public void setHitcount(int hitcount) {
		this.hitcount = hitcount;
	}
	
	public String getCate_name() {
		return cate_name;
	}

	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}

}
