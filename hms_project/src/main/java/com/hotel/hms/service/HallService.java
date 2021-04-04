package com.hotel.hms.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface HallService {

	// 홀 리스트 시간체크  구현예정
	public void halltime(HttpServletRequest req, Model model);
	
	// 홀 리스트 가져오기
	public void hallList(HttpServletRequest req, Model model);
	
	// 연회장 예약 
	public void insert(HttpServletRequest req, Model model);
	
	// 연회장 예약 내용 수정
	public void md(HttpServletRequest req, Model model);
	
	// 연회장 예약 내용 가져오기
	public void resList(HttpServletRequest req, Model model);
	
	// 연회장 이용 내역
	public void haallres(HttpServletRequest req, Model model);
	
}
