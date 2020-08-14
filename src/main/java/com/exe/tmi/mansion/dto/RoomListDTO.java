package com.exe.tmi.mansion.dto;

import org.springframework.stereotype.Component;

// �ѷ��ִ� �� ����Ʈ (roomList)
@Component("roomListDTO")
public class RoomListDTO {

	private int r_num; // �� ��ȣ
	private String r_name;	//�� �̸�
	private double r_grade;	//�� ����
	private int hitcount;	//�� ��ȸ��
	private int p_count;	//�� ���� ����
	private String m_name;	//�ǹ� �̸�
	private String m_addr;	//�ǹ� �ּ�
	private String m_tel;	//�ǹ� ��ȭ��ȣ
	private String email; // ���� ���̵� ( ȣ��Ʈ ���̵� ) 
	private int cate_num; // ī�װ� ��ȣ 	
	private String r_mainimage;	//�� �����̹���
	private String r_subimage;	//�� �����̹���
	private String cate_name;	//ī�װ� �̸�
	private String checkin;
	private String checkout;
	private String name;
	private String wishList;
	
	private int usepoint;
	private int addpoint;
	
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public double getR_grade() {
		return r_grade;
	}
	public void setR_grade(double r_grade) {
		this.r_grade = r_grade;
	}
	public int getHitcount() {
		return hitcount;
	}
	public void setHitcount(int hitcount) {
		this.hitcount = hitcount;
	}
	public int getP_count() {
		return p_count;
	}
	public void setP_count(int p_count) {
		this.p_count = p_count;
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
	public String getCate_name() {
		return cate_name;
	}
	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public String getCheckout() {
		return checkout;
	}
	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getWishList() {
		return wishList;
	}
	public void setWishList(String wishList) {
		this.wishList = wishList;
	}
	public int getAddpoint() {
		return addpoint;
	}
	public void setAddpoint(int addpoint) {
		this.addpoint = addpoint;
	}
	public int getUsepoint() {
		return usepoint;
	}
	public void setUsepoint(int usepoint) {
		this.usepoint = usepoint;
	}
	
}
