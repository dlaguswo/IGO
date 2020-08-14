package com.exe.tmi.room.service;

import java.util.List;
import java.util.Map;

import com.exe.tmi.book.dto.BookDTO;
import com.exe.tmi.room.dto.HostDTO;
import com.exe.tmi.room.dto.RoomDTO;

public interface RoomService {
	
	public void updateHitCount(int r_num) throws Exception;	
	public int getMaxNum() throws Exception;
	public void insertData(RoomDTO rdto) throws Exception;
	public void insertArrayData(RoomDTO roomsub) throws Exception;
	public void insertImageData(RoomDTO roomimage) throws Exception;
	public List<HostDTO> hostData(String email) throws Exception;
	public HostDTO hostUpdateData(String r_num) throws Exception;
	public RoomDTO getRoom(int r_num) throws Exception;
	public List<RoomDTO> getOtherRoom(Map<String, Integer> hMap) throws Exception;
	public List<RoomDTO> getNearRoom(Map<String, Object> hMap) throws Exception; 
	public RoomDTO faciltyorroomsub (int r_num) throws Exception; //roomprofile에 facility 체크박스 출력용
	public void updateData(RoomDTO rdto) throws Exception; //roomprofile update
	public String getMainImageName(int r_num) throws Exception; //roomprofile 수정시 기존 메인이미지 지우기 위해 이미지 이름
	public String getsubImageName(int r_num) throws Exception; //roomprofile 수정시 기존 서브이미지 지우기 위해 이미지 이름
	public void updateImageData(RoomDTO roomimage) throws Exception; //addhost 수정할때 이미지 업데이트
	public void updateArrayData(RoomDTO roomsub) throws Exception;// addhost 수정할때 체크박스 업데이트 
	public int getRoomCount(String email) throws Exception; // selectroom에 출력할 Room갯수
	public List<HostDTO> hostAllData() throws Exception;	// 어드민 체크가 0인 룸 가져오기
	public String getCate_name(int cate_num) throws Exception; //cate_num으로 cate_name 호출
	public void agreeHost(int r_num,String email) throws Exception; //Host 승인시
	public void disAgreeHost(int r_num) throws Exception; //Host 거절시
	public void deleteRoomImage(int r_num) throws Exception; //Host 거절시
	public int checkCount(String email) throws Exception;
	public void updateHost(String email) throws Exception; //host 강등
	public BookDTO booking(int r_num) throws Exception;
	public List<RoomDTO> deleteRoomGetData() throws Exception;
	public void deleteRoomData(int r_num) throws Exception;
}
