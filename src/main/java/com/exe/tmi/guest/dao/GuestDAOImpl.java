package com.exe.tmi.guest.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.exe.tmi.guest.dto.GuestDTO;
import com.exe.tmi.guest.dto.ReservationListDTO;
import com.exe.tmi.mansion.dto.RoomListDTO;
import com.exe.tmi.post.dto.PostCommentDTO;

@Repository("guestDAO")
public class GuestDAOImpl implements GuestDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public String insertData(GuestDTO dto) throws DataAccessException {
		sqlSession.insert("mapper.guest.insertData", dto);
		return "insertSuccess";
	}

	@Override
	public String selectOverlappedID(String email) throws DataAccessException {
		return sqlSession.selectOne("mapper.guest.selectOverlappedID", email);
	}

	@Override
	public void emailCheck(String email) throws DataAccessException {
		sqlSession.update("mapper.guest.emailCheck", email);		
	}

	@Override
	public GuestDTO login(GuestDTO dto) throws DataAccessException {
		return sqlSession.selectOne("mapper.guest.login", dto);
	}

	@Override
	public void newpassword(GuestDTO dto) throws DataAccessException {
		sqlSession.update("mapper.guest.newpassword", dto);		
	}
	
	@Override
	public GuestDTO kakaoLogin(String email) throws Exception {
		return sqlSession.selectOne("mapper.guest.kakaoLogin", email);
	}
	
	@Override
	public void updateProfile(GuestDTO dto) throws DataAccessException {
		sqlSession.update("mapper.guest.updateprofile", dto);				
	}

	@Override
	public String hostCheck(String email) throws Exception {
		String hostCheck = sqlSession.selectOne("mapper.guest.hostCheck", email);
		return hostCheck;
	}
	
	@Override
	public List<PostCommentDTO> getListReviews(String host) throws DataAccessException {
		return sqlSession.selectList("mapper.guest.getListReviews", host);
	}
	
	@Override
	public String getCoupons(String id) throws DataAccessException {
		return sqlSession.selectOne("mapper.guest.getCoupons", id);
	}
	
	@Override
	public String getWishLists(String email) throws DataAccessException {
		return sqlSession.selectOne("mapper.guest.getWishLists", email);
	}

	@Override
	public RoomListDTO getRoom(int r_num) throws Exception {		
		return sqlSession.selectOne("mapper.guest.getRoom", r_num);
	}
	
	@Override
	public int totalUserCount() throws Exception {
		int userCount = sqlSession.selectOne("mapper.guest.userCount");
		return userCount;
	}

	@Override
	public int totalHostCount() throws Exception {
		int hostCount = sqlSession.selectOne("mapper.guest.hostCount");
		return hostCount;
	}	
	
	@Override
	public void updateWishList(String email, Map<String, Object> hmap) throws Exception {
		sqlSession.update("mapper.guest.updateWishList", hmap);		
	}

	@Override
	public List<ReservationListDTO> getReservationList(String email) throws Exception{
		return sqlSession.selectList("mapper.guest.getReservationList", email);
	}
	
	@Override
	public void setReservationUpdate(ReservationListDTO dto) throws Exception{
		sqlSession.update("mapper.guest.setReservationUpdate",dto);
	}
	
	@Override
	public List<ReservationListDTO> getReservationList_A(String email) throws Exception{
		return sqlSession.selectList("mapper.guest.getReservationList_A", email);
	}
	
	@Override
	public void reservationDelete(int b_num) throws Exception{
		sqlSession.delete("mapper.guest.reservationDelete",b_num);
	}
	
	@Override
	public ReservationListDTO reservationSMS(int b_num) throws Exception{
		return sqlSession.selectOne("mapper.guest.reservationSMS",b_num);
	}

	@Override
	public void deleteGuest(String email) throws Exception {
		sqlSession.delete("mapper.guest.deleteGuest", email);
	}

	@Override
	public String selectEmail(int r_num) throws Exception {
		String email = sqlSession.selectOne("mapper.guest.selectEmail",r_num);
		return email;
	}
	
	
}
