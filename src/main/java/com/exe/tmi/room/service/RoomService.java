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
	public RoomDTO faciltyorroomsub (int r_num) throws Exception; //roomprofile�� facility üũ�ڽ� ��¿�
	public void updateData(RoomDTO rdto) throws Exception; //roomprofile update
	public String getMainImageName(int r_num) throws Exception; //roomprofile ������ ���� �����̹��� ����� ���� �̹��� �̸�
	public String getsubImageName(int r_num) throws Exception; //roomprofile ������ ���� �����̹��� ����� ���� �̹��� �̸�
	public void updateImageData(RoomDTO roomimage) throws Exception; //addhost �����Ҷ� �̹��� ������Ʈ
	public void updateArrayData(RoomDTO roomsub) throws Exception;// addhost �����Ҷ� üũ�ڽ� ������Ʈ 
	public int getRoomCount(String email) throws Exception; // selectroom�� ����� Room����
	public List<HostDTO> hostAllData() throws Exception;	// ���� üũ�� 0�� �� ��������
	public String getCate_name(int cate_num) throws Exception; //cate_num���� cate_name ȣ��
	public void agreeHost(int r_num,String email) throws Exception; //Host ���ν�
	public void disAgreeHost(int r_num) throws Exception; //Host ������
	public void deleteRoomImage(int r_num) throws Exception; //Host ������
	public int checkCount(String email) throws Exception;
	public void updateHost(String email) throws Exception; //host ����
	public BookDTO booking(int r_num) throws Exception;
	public List<RoomDTO> deleteRoomGetData() throws Exception;
	public void deleteRoomData(int r_num) throws Exception;
}
