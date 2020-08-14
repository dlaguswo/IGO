package com.exe.tmi.post.dto;

import org.springframework.stereotype.Component;

@Component("postCommentDTO")
public class PostCommentDTO {

	private String email; // 이메일
	private int p_num; // 댓글 번호
	private String r_name; // 방 이름
	private String name; // 작성자
	private int p_grade; // 평점
	private String p_content; // 리뷰 내용
	private String p_imagename; // 리뷰 이미지
	private String p_created; // 작성 일자
	private String profileimage; // 작성자 이미지

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}

	public String getR_name() {
		return r_name;
	}

	public void setR_name(String r_name) {
		this.r_name = r_name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getP_grade() {
		return p_grade;
	}

	public void setP_grade(int p_grade) {
		this.p_grade = p_grade;
	}

	public String getP_content() {
		return p_content;
	}

	public void setP_content(String p_content) {
		this.p_content = p_content;
	}

	public String getP_imagename() {
		return p_imagename;
	}

	public void setP_imagename(String p_imagename) {
		this.p_imagename = p_imagename;
	}

	public String getP_created() {
		return p_created;
	}

	public void setP_created(String p_created) {
		this.p_created = p_created;
	}

	public String getProfileimage() {
		return profileimage;
	}

	public void setProfileimage(String profileimage) {
		this.profileimage = profileimage;
	}

}
