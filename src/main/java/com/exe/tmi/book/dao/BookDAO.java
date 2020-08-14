package com.exe.tmi.book.dao;

import java.util.List;

import com.exe.tmi.book.dto.BookDTO;
import com.exe.tmi.book.dto.BookingDTO;
import com.exe.tmi.book.dto.PointDTO;
import com.exe.tmi.mansion.dto.RoomListDTO;

public interface BookDAO {

	public BookingDTO bookingInfo(int r_num) throws Exception;
	public List<BookDTO> bookList(String email) throws Exception;
	public int bookCount(String email) throws Exception;
	public BookDTO recentBookInfo(String email) throws Exception;
	public List<RoomListDTO> activityBookInfo (String email) throws Exception;
	public void book(BookDTO bookDTO) throws Exception; //예약정보 insert
	public int maxBnum() throws Exception; //book 테이블 maxnum
	public void log(PointDTO pointDTO) throws Exception;
	public int maxLnum() throws Exception;//logused 테이블 maxnum
	public int totalBookCount() throws Exception; // 총 예약 갯수
	public List<BookDTO> currentBookList() throws Exception;	// 현재 예약된 리스트
}
