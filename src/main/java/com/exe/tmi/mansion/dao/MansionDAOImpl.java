package com.exe.tmi.mansion.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.exe.tmi.guest.dto.GuestDTO;
import com.exe.tmi.mansion.dto.MansionDTO;
import com.exe.tmi.mansion.dto.RoomListDTO;
import com.exe.tmi.room.dto.RoomDTO;

@Repository("mansionDAO")
public class MansionDAOImpl implements MansionDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public MansionDTO getMansion(int m_num) throws Exception {		
		return sqlSession.selectOne("mapper.mansion.getMansion", m_num);
	}

	@Override
	public List<RoomDTO> getRoom() throws Exception {
		List<RoomDTO> lists = sqlSession.selectList("mapper.mansion.getRoom");
		return lists;
	}
	
	@Override
	   public List<RoomListDTO> getRoomList(Map<String, String> hMap) throws Exception {
	      return sqlSession.selectList("mapper.mansion.getRoomList",hMap);
	   }

	@Override
	public int getMaxNum() throws Exception {
		int maxNum = sqlSession.selectOne("mapper.mansion.getMaxNum");
		return maxNum;
	}

	@Override
	public void insertData(MansionDTO dto) {
		sqlSession.insert("mapper.mansion.insertData", dto);
	}
	
	@Override
	public String getReadWish(String email) throws Exception{
		return sqlSession.selectOne("mapper.mansion.getReadWish", email);
	}

	@Override
	public void updateWish(Map<String, String> hMap) throws Exception{
		sqlSession.update("mapper.mansion.updateWish", hMap);
	}

	@Override
	public GuestDTO getHostInfo(String email) throws Exception {		
		return sqlSession.selectOne("mapper.mansion.getHostInfo", email);
	}

	@Override
	public void updateData(MansionDTO dto) throws Exception {
		sqlSession.update("mapper.mansion.updateData", dto);
	}

	@Override
	public int getMnum(int r_num) throws Exception {
		return sqlSession.selectOne("mapper.mansion.getMnum", r_num);
	}
	
	@Override
	public List<RoomListDTO> reGetRoomList(Map<String, String> hMap) throws Exception {
		return sqlSession.selectList("mapper.mansion.reGetRoomList", hMap);
	}
}
