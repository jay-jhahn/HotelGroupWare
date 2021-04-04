package com.hotel.hms.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface LoginService {

	// 로그인된 계정 정보 가져오기
	public void getLoginEmpl(HttpServletRequest req, Model model);
}
