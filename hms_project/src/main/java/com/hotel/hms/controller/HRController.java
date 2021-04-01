package com.hotel.hms.controller;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.hotel.hms.service.HRService;

// 인사관리 컨트롤러
@Controller
public class HRController {

	private static final Logger logger = LoggerFactory.getLogger(HRController.class);

	@Autowired
	HRService service;
	
	// 사이드바에서 인사정보 클릭시 인사정보 페이지로 이동 - 안재효
	@RequestMapping("hrInfo.ad")
	public String hrInfo(HttpServletRequest req, Model model) {
		logger.info("hrInfo.ad");
		return "/hr/hrInfo";
	}

	// 사원명부 AJAX - 안재효
	@RequestMapping("empList.ad")
	public String empList(HttpServletRequest req, Model model) {
		logger.info("empList.ad");
		return "/hr/empList";
	}
	
	// 사원명부 리스트 테이블 가져오는 AJAX
	@RequestMapping("getEmpList.ad")
	public String getEmpList(HttpServletRequest req, Model model) {
		logger.info("getEmpList.ad");
		service.getEmpList(req, model);
		return "/hr/empListInner";
	}

	// 인사정보 등록 페이지 AJAX - 안재효
	@RequestMapping("regEmpPage.ad")
	public String regEmpPage() {
		logger.info("regEmpPage.ad");
		return "/hr/regEmpPage";
	}

	// 인사정보 등록 처리 - 안재효
	@RequestMapping("regEmpAction.al")
	public String regEmpAction(MultipartHttpServletRequest req, Model model) 
			throws ParseException {
		logger.info("regEmpAction.al");
		service.registerEmpAction(req, model);
		return "forward:/hrInfo.ad";
	}
	
	// 이메일 인증 체크
	@RequestMapping("/emailChk.al")
	public String emailChk(HttpServletRequest req, Model model) {
		logger.info("emailChk.al");
		service.emailChk(req, model);
		return "/hr/emailChk";
	}
	
	// 메인페이지 증명사진 이미지 로드
	@RequestMapping("imgLoad.al")
	public void imgLoad(MultipartFile file, Model model) throws Exception {
	}
	
	// 개인정보 상세보기
	@RequestMapping("/empDetail.oa")
	public String empDetail(HttpServletRequest req, Model model) {
		logger.info("empDetail.oa");
		service.empDetail(req, model);
		return "/hr/empDetail";
	}
	
	// 직원정보 수정
	@RequestMapping("/modifyAction.al")
	public String modifyAction(MultipartHttpServletRequest req, Model model) {
		logger.info("modifyAction.al");
		service.modifyAction(req, model);
		return "forward:/hrInfo.ad";
	}
}





