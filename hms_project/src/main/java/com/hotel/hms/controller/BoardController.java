package com.hotel.hms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// 공지사항 컨트롤러
@Controller
public class BoardController {

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
	public String board() {
		return "/board/boardList";
	}

	// 공지사항 리액트 연결 > 공지사항 작성 => 설예진
	@RequestMapping("boardWrite.al")
	public String boardWrite() {
		return "/board/boardWrite";
	}
}