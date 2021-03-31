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
}
