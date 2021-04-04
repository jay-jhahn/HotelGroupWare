package com.hotel.hms.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface LoginService {

	// 중복확인 처리
	public void confirmId(HttpServletRequest req, Model model);	
	
	// 회원가입 처리
	public void joinAction(HttpServletRequest req, Model model);
	
	// 이메일 인증처리
	public void emailChk(HttpServletRequest req, Model model);
	
	// 로그인된 계정 정보 가져오기
	public void getLoginEmpl(HttpServletRequest req, Model model);
}
