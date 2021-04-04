package com.hotel.hms.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;


public interface BoardService {
	
	// 리액트로 부서명 가져가기
	public void boardList(HttpServletRequest req, Model model);

}
