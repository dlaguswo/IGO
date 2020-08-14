package com.exe.tmi.book.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exe.tmi.book.dao.BookDAO;
import com.exe.tmi.book.dto.BookDTO;
import com.exe.tmi.book.dto.BookingDTO;
import com.exe.tmi.book.dto.PointDTO;
import com.exe.tmi.mansion.dto.RoomListDTO;

@Service("bookService")
public class BookServiceImpl implements BookService {

	@Autowired
	private BookDAO bookDAO;

	@Override
	public BookingDTO bookingInfo(int r_num) throws Exception {
		BookingDTO dto = bookDAO.bookingInfo(r_num);
		return dto;
	}
	
	@Override
	public List<BookDTO> bookList(String email) throws Exception {
		List<BookDTO> lists = bookDAO.bookList(email);
		return lists;
	}

	@Override
	public int bookCount(String email) throws Exception {
		int bookCount = bookDAO.bookCount(email);
		return bookCount;
	}

	@Override
	public BookDTO recentBookInfo(String email) throws Exception {
		BookDTO dto = bookDAO.recentBookInfo(email);
		return dto;
	}

	@Override
	public List<RoomListDTO> activityBookInfo(String email) throws Exception {
		List<RoomListDTO> lists = bookDAO.activityBookInfo(email);
		return lists;
	}
	
	@Override
	public void book(BookDTO bookDTO, PointDTO pointDTO) throws Exception {
		bookDAO.book(bookDTO); // 예약하기
		bookDAO.log(pointDTO); // 로고 저장
	}

	@Override
	public int maxBnum() throws Exception {
		return bookDAO.maxBnum();
	}

	@Override
	public int maxLnum() throws Exception {
		return bookDAO.maxLnum();
	}
	
	@Override
	public int totalBookCount() throws Exception {
		int totalbookCount = bookDAO.totalBookCount();	
		return totalbookCount;
	}
	// 현재 예약된 리스트
	@Override
	public List<BookDTO> currentBookList() throws Exception {
		List<BookDTO> listsCR = bookDAO.currentBookList();
		return listsCR;
	}
	
}
