package com.hotel.hms.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface RoomService {

	// 객실 리스트 가져오기
	public void roomList(HttpServletRequest req, Model model);
	
	// 청소중으로 상태변화
	public void cleaning(HttpServletRequest req, Model model);
	
	// 수리중으로 상태변화
	public void repair(HttpServletRequest req, Model model);
	
	// 체크인 인서트
	public void checkInInsert(HttpServletRequest req, Model model);
	
}
