package com.exe.tmi.main.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.exe.tmi.main.dto.MainDTO;
import com.exe.tmi.main.dto.MonthsChartDTO;
import com.exe.tmi.main.dto.PopularDTO;

@Repository("mainDAO")
public class MainDAOImpl implements MainDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public List<MainDTO> selectKeyword(Map<String, String> hMap) throws DataAccessException {
		return sqlSession.selectList("mapper.guest.selectKeyword",hMap);
	}

	@Override
	public List<MainDTO> hitImage() throws Exception {
		List<MainDTO> lists = sqlSession.selectList("mapper.guest.hitImage");
		return lists;
	}

	// 조회수 높은 순 방 가져오는 dao
	@Override
	public List<PopularDTO> popularRoom() throws Exception {		
		List<PopularDTO> listsR = sqlSession.selectList("mapper.guest.popularRoom");		
		return listsR;
	}
	
	// 월별 차트 가져오는 dao
	@Override
	public List<MonthsChartDTO> monthsChart() throws Exception {
		List<MonthsChartDTO> listsMC = sqlSession.selectList("mapper.book.monthsChart");		
		return listsMC;
	}
}
