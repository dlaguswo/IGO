package com.exe.tmi.book.dto;

import org.springframework.stereotype.Component;

// ����Ʈ,���� ��� �α� ���̺� - logused
@Component("pointDTO")
public class PointDTO {

	private int l_num; // �α� ��ȣ
	private String email; // ���� ���̵�(����Ű)
	private int cp_num; // ������ȣ(����Ű)
	private int usepoint; // ��� ����Ʈ
	private int addpoint; // ����� �߰� ����Ʈ
	
	public int getL_num() {
		return l_num;
	}
	public void setL_num(int l_num) {
		this.l_num = l_num;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getCp_num() {
		return cp_num;
	}
	public void setCp_num(int cp_num) {
		this.cp_num = cp_num;
	}
	public int getUsepoint() {
		return usepoint;
	}
	public void setUsepoint(int usepoint) {
		this.usepoint = usepoint;
	}
	public double getAddpoint() {
		return addpoint;
	}
	public void setAddpoint(int addpoint) {
		this.addpoint = addpoint;
	}
	

}
