package com.exe.tmi.guest.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exe.tmi.guest.dao.GuestDAO;
import com.exe.tmi.guest.dto.GuestDTO;
import com.exe.tmi.guest.dto.ReservationListDTO;
import com.exe.tmi.mansion.dto.RoomListDTO;
import com.exe.tmi.post.dto.PostCommentDTO;

@Service("guestService")
public class GuestServiceImpl implements GuestService {

	@Autowired
	private GuestDAO guestDAO;
	
	@Override
	public String add(GuestDTO dto) throws Exception {
		guestDAO.insertData(dto);
		return null;
	}

	@Override
	public String overlapped(String email) throws Exception {
		return guestDAO.selectOverlappedID(email);
	}
	
	@Override
	public void check(String email) throws Exception {
		guestDAO.emailCheck(email);		
	}

	@Override
	public GuestDTO login(GuestDTO dto) throws Exception {
		return guestDAO.login(dto);
	}

	@Override
	public void newpassword(GuestDTO dto) throws Exception {
		guestDAO.newpassword(dto);
	}
	
	@Override
	public GuestDTO kakaoLogin(String email) throws Exception {
		return guestDAO.kakaoLogin(email);
	}
	
	@Override
	public void updateProfile(GuestDTO dto) throws Exception {
		guestDAO.updateProfile(dto);
		
	}

	@Override
	public String hostCheck(String email) throws Exception {
		String hostCheck = guestDAO.hostCheck(email);
		return hostCheck;
	}
	
	@Override
	public List<PostCommentDTO> getListReviews(String host) throws Exception {
		return guestDAO.getListReviews(host);
	}
	
	@Override
	public String getCoupons(String id) throws Exception {
		return guestDAO.getCoupons(id);	
	}
	
	@Override
	public String getWishLists(String email) throws Exception {		
		return guestDAO.getWishLists(email);
	}

	@Override
	public RoomListDTO getRoom(int r_num) throws Exception {
		return guestDAO.getRoom(r_num);
	}
	
	@Override
	public int totalUserCount() throws Exception {
		int userCount = guestDAO.totalUserCount();
		return userCount;
	}

	@Override
	public int totalHostCount() throws Exception {
		int hostCount = guestDAO.totalHostCount();
		return hostCount;
	}
	
	@Override
	public void updateWishList(String email, Map<String, Object> hmap) throws Exception {
		guestDAO.updateWishList(email, hmap);
	}
	
	@Override
	public List<ReservationListDTO> getReservationList(String email) throws Exception {
		return guestDAO.getReservationList(email);
	}
	
	@Override
	public void setReservationUpdate(ReservationListDTO dto) throws Exception {
		guestDAO.setReservationUpdate(dto);
	}
	
	@Override
	public List<ReservationListDTO> getReservationList_A(String email) throws Exception{
		return guestDAO.getReservationList_A(email);
	}
	
	@Override
	public void reservationDelete(int b_num) throws Exception{
		guestDAO.reservationDelete(b_num);
	}
	
	@Override
	public ReservationListDTO reservationSMS(int b_num) throws Exception{
		return guestDAO.reservationSMS(b_num);
	}

	@Override
	public void deleteGuest(String email) throws Exception {
		guestDAO.deleteGuest(email);	
	}

	@Override
	public String selectEmail(int r_num) throws Exception {
		String email = guestDAO.selectEmail(r_num);
		return email;
	}
	
	
}
