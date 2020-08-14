package com.exe.tmi.guest.dto;

import org.springframework.stereotype.Component;


@Component("guestDTO")
public class GuestDTO {

	private String pwd; //�н�����
	private String name; //�̸�
	private String email; //�̸���
	private String tel; //��ȭ��ȣ
	private int hostcheck; //ȣ��Ʈ ����
	private int point; //����Ʈ
	private String coupon; //����
	private String created; //������¥
	private int emailcheck; //�̸��� �ߺ� üũ
	private String wishlist; //����
	private String profileimage; //������ �̹���
	
	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public int getHostcheck() {
		return hostcheck;
	}

	public void setHostcheck(int hostcheck) {
		this.hostcheck = hostcheck;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getCoupon() {
		return coupon;
	}

	public void setCoupon(String coupon) {
		this.coupon = coupon;
	}

	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
	}

	public int getEmailcheck() {
		return emailcheck;
	}

	public void setEmailcheck(int emailcheck) {
		this.emailcheck = emailcheck;
	}

	public String getWishlist() {
		return wishlist;
	}

	public void setWishlist(String wishlist) {
		this.wishlist = wishlist;
	}

	public String getProfileimage() {
		return profileimage;
	}

	public void setProfileimage(String profileimage) {
		this.profileimage = profileimage;
	}
	
}
