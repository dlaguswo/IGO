package com.exe.tmi.main.service;

import java.util.List;
import java.util.Map;

import com.exe.tmi.main.dto.MainDTO;
import com.exe.tmi.main.dto.MonthsChartDTO;
import com.exe.tmi.main.dto.PopularDTO;

public interface MainService {

	public List<MainDTO> selectKeyword(Map<String, String> hMap) throws Exception; //DB에서 메인 검색창의 키워드를 가져오는 메소드
	public List<MainDTO> hitImage() throws Exception; //DB에서 메인의 조회수가 높은 순으로 5개의 이미지 가져오는 메소드
	public List<PopularDTO> popularRoom() throws Exception;	// admin 조회순 인기 방
	public List<MonthsChartDTO> monthsChart() throws Exception;	// 월별 차트	
}
