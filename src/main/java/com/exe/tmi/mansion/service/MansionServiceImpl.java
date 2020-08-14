package com.exe.tmi.mansion.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exe.tmi.guest.dto.GuestDTO;
import com.exe.tmi.mansion.dao.MansionDAO;
import com.exe.tmi.mansion.dto.MansionDTO;
import com.exe.tmi.mansion.dto.RoomListDTO;
import com.exe.tmi.room.dto.RoomDTO;

@Service("mansionService")
public class MansionServiceImpl implements MansionService {

	@Autowired
	private MansionDAO mansionDAO;

	@Override
	public MansionDTO getMansion(int m_num) throws Exception {		
		return mansionDAO.getMansion(m_num);
	}

	@Override
	public List<RoomDTO> getRoom() throws Exception {
		List<RoomDTO> lists = mansionDAO.getRoom();
		return lists;
	}

	@Override
	public List<RoomListDTO> getRoomList(Map<String, String> hMap) throws Exception {
		List<RoomListDTO> lists = mansionDAO.getRoomList(hMap);
		return lists;
	}

	@Override
	public int getmaxNum() throws Exception {
		int maxNum = mansionDAO.getMaxNum();
		return maxNum;
	}

	@Override
	public void insertData(MansionDTO dto) throws Exception {
		mansionDAO.insertData(dto);		
	}
	
	@Override
	public String getReadWish(String email) throws Exception{
		return mansionDAO.getReadWish(email);
	}
	
	@Override
	public void updateWish(Map<String, String> hMap) throws Exception{
		mansionDAO.updateWish(hMap);
	}

	@Override
	public GuestDTO getHostInfo(String email) throws Exception { 
		return mansionDAO.getHostInfo(email);
	}

	@Override
	public void updateData(MansionDTO dto) throws Exception {
		mansionDAO.updateData(dto);		
	}

	@Override
	public int getMnum(int r_num) throws Exception {
		return mansionDAO.getMnum(r_num);
	}
	
	@Override
	public List<RoomListDTO> reGetRoomList(Map<String, String> hMap) throws Exception {
		return mansionDAO.reGetRoomList(hMap);
	}

}
