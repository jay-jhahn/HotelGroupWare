package com.hotel.hms.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface WelfareService {
	
	void empDetail(HttpServletRequest req, Model model);

	// 마이쿠폰 목록 조회 - 박상원
	void myCuponList(HttpServletRequest req, Model model);

	// 복지쿠폰 목록 조회 - 박상원
	void welfareCuponList(HttpServletRequest req, Model model);

	// 복지쿠폰 입력 - 박상원
	void welfareCuponInsert(HttpServletRequest req);

}
