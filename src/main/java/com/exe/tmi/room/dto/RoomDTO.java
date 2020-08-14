package com.exe.tmi.room.dto;

import org.springframework.stereotype.Component;

// �� ( room )
@Component("roomDTO")
public class RoomDTO {

	private int r_num; // �� ��ȣ (�⺻Ű)
	private int m_num; // �ǹ� ��ȣ (����Ű)
	private String r_name; // �� �̸�
	private String r_content; // �� ����
	private int r_inwon; // �� �⺻ �ο�
	private int r_bath; // ȭ��� ����
	private int r_bed; // ħ�� ��
	private int r_bedroom; // ħ�� ��
	private int r_price; // �� ���� (�⺻ ����, �߰��ο� ���� ��)
	private double r_grade; // �� ����
	private String r_mainimage;	// �� �����̹���
	private String r_subimage;	// �� �����̹���
	private int reviewcount;	// ���䰹��
	private String m_addr;	//�ǹ� �ּ�
	private String f_num; //facility
	private String s_num; //space
	private String m_name;
	
	private int hitcount;

	public int getR_num() {
		return r_num;
	}

	public void setR_num(int r_num) {
		this.r_num = r_num;
	}

	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
	}

	public String getR_name() {
		return r_name;
	}

	public void setR_name(String r_name) {
		this.r_name = r_name;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public int getR_inwon() {
		return r_inwon;
	}

	public void setR_inwon(int r_inwon) {
		this.r_inwon = r_inwon;
	}

	public int getR_bath() {
		return r_bath;
	}

	public void setR_bath(int r_bath) {
		this.r_bath = r_bath;
	}

	public int getR_bed() {
		return r_bed;
	}

	public void setR_bed(int r_bed) {
		this.r_bed = r_bed;
	}

	public int getR_bedroom() {
		return r_bedroom;
	}

	public void setR_bedroom(int r_bedroom) {
		this.r_bedroom = r_bedroom;
	}

	public int getR_price() {
		return r_price;
	}

	public void setR_price(int r_price) {
		this.r_price = r_price;
	}

	public double getR_grade() {
		return r_grade;
	}

	public void setR_grade(double r_grade) {
		this.r_grade = r_grade;
	}

	public String getR_mainimage() {
		return r_mainimage;
	}

	public void setR_mainimage(String r_mainimage) {
		this.r_mainimage = r_mainimage;
	}

	public String getR_subimage() {
		return r_subimage;
	}

	public void setR_subimage(String r_subimage) {
		this.r_subimage = r_subimage;
	}

	public int getReviewcount() {
		return reviewcount;
	}

	public void setReviewcount(int reviewcount) {
		this.reviewcount = reviewcount;
	}

	public String getM_addr() {
		return m_addr;
	}

	public void setM_addr(String m_addr) {
		this.m_addr = m_addr;
	}
	public String getF_num() {
		return f_num;
	}

	public void setF_num(String f_num) {
		this.f_num = f_num;
	}

	public String getS_num() {
		return s_num;
	}

	public void setS_num(String s_num) {
		this.s_num = s_num;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public int getHitcount() {
		return hitcount;
	}

	public void setHitcount(int hitcount) {
		this.hitcount = hitcount;
	}
	
}
