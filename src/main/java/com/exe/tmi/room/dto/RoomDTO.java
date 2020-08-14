package com.exe.tmi.room.dto;

import org.springframework.stereotype.Component;

// 방 ( room )
@Component("roomDTO")
public class RoomDTO {

	private int r_num; // 방 번호 (기본키)
	private int m_num; // 건물 번호 (참조키)
	private String r_name; // 방 이름
	private String r_content; // 방 설명
	private int r_inwon; // 방 기본 인원
	private int r_bath; // 화장실 개수
	private int r_bed; // 침대 수
	private int r_bedroom; // 침실 수
	private int r_price; // 방 가격 (기본 가격, 추가인원 변경 전)
	private double r_grade; // 방 별점
	private String r_mainimage;	// 방 메인이미지
	private String r_subimage;	// 방 서브이미지
	private int reviewcount;	// 리뷰갯수
	private String m_addr;	//건물 주소
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
