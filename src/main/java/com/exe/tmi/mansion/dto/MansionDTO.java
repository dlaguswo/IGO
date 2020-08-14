package com.exe.tmi.mansion.dto;

import org.springframework.stereotype.Component;

// 건물 ( mansion )
@Component("mansionDTO")
public class MansionDTO {

	private int m_num; // 건물 번호 (기본키)
	private String email; // 유저 아이디 ( 호스트 아이디 ) ( 참조키 )
	private int cate_num; // 카테고리 번호 ( 참조키 )
	private String m_name; // 건물 이름
	private String m_addr; // 건물 주소
	private String m_tel;	//	전화번호
	private String cate_name;	// 카테고리 이름
	private int r_num;

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

	public String getM_tel() {
		return m_tel;
	}

	public void setM_tel(String m_tel) {
		this.m_tel = m_tel;
	}
	public String getCate_name() {
		return cate_name;
	}

	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}
	public int getR_num() {
		return r_num;
	}

	public void setR_num(int r_num) {
		this.r_num = r_num;
	}


}
