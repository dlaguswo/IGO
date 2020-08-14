package com.exe.tmi.main.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exe.tmi.main.dao.MainDAO;
import com.exe.tmi.main.dto.MainDTO;
import com.exe.tmi.main.dto.MonthsChartDTO;
import com.exe.tmi.main.dto.PopularDTO;

@Service("mainService")
public class MainServiceImpl implements MainService {

	@Autowired
	private MainDAO mainDAO;

	@Override
	public List<MainDTO> selectKeyword(Map<String, String> hMap) throws Exception {
		return mainDAO.selectKeyword(hMap);
	}

	@Override
	public List<MainDTO> hitImage() throws Exception {
		List<MainDTO> lists = mainDAO.hitImage();
		return lists;
	}

	// 조회수 높은 순 방 가져오는 서비스
	@Override
	public List<PopularDTO> popularRoom() throws Exception {
		List<PopularDTO> listsR = mainDAO.popularRoom();
		return listsR;
	}

	// 월별 차트 가져오는 서비스
	@Override
	public List<MonthsChartDTO> monthsChart() throws Exception {
		List<MonthsChartDTO> listsMC = mainDAO.monthsChart();
		return listsMC;
	}

}
