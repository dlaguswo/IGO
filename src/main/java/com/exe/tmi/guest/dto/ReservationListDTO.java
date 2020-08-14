package com.exe.tmi.guest.dto;

public class ReservationListDTO {
	
	//DB
	private int b_num;
	private int r_num;
	private String email;
	private String checkin;
	private String checkout;
	private int b_inwon;
	private int b_price;
	private String r_name;
	private String m_name;
	private String r_mainimage;
	private String name;
	private int bookcheck;
	private String tel;
	
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
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
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getR_mainimage() {
		return r_mainimage;
	}
	public void setR_mainimage(String r_mainimage) {
		this.r_mainimage = r_mainimage;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getBookcheck() {
		return bookcheck;
	}
	public void setBookcheck(int bookcheck) {
		this.bookcheck = bookcheck;
	}
	
}
