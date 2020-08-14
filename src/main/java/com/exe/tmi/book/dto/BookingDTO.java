package com.exe.tmi.book.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

// ���� ( book )
//DB(������ �������� ���� DTO)
@Component("bookingDTO")
public class BookingDTO {

	private int b_num; // �����ȣ (�⺻Ű)
	private int r_num; // �� ��ȣ (����Ű)
	private Date checkin; // üũ�γ�¥(date)
	private Date checkout; // üũ�ƿ���¥(date)
	private int b_inwon; // ���� �ο� ( �� �ο��� �� )
	private int b_price; // ���� ���� ( �氡�� + �߰��ο� )
	private int m_num; // �ǹ� ��ȣ
	private String m_name; //�ǹ� �̸�
	private String m_addr; //�ǹ� �ּ�
	private String m_tel; // �ǹ� ��ȭ
	private String r_name; // �� �̸�
	private String r_content; // �� ����
	private int r_inwon; //�� �ش� �ο�
	private int r_price; //�� �ش� ����

	public int getB_num() {
		return b_num;
	}

	public void setB_num(int b_num) {
		this.b_num = b_num;
	}

	public int getR_num() {
		return r_num;
	}

	public void setR_num(int r_num) {
		this.r_num = r_num;
	}

	public Date getCheckin() {
		return checkin;
	}

	public void setCheckin(Date checkin) {
		this.checkin = checkin;
	}

	public Date getCheckout() {
		return checkout;
	}

	public void setCheckout(Date checkout) {
		this.checkout = checkout;
	}

	public int getB_inwon() {
		return b_inwon;
	}

	public void setB_inwon(int b_inwon) {
		this.b_inwon = b_inwon;
	}

	public int getB_price() {
		return b_price;
	}

	public void setB_price(int b_price) {
		this.b_price = b_price;
	}
	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
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

	public int getR_price() {
		return r_price;
	}

	public void setR_price(int r_price) {
		this.r_price = r_price;
	}

}
