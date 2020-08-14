package com.exe.tmi.guest.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.exe.tmi.guest.dto.GuestDTO;
import com.exe.tmi.guest.dto.ReservationListDTO;
import com.exe.tmi.mansion.dto.RoomListDTO;
import com.exe.tmi.post.dto.PostCommentDTO;

public interface GuestDAO {

	public String insertData(GuestDTO dto) throws DataAccessException; //ȸ������
	public String selectOverlappedID(String email) throws DataAccessException; //ID �ߺ�����
	public void emailCheck(String email) throws DataAccessException; //�̸��� �ߺ�����
	public GuestDTO login(GuestDTO dto) throws DataAccessException; //�α���
	public void newpassword(GuestDTO dto) throws DataAccessException; //�н����� ����
	public GuestDTO kakaoLogin(String email) throws Exception;// īī�� �α���
	public void updateProfile(GuestDTO dto) throws DataAccessException; //������ ������Ʈ
	public String hostCheck(String email) throws Exception; //ȣ��Ʈ���� ����
	public List<PostCommentDTO> getListReviews(String host) throws DataAccessException; //���������� ���� ��������
	public String getCoupons(String id) throws DataAccessException; //���������� ���� ��������
	public String getWishLists(String email) throws DataAccessException; //���ø���Ʈ ��������
	public RoomListDTO getRoom(int r_num) throws Exception; //�� ���� ��������
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
