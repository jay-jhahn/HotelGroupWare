package com.hotel.hms.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface RoomService {

	// 객실 리스트 가져오기
	public void roomList(HttpServletRequest req, Model model);
}
