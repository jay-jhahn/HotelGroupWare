package com.hotel.hms.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotel.hms.service.BoardService;

// 공지사항 컨트롤러
@Controller
public class BoardController {
	
	@Autowired
	BoardService service;

	// 공통
	@RequestMapping("shareMain.al")
	public String shareMain() {
		return "/board/shareMain";
	}

	// 월급날까지 => 설예진
	@RequestMapping("mainCount.al")
	public String mainCount() {
		return "/board/mainCount";
	}

	// 공지사항 리액트 연결 > 공지사항 리스트 => 설예진
	@RequestMapping("boardList.al")
	public String board(HttpServletRequest req, Model model) {
		service.boardList(req, model);
		
		return "/board/boardList";
	}
	
//	@RequestMapping("boardDeptName.al")
//	@ResponseBody
//	public Map<String, Object> boardDeptName(HttpServletRequest req, HttpServletResponse res, Model model) {
//		String deptName = service.boardList(req, model);
//		res.setHeader("access-control-allow-origin", "*" );
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("deptName", deptName);
//		
//		return map;
//	}
	
	

	// 공지사항 리액트 연결 > 공지사항 작성 => 설예진
	@RequestMapping("boardWrite.al")
	public String boardWrite(HttpServletRequest req, Model model) {
		service.boardList(req, model);
		
		return "/board/boardWrite";
	}
}