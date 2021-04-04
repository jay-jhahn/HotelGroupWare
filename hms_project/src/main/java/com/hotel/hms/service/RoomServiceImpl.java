package com.hotel.hms.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.hotel.hms.persistence.RoomDAO;
import com.hotel.hms.vo.RoomVO;

@Service
public class RoomServiceImpl implements RoomService {
	
	@Autowired
	RoomDAO dao;	

	@Override
	public void roomList(HttpServletRequest req, Model model) {
		// 객실 리스트 가져오기
		List<RoomVO> list = dao.roomList();
		
		model.addAttribute("list", list);
	}

	@Override
	public void repair(HttpServletRequest req, Model model) {
		// 객실 수리중으로 상태변화
		String roomNum = req.getParameter("roomNum");
		
		int updateCnt = dao.repair(roomNum);
		
		model.addAttribute("updateCnt", updateCnt);
	}

	@Override
	public void cleaning(HttpServletRequest req, Model model) {
		// 객실 청소중으로 상태변화
		String roomNum = req.getParameter("roomNum");
		
		int updateCnt = dao.cleaning(roomNum);
		
		model.addAttribute("updateCnt", updateCnt);
	}

	@Override
	public void checkInInsert(HttpServletRequest req, Model model) {
		// 체크인 인서트
		// update문으로 룸 찾아가서 값 바꿔넣어주기 => room_tbl
		// 회원 정보 넣기 => guest_tbl
		// 객실 이용 정보 넣기 = roomUse_tbl
		
		String roomNum = req.getParameter("roomNum");
		String roomKind = req.getParameter("roomKind");
		int roomPrice = Integer.parseInt(req.getParameter("roomPrice"));
		
		String guestName = req.getParameter("guestName");
		String guestPhone = req.getParameter("guestPhone");
		
		String guestEmail01 = req.getParameter("guestEmail01");
		String guestEmail02 = req.getParameter("guestEmail02");
		String guestEmail = guestEmail01 + "@" + guestEmail02;
		
		String empCode = req.getParameter("empCode");
		String guestLevel = req.getParameter("guestLevel");
		String checkIn = req.getParameter("checkIn");
		String checkOut = req.getParameter("checkOut");
		
		// 룸 정보 업데이트
		RoomVO room = new RoomVO();
		room.setRoomNum(roomNum);
		room.setRoomKind(roomKind);
		room.setRoomPrice(roomPrice);
		
		// 회원 정보 인서트
		
		
		

		
		
		
		
		int insertCnt = dao.checkInInsert(roomNum);
		
		model.addAttribute("insertCnt", insertCnt);
		
	}
}
