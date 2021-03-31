package com.hotel.hms.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotel.hms.service.RoomService;

// 객실 컨트롤러
@Controller
public class RoomController {
	
	@Autowired
	RoomService room;

	// 객실 - 설예진
	@RequestMapping("roomMain.al")
	public String roomMain(HttpServletRequest req, Model model) {
		
		return "room/roomMain";
	}
	
	// 체크인 / 체크아웃 - 설예진
   @RequestMapping("check.al")
   public String check(HttpServletRequest req, Model model) {
	  room.roomList(req, model);
	  
      return "room/check";
   }

	
	// 상태변화 팝업창 - 설예진
	@RequestMapping("emptyRoomStateChange.al")
	public String emptyRoomStateChange(HttpServletRequest req, Model model) {
		String roomNum = req.getParameter("roomNum");
		model.addAttribute("roomNum", roomNum);
		
		return "room/emptyRoomStateChange";
	}
	
	// 상태 수정 버튼 > 체크인 - 설예진
	@RequestMapping("checkIn.al")
	public String checkIn() {
		return "room/checkIn";
	}
	
	// 청소중으로 상태 변경 - 설예진
	@RequestMapping("cleaning.al")
	public String cleaning(HttpServletRequest req, Model model) {
		room.cleaning(req, model);
		
		return "room/stateCleaningAction";
	}
	
	// 수리중으로 상태 변경 - 설예진
	@RequestMapping("repair.al")
	public String repair(HttpServletRequest req, Model model) {
		room.repair(req, model);
		
		return "room/stateRepairAction";
	}

	// 예약자 이름 클릭 > 상세정보 - 설예진
	@RequestMapping("roomDetail.al")
	public String roomDetail() {
		return "room/roomDetail";
	}

}
