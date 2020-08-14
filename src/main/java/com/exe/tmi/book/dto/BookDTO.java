package com.exe.tmi.book.dto;

import org.springframework.stereotype.Component;

// ���� ( book )
@Component("bookDTO")
public class BookDTO {

	private int b_num; // �����ȣ (�⺻Ű)
	private int r_num; // �� ��ȣ (����Ű)
	private String email; // ȣ��Ʈ �̸� �̸���
	private String checkin; // üũ�γ�¥(date)
	private String checkout; // üũ�ƿ���¥(date)
	private int b_inwon; // ���� �ο� ( �� �ο��� �� )
	private int b_price; // ���� ���� ( �氡�� + �߰��ο� )
	private String name; //������ (DB���������� �ޱ� ���ؼ�)
	private String r_mainimage;// ���� �� ����
	private int bookcheck; //���� ���� ��� Ȯ��
	private String r_name; //dashboard���� ���
	private String m_name; //booking ������ �ʿ�
	private String m_addr;
	private String m_tel;

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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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
	

	public String getR_name() {
		return r_name;
	}

	public void setR_name(String r_name) {
		this.r_name = r_name;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getR_mainimage() {
		return r_mainimage;
	}

	public void setR_mainimage(String r_mainimage) {
		this.r_mainimage = r_mainimage;
	}

	public int getBookcheck() {
		return bookcheck;
	}
	public void setBookcheck(int bookcheck) {
		this.bookcheck = bookcheck;
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

}
