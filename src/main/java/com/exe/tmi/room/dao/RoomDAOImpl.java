package com.exe.tmi.room.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.exe.tmi.book.dto.BookDTO;
import com.exe.tmi.room.dto.HostDTO;
import com.exe.tmi.room.dto.RoomDTO;

@Repository("roomDAO")
public class RoomDAOImpl implements RoomDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void updateHitCount(int r_num) throws Exception {
		sqlSession.update("mapper.room.updateHitCount", r_num);
	}

	@Override
	public int getMaxNum() throws Exception {
		int maxNum = sqlSession.selectOne("mapper.room.getMaxNum");
		return maxNum;
	}

	@Override
	public void insertData(RoomDTO rdto) throws Exception {
		sqlSession.insert("mapper.room.insertData", rdto);	
	}

	@Override
	public void insertDetailData(RoomDTO roomsub) throws Exception {
		sqlSession.insert("mapper.room.insertDetailData", roomsub);
		
	}

	@Override
	public void insertImageData(RoomDTO roomimage) throws Exception {
		sqlSession.insert("mapper.room.insertImageData",roomimage);
		
	}

	@Override
	public List<HostDTO> hostData(String email) throws Exception {
		List<HostDTO> lists = sqlSession.selectList("mapper.room.hostData", email);
		return lists;
	}

	@Override
	public HostDTO hostUpdateData(String r_num) throws Exception {
		HostDTO dto = sqlSession.selectOne("mapper.room.hostUpdateData", r_num);
		return dto;
	}
	
	@Override
	public RoomDTO getRoom(int r_num) throws Exception {
		return sqlSession.selectOne("mapper.room.getRoom", r_num);
	}

	@Override
	public List<RoomDTO> getOtherRoom(Map<String, Integer> hMap) throws Exception {
		return sqlSession.selectList("mapper.room.getOtherRoom", hMap);
	}

	@Override
	public List<RoomDTO> getNearRoom(Map<String, Object> hMap) throws Exception {
		return sqlSession.selectList("mapper.room.getNearRoom", hMap);
	}

	@Override
	public RoomDTO faciltyorroomsub(int r_num) throws Exception {
		RoomDTO dto = sqlSession.selectOne("mapper.room.faciltyorroomsub",r_num);
		return dto;
	}

	@Override
	public void updateData(RoomDTO rdto) throws Exception {
		sqlSession.update("mapper.room.updateData", rdto);
		
	}

	@Override
	public String getMainImageName(int r_num) throws Exception {
		System.out.println(r_num);
		String main_image =sqlSession.selectOne("mapper.room.getMainImage",r_num);
		return main_image;
	}

	@Override
	public String getsubImageName(int r_num) throws Exception {
		String sub_image = sqlSession.selectOne("mapper.room.getSubImage",r_num);
		return sub_image;
	}

	@Override
	public void updateImageData(RoomDTO roomimage) throws Exception {
		sqlSession.update("mapper.room.updateImageData", roomimage);
	}

	@Override
	public void updateArrayData(RoomDTO roomsub) throws Exception {
		sqlSession.update("mapper.room.updateArrayData", roomsub);
	}

	@Override
	public int getRoomCount(String email) throws Exception {
		int roomCount = sqlSession.selectOne("mapper.room.getRoomCount", email);
		return roomCount;
	}

	// 어드민 체크가 0인 것 모두 가져오기
	@Override
	public List<HostDTO> hostAllData() throws Exception {
		List<HostDTO> listsHC = sqlSession.selectList("mapper.room.hostAllData");
		return listsHC;
	}

	@Override
	public String getCate_name(int cate_num) throws Exception {
		String cate_name = sqlSession.selectOne("mapper.room.getCate_name", cate_num);
		return cate_name;
	}

	@Override
	public void agreeHost(int r_num,String email) throws Exception {
		sqlSession.update("mapper.room.agreeHost", r_num);
		sqlSession.update("mapper.room.hostCheck", email);	
	}

	@Override
	public void disAgreeHost(int r_num) throws Exception {
		sqlSession.delete("mapper.room.disAgreeHost",r_num);		
	}

	@Override
	public void deleteRoomImage(int r_num) throws Exception {
		sqlSession.delete("mapper.room.deleteRoomImage",r_num);
	}

	@Override
	public int checkCount(String email) throws Exception {
		int checkCount = sqlSession.selectOne("mapper.room.checkCount",email);
		return checkCount;
	}

	@Override
	public void updateHost(String email) throws Exception {
		sqlSession.update("mapper.room.updateHost",email);
	}
	
	@Override
	public BookDTO booking(int r_num) throws Exception {
		return sqlSession.selectOne("mapper.room.booking", r_num);
	}
	
	@Override
	public List<RoomDTO> deleteRoomGetData() throws Exception {
		return sqlSession.selectList("mapper.room.deleteRoomGetData");
	}

	@Override
	public void deleteRoomData(int r_num) throws Exception {
		sqlSession.delete("mapper.room.deleteRoomData", r_num);
		sqlSession.delete("mapper.room.deleteRoomSubData", r_num);
	}

}
