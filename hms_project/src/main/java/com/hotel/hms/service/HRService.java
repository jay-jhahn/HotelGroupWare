package com.hotel.hms.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface HRService {

	// 인사정보 등록 처리
	public void registerEmpAction(MultipartHttpServletRequest multi, Model model);

	// 사원명부 리스트
	public void getEmpList(HttpServletRequest req, Model model);
	
	// 이메일 인증 체크
	public void emailChk(HttpServletRequest req, Model model);
}
