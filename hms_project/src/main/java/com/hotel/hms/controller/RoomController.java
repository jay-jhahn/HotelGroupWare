package com.hotel.hms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// 객실 컨트롤러
@Controller
public class RoomController {

	// 객실 - 설예진
	@RequestMapping("roomMain.al")
	public String roomMain() {
		return "room/roomMain";
	}

	// 체크인 / 체크아웃 - 설예진
	@RequestMapping("check.al")
	public String check() {
		return "room/check";
	}

	// 상태 수정 버튼 > 체크인 - 설예진
	@RequestMapping("checkIn.al")
	public String checkIn() {
		return "room/checkIn";
	}

	// 예약자 이름 클릭 > 상세정보 - 설예진
	@RequestMapping("roomDetail.al")
	public String roomDetail() {
		return "room/roomDetail";
	}

}
