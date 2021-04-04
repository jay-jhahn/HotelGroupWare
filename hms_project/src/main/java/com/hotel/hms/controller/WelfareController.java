package com.hotel.hms.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotel.hms.service.WelfareService;

// 복리후생 컨트롤러
@Controller
public class WelfareController {

	private static final Logger logger = LoggerFactory.getLogger(WelfareController.class);
	
	@Autowired
	WelfareService service;

	// 직원 할인 페키지 페이지 REACT - 박상원
	@RequestMapping("welfareCard.al")
	public String welfareCard(HttpServletRequest req, Model model) {
		logger.info("welfareCard.al");
		
		service.empDetail(req, model);
		return "/welfare/welfareCard";
	}
	
	// 직원복지 마이쿠폰 목록 - 박상원
	@RequestMapping("welfareMyCupon.al")
	public String welfareMyCupon(HttpServletRequest req, Model model) {
		logger.info("welfareMyCupon.al");
		
		service.myCuponList(req, model);
		return "/welfare/welfareMyCupon";
	}
	
	// 직원복지 입력페이지 - 박상원
	@RequestMapping("welfareCuponList.al")
	public String welfareCuponList(HttpServletRequest req, Model model) {
		logger.info("welfareCuponList.al");
		
		service.welfareCuponList(req, model);
		return "/welfare/welfareCuponInsert";
	}
	
	// 직원복지 입력 버튼 - 박상원
	@RequestMapping("welfareCuponInsert.al")
	public String welfareCuponInsert(HttpServletRequest req, Model model) {
		logger.info("welfareCuponInsert.al");
		
		service.welfareCuponList(req, model);
		service.welfareCuponInsert(req);
		return "/welfare/welfareCuponInsert";
	}
}
