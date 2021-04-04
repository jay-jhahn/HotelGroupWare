package com.hotel.hms.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.hotel.hms.persistence.HallDAO;
import com.hotel.hms.vo.HallVO;
import com.hotel.hms.vo.ResVO;

@Service
public class HallServiceImpl implements HallService{

	@Autowired
	HallDAO dao;

	@Override
	public void halltime(HttpServletRequest req, Model model) {
		String timecheck = req.getParameter("timecheck");
		
		int updateCnt = dao.uptime(timecheck);
		model.addAttribute("updateCnt",updateCnt);
	}
	
	@Override
	public void hallList(HttpServletRequest req, Model model) {
		
		List<HallVO> vo = dao.hallList();
		
		model.addAttribute("vo",vo);
	}

	// 홀 예약
	@Override
	public void insert(HttpServletRequest req, Model model) {
		System.out.println("========SERVIECS");
		
		Map<String, Object> map = new HashMap<>();
		Map<String , Object> hallMap = new HashMap <>();
		Map<String , Object> guestMap = new HashMap <>();
		String resCode = req.getParameter("resCode");
		String empCode = req.getParameter("empCode");
		String eventTitle = req.getParameter("eventTitle");
		String eventDate = req.getParameter("eventDate");
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		String resCount = req.getParameter("resCount");
		String eventMenu = req.getParameter("eventMenu");
		String decoration = req.getParameter("decoration");
		String eventNotes = req.getParameter("eventNotes");
		String eventMenu1 = req.getParameter("eventMenu1");
		String eventTableSet = req.getParameter("eventTableSet");
		String resName = req.getParameter("resName");
		String resPhone = req.getParameter("resPhone");
		String resHallPrice = req.getParameter("resHallPrice");
		String resHallName = req.getParameter("resHallName");
		map.put("resHallName",resHallName);
		System.out.println(resCode);
		System.out.println(empCode);
		System.out.println(eventTitle);
		System.out.println(eventDate);
		System.out.println(startDate);
		System.out.println(endDate);
		System.out.println(resCount);
		System.out.println(eventMenu);
		System.out.println(decoration);
		System.out.println(eventNotes);
		System.out.println(eventMenu1);
		System.out.println(eventTableSet);	
	
		map.put("resCode", resCode);
		map.put("empCode",empCode);
		map.put("eventTitle", eventTitle);
		map.put("eventDate", eventDate);
		map.put("eventDate", startDate);
		map.put("endDate", endDate);
		map.put("resCount", resCount);
		map.put("eventMenu", eventMenu);
		map.put("decoration", decoration);
		map.put("eventNotes", eventNotes);
		map.put("eventMenu1", eventMenu1);
		map.put("eventTableSet", eventTableSet);
		map.put("resName", resName);
		map.put("resPhone", resPhone);
		map.put("resHallPrice", resHallPrice);

		int insertCnt = dao.hallin(map);
		
		System.out.println("insertCnt" + insertCnt);
		model.addAttribute("insertCnt", insertCnt);
	}

	// 홀 예약 수정
	@Override
	public void md(HttpServletRequest req, Model model) {
		System.out.println("--------service-------");
		// int resCode = Integer.parseInt(req.getParameter("resCode"));
		// String empCode = (String)req.getSession().getAttribute("empCode");
		Map<String, Object> map = new HashMap<>();
		String resCode = req.getParameter("resCode");
		String empCode = req.getParameter("empCode");
		String resCount = req.getParameter("resCount");
		String guestName = req.getParameter("guestName");
		String guestPhone = req.getParameter("guestPhone");
		String eventTitle = req.getParameter("eventTitle");
		String eventDate = req.getParameter("eventDate");
		String eventMenu = req.getParameter("eventMenu");
		String eventMenu1 = req.getParameter("eventMenu1");
		String eventTableSet = req.getParameter("eventTableSet");
		String eventCake = req.getParameter("eventCake");
		String eventIce = req.getParameter("eventIce");
		String eventFlower = req.getParameter("eventFlower");
		String eventMist = req.getParameter("eventMist");
		String eventNotes = req.getParameter("eventNotes");
		
		ResVO vo = new ResVO();
		vo.setResCode(req.getParameter("resCode"));
		vo.setEmpCode(req.getParameter("empCode"));
		vo.setResCount(req.getParameter("resCount"));
		vo.setEventTitle(req.getParameter("eventTitle"));
		vo.setEventDate(req.getParameter("eventDate"));
		vo.setEventMenu(req.getParameter("eventMenu"));
		vo.setEventMenu1(req.getParameter("eventMenu1"));
		vo.setEventTableSet(req.getParameter("eventTableSet"));
		vo.setEventNotes(req.getParameter("eventNotes"));
		
		int updateCnt = dao.update(map);
		System.out.println("updateCnt"+ updateCnt);
		model.addAttribute("vo", vo);
		model.addAttribute("updateCnt", updateCnt);
	
	
	}

	// 한건의 정보를 가져온다
	@Override
	public void resList(HttpServletRequest req, Model model) {
		
		//String resCode = req.getParameter("resCode");
		
		List<ResVO> vo = dao.resList();
		model.addAttribute("vo", vo);
		
	}

	// 연회장 홀 이용 내역
	@Override
	public void haallres(HttpServletRequest req, Model model) {
		String hallCode = req.getParameter("hallCode");
		String resCode = req.getParameter("resCode");
		
		Map<String, Object> map = new HashMap<>();
		map.put("hallCode",hallCode);
		map.put("resCode",resCode);
		
		
		

		
	}
}
