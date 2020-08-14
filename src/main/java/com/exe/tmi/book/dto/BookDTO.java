package com.exe.tmi.book.dto;

import org.springframework.stereotype.Component;

// 예약 ( book )
@Component("bookDTO")
public class BookDTO {

	private int b_num; // 예약번호 (기본키)
	private int r_num; // 방 번호 (참조키)
	private String email; // 호스트 이름 이메일
	private String checkin; // 체크인날짜(date)
	private String checkout; // 체크아웃날짜(date)
	private int b_inwon; // 예약 인원 ( 방 인원과 비교 )
	private int b_price; // 예약 가격 ( 방가격 + 추가인원 )
	private String name; //예약자 (DB쿼리문에서 받기 위해서)
	private String r_mainimage;// 예약 방 사진
	private int bookcheck; //예약 승인 취소 확인
	private String r_name; //dashboard에서 사용
	private String m_name; //booking 결제시 필요
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
