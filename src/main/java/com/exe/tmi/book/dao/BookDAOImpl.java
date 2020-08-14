package com.exe.tmi.book.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.exe.tmi.book.dto.BookDTO;
import com.exe.tmi.book.dto.BookingDTO;
import com.exe.tmi.book.dto.PointDTO;
import com.exe.tmi.mansion.dto.RoomListDTO;

@Repository("bookDAO")
public class BookDAOImpl implements BookDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public BookingDTO bookingInfo(int r_num) throws Exception {
		BookingDTO dto = sqlSession.selectOne("mapper.book.bookingInfo", r_num);
		return dto;
	}
	
	@Override
	public List<BookDTO> bookList(String email) throws Exception {
		List<BookDTO> lists = sqlSession.selectList("mapper.book.bookList", email);
		return lists;
	}

	@Override
	public int bookCount(String email) throws Exception {
		int bookCount = sqlSession.selectOne("mapper.book.bookCount",email);
		return bookCount;
	}

	@Override
	public BookDTO recentBookInfo(String email) throws Exception {
		BookDTO dto = sqlSession.selectOne("mapper.book.recentBookInfo", email);
		return dto;
	}

	@Override
	public List<RoomListDTO> activityBookInfo(String email) throws Exception {
		List<RoomListDTO> lists = sqlSession.selectList("mapper.book.activityBookInfo", email);
		return lists;
	}
	
	@Override
	public void book(BookDTO bookDTO) throws Exception {
		sqlSession.insert("mapper.book.book", bookDTO);
	}

	@Override
	public int maxBnum() throws Exception {
		return sqlSession.selectOne("mapper.book.maxBnum");
	}

	@Override
	public void log(PointDTO pointDTO) throws Exception {
		sqlSession.insert("mapper.book.log", pointDTO);		
	}

	@Override
	public int maxLnum() throws Exception {
		return sqlSession.selectOne("mapper.book.maxLnum");
	}	
	
	@Override
	public int totalBookCount() throws Exception {
		int totalbookCount  = sqlSession.selectOne("mapper.book.totalbookCount");
		return totalbookCount;
	}
	// 현재 예약된 리스트
	@Override
	public List<BookDTO> currentBookList() throws Exception {

		List<BookDTO> listsCR = sqlSession.selectList("mapper.book.currentBookList");

		return listsCR;
	}
	
}
