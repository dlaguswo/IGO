package com.exe.tmi.book.service;

import java.util.List;

import com.exe.tmi.book.dto.BookDTO;
import com.exe.tmi.book.dto.BookingDTO;
import com.exe.tmi.book.dto.PointDTO;
import com.exe.tmi.mansion.dto.RoomListDTO;

public interface BookService {

	public BookingDTO bookingInfo(int r_num) throws Exception;
	public List<BookDTO> bookList(String email) throws Exception;
	public int bookCount(String email)throws Exception;
	public BookDTO recentBookInfo (String email) throws Exception;
	public List<RoomListDTO> activityBookInfo (String email) throws Exception;
	public void book(BookDTO bookDTO, PointDTO pointDTO) throws Exception; // �� �����ϱ�
	public int maxBnum() throws Exception;
	public int maxLnum() throws Exception;
	public int totalBookCount() throws Exception;// �� ���� ����
	public List<BookDTO> currentBookList() throws Exception;	// ���� ����� ����Ʈ
}
