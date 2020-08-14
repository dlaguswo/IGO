package com.exe.tmi.guest.service;

import java.util.List;
import java.util.Map;

import com.exe.tmi.guest.dto.GuestDTO;
import com.exe.tmi.guest.dto.ReservationListDTO;
import com.exe.tmi.mansion.dto.RoomListDTO;
import com.exe.tmi.post.dto.PostCommentDTO;

public interface GuestService {

	public String add(GuestDTO dto) throws Exception; //회원가입
	public String overlapped(String email) throws Exception; //ID 중복방지
	public void check(String email) throws Exception; //이메일 중복방지
	public GuestDTO login(GuestDTO dto) throws Exception; //로그인
	public void newpassword(GuestDTO dto) throws Exception; //패스워드 변경
	public GuestDTO kakaoLogin(String email) throws Exception; // 카카오 로그인
	public void updateProfile(GuestDTO dto) throws Exception;  //프로필 업데이트
	public String hostCheck(String email) throws Exception; //호스트인지 여부
	public List<PostCommentDTO> getListReviews(String host) throws Exception; //마이페이지 리뷰 가져오기
	public String getCoupons(String id) throws Exception;  //마이페이지 쿠폰 가져오기
	public String getWishLists(String email) throws Exception; //위시리스트 가져오기
	public RoomListDTO getRoom(int r_num) throws Exception;//방 정보 가져오기
	public int totalUserCount() throws Exception;	// 총 유저의 수
	public int totalHostCount() throws Exception;	// 호스트의 수
	public void updateWishList(String email, Map<String, Object> hmap) throws Exception; // 위시리스트 삭제하기
	public List<ReservationListDTO> getReservationList(String email) throws Exception; //ajax list 조회(예약 확인전,취소)
	public void setReservationUpdate(ReservationListDTO dto) throws Exception; //수락 업데이트
	public List<ReservationListDTO> getReservationList_A(String email) throws Exception; //수락하고 나서 조회
	public void reservationDelete(int b_num) throws Exception; //예약삭제 
	public ReservationListDTO reservationSMS(int b_num) throws Exception; //문자전송
	public void deleteGuest(String email) throws Exception; //회원탈퇴
	public String selectEmail(int r_num) throws Exception;
}
