package com.exe.tmi.guest.dto;

import org.springframework.stereotype.Component;


@Component("guestDTO")
public class GuestDTO {

	private String pwd; //패스워드
	private String name; //이름
	private String email; //이메일
	private String tel; //전화번호
	private int hostcheck; //호스트 여부
	private int point; //포인트
	private String coupon; //쿠폰
	private String created; //생성날짜
	private int emailcheck; //이메일 중복 체크
	private String wishlist; //찜목록
	private String profileimage; //프로필 이미지
	
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
