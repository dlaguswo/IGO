package com.exe.tmi.guest.service;

import java.util.List;
import java.util.Map;

import com.exe.tmi.guest.dto.GuestDTO;
import com.exe.tmi.guest.dto.ReservationListDTO;
import com.exe.tmi.mansion.dto.RoomListDTO;
import com.exe.tmi.post.dto.PostCommentDTO;

public interface GuestService {

	public String add(GuestDTO dto) throws Exception; //ȸ������
	public String overlapped(String email) throws Exception; //ID �ߺ�����
	public void check(String email) throws Exception; //�̸��� �ߺ�����
	public GuestDTO login(GuestDTO dto) throws Exception; //�α���
	public void newpassword(GuestDTO dto) throws Exception; //�н����� ����
	public GuestDTO kakaoLogin(String email) throws Exception; // īī�� �α���
	public void updateProfile(GuestDTO dto) throws Exception;  //������ ������Ʈ
	public String hostCheck(String email) throws Exception; //ȣ��Ʈ���� ����
	public List<PostCommentDTO> getListReviews(String host) throws Exception; //���������� ���� ��������
	public String getCoupons(String id) throws Exception;  //���������� ���� ��������
	public String getWishLists(String email) throws Exception; //���ø���Ʈ ��������
	public RoomListDTO getRoom(int r_num) throws Exception;//�� ���� ��������
	public int totalUserCount() throws Exception;	// �� ������ ��
	public int totalHostCount() throws Exception;	// ȣ��Ʈ�� ��
	public void updateWishList(String email, Map<String, Object> hmap) throws Exception; // ���ø���Ʈ �����ϱ�
	public List<ReservationListDTO> getReservationList(String email) throws Exception; //ajax list ��ȸ(���� Ȯ����,���)
	public void setReservationUpdate(ReservationListDTO dto) throws Exception; //���� ������Ʈ
	public List<ReservationListDTO> getReservationList_A(String email) throws Exception; //�����ϰ� ���� ��ȸ
	public void reservationDelete(int b_num) throws Exception; //������� 
	public ReservationListDTO reservationSMS(int b_num) throws Exception; //��������
	public void deleteGuest(String email) throws Exception; //ȸ��Ż��
	public String selectEmail(int r_num) throws Exception;
}
