package com.hotel.hms.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface HRService {

	// 인사정보 등록 처리
	public void registerEmpAction(MultipartHttpServletRequest req, Model model);
	
	// 사원명부 리스트
	public void getEmpList(HttpServletRequest req, Model model);
	
	// 이메일 인증 체크
	public void emailChk(HttpServletRequest req, Model model);
	
	// 개인정보 상세보기
	public void empDetail(HttpServletRequest req, Model model);
	
	// 인사정보 수정 처리
	public void modifyAction(MultipartHttpServletRequest req, Model model);
	
	// 인사고과 부서별 사원리스트
	public void getEmpListDept(HttpServletRequest req, Model model);
	
	// 인사고과 평가 내용 저장
	public void ratingAction(HttpServletRequest req, Model model);
	
	// 인사고과 평가 결과 조회
	public void getRatingResult(HttpServletRequest req, Model model);
	
	// 인사고과 평가 결재상태 변경
	public void updateState(HttpServletRequest req, Model model);
}
