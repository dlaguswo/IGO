package com.exe.tmi.main.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.exe.tmi.main.dto.MainDTO;
import com.exe.tmi.main.dto.MonthsChartDTO;
import com.exe.tmi.main.dto.PopularDTO;

public interface MainDAO {
	
	public List<MainDTO> selectKeyword(Map<String, String> hMap) throws DataAccessException; //DB���� ���� �˻�â�� Ű���带 �������� �޼ҵ�
	public List<MainDTO> hitImage() throws Exception; //DB���� ������ ��ȸ���� ���� ������ 5���� �̹��� �������� �޼ҵ�
	public List<PopularDTO> popularRoom() throws Exception;	// admin �α�� �� ������
	public List<MonthsChartDTO> monthsChart() throws Exception;	// ���� ��Ʈ
}
