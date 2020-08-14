package com.exe.tmi.mansion.dao;

import java.util.List;
import java.util.Map;

import com.exe.tmi.guest.dto.GuestDTO;
import com.exe.tmi.mansion.dto.MansionDTO;
import com.exe.tmi.mansion.dto.RoomListDTO;
import com.exe.tmi.room.dto.RoomDTO;

public interface MansionDAO {
	
	public MansionDTO getMansion(int m_num) throws Exception;
	public List<RoomDTO> getRoom() throws Exception;
	public List<RoomListDTO> getRoomList(Map<String, String> hMap) throws Exception;
	public int getMaxNum() throws Exception;
	public void insertData(MansionDTO dto);
	public String getReadWish(String email) throws Exception;
	public void updateWish(Map<String, String> hMap) throws Exception;
	public GuestDTO getHostInfo(String email) throws Exception;
	public void updateData(MansionDTO dto) throws Exception;
	public int getMnum (int r_num) throws Exception;
	public List<RoomListDTO> reGetRoomList(Map<String, String> hMap) throws Exception;
}
