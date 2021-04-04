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
	
	// 체크인에서 빈방으로
	public void checkInRoomStateChange(HttpServletRequest req, Model model);
	
	// 빈방으로
	public void emptyGoRoomStateChange(HttpServletRequest req, Model model);
	
	// 체크인 상세정보
	public void roomDetail(HttpServletRequest req, Model model);
	
}
