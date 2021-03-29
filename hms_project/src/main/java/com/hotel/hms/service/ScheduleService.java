package com.hotel.hms.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.hotel.hms.vo.WorkVO;

public interface ScheduleService {

	// 스케줄 표시 정보 값 가져오기 - 이철한
	public void getDataScd(HttpServletRequest req, Model model);
	
	// 근무 데이터 가져오기 - 이철한
	public List<WorkVO> getWork(HttpServletRequest req, Model model);
	
	// 근무 입력시 데이터 db에 넣기 - 이철한
	public void insertScd(HttpServletRequest req, Model model);
	
	// 휴무 신청 처리 메서드 - 이철한
	public void insertDayOff(HttpServletRequest req, Model model);
	
	// 휴무 신청 내역 가져오기 - 이철한
	public void logDayOff(HttpServletRequest req, Model model);
	
	
	
	
	
	
}
