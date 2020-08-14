package com.exe.tmi.room.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exe.tmi.book.dto.BookDTO;
import com.exe.tmi.room.dao.RoomDAO;
import com.exe.tmi.room.dto.HostDTO;
import com.exe.tmi.room.dto.RoomDTO;

@Service("roomService")
public class RoomServiceImpl implements RoomService{

	@Autowired
	private RoomDAO roomDAO;

	@Override
	public void updateHitCount(int r_num) throws Exception {
		roomDAO.updateHitCount(r_num);
	}

	@Override
	public int getMaxNum() throws Exception {
		int maxNum = roomDAO.getMaxNum();
		return maxNum;
	}

	@Override
	public void insertData(RoomDTO rdto) throws Exception {
		roomDAO.insertData(rdto);
		
	}

	@Override
	public void insertArrayData(RoomDTO roomsub) throws Exception {
		roomDAO.insertDetailData(roomsub);	
	}

	@Override
	public void insertImageData(RoomDTO roomimage) throws Exception {
		roomDAO.insertImageData(roomimage);
		
	}

	@Override
	public List<HostDTO> hostData(String email) throws Exception {
		List<HostDTO> lists = roomDAO.hostData(email);
		System.out.println(email);
		return lists;
	}

	@Override
	public HostDTO hostUpdateData(String r_num) throws Exception {
		HostDTO dto = roomDAO.hostUpdateData(r_num);
		return dto;
	}
	
	@Override
	public RoomDTO getRoom(int r_num) throws Exception {
		return roomDAO.getRoom(r_num);
	}

	@Override
	public List<RoomDTO> getOtherRoom(Map<String, Integer> hMap) throws Exception {
		return roomDAO.getOtherRoom(hMap);
	}

	@Override
	public List<RoomDTO> getNearRoom(Map<String, Object> hMap) throws Exception {
		return roomDAO.getNearRoom(hMap);
	}

	@Override
	public RoomDTO faciltyorroomsub(int r_num) throws Exception {
		RoomDTO dto = roomDAO.faciltyorroomsub(r_num);
		return dto;
	}

	@Override
	public void updateData(RoomDTO rdto) throws Exception {
		roomDAO.updateData(rdto);
		
	}

	@Override
	public String getMainImageName(int r_num) throws Exception {
		return roomDAO.getMainImageName(r_num);
	}

	@Override
	public String getsubImageName(int r_num) throws Exception {
		return roomDAO.getsubImageName(r_num);
	}

	@Override
	public void updateImageData(RoomDTO roomimage) throws Exception {
		roomDAO.updateImageData(roomimage);
	}

	@Override
	public void updateArrayData(RoomDTO roomsub) throws Exception {
		roomDAO.updateArrayData(roomsub);
	}

	@Override
	public int getRoomCount(String email) throws Exception {
		int roomCount = roomDAO.getRoomCount(email);
		return roomCount;
	}
	// 어드민 체크가 0인 것 모두 가져오기
	@Override
	public List<HostDTO> hostAllData() throws Exception {
		List<HostDTO> listsHC = roomDAO.hostAllData();
		return listsHC;
	}

	@Override
	public String getCate_name(int cate_num) throws Exception {
		String cate_name = roomDAO.getCate_name(cate_num);
		return cate_name;
	}

	@Override
	public void agreeHost(int r_num, String email) throws Exception {
		roomDAO.agreeHost(r_num,email);
	}
	
	@Override
	public void disAgreeHost(int r_num) throws Exception {
		roomDAO.disAgreeHost(r_num);
	}

	@Override
	public void deleteRoomImage(int r_num) throws Exception {
		roomDAO.deleteRoomImage(r_num);
	}

	@Override
	public int checkCount(String email) throws Exception {
		int checkCount = roomDAO.checkCount(email);
		return checkCount;
	}

	@Override
	public void updateHost(String email) throws Exception {
		roomDAO.updateHost(email);
	}
	
	@Override
	public BookDTO booking(int r_num) throws Exception {
		return roomDAO.booking(r_num);
	}
	
	@Override
	public List<RoomDTO> deleteRoomGetData() throws Exception {
		return roomDAO.deleteRoomGetData();
	}

	@Override
	public void deleteRoomData(int r_num) throws Exception {
		roomDAO.deleteRoomData(r_num);
		
	}
	
}
