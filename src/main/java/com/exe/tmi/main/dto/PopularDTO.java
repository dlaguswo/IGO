package com.exe.tmi.main.dto;

import org.springframework.stereotype.Component;

@Component("popularDTO")
public class PopularDTO {
	
	private int r_num;		// ���ȣ
	private String r_mainimage;		// �� ���� �̹���
	private String r_name;		// �� �̸�
	private String email;	// ȣ��Ʈ �̸���
	private int hitCount;		// ��ȸ��
	private String cate_name;	// ī�װ� �̸�
	private int r_grade;		// ����
	
	
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
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getHitCount() {
		return hitCount;
	}
	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}
	public String getCate_name() {
		return cate_name;
	}
	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}
	public int getR_grade() {
		return r_grade;
	}
	public void setR_grade(int r_grade) {
		this.r_grade = r_grade;
	}
	
	
	

}
