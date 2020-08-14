package com.exe.tmi.book.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

// 예약 ( book )
//DB(쿼리문 받으려고 만든 DTO)
@Component("bookingDTO")
public class BookingDTO {

	private int b_num; // 예약번호 (기본키)
	private int r_num; // 방 번호 (참조키)
	private Date checkin; // 체크인날짜(date)
	private Date checkout; // 체크아웃날짜(date)
	private int b_inwon; // 예약 인원 ( 방 인원과 비교 )
	private int b_price; // 예약 가격 ( 방가격 + 추가인원 )
	private int m_num; // 건물 번호
	private String m_name; //건물 이름
	private String m_addr; //건물 주소
	private String m_tel; // 건물 전화
	private String r_name; // 방 이름
	private String r_content; // 방 정보
	private int r_inwon; //방 해당 인원
	private int r_price; //방 해당 가격

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
