package com.hotel.hms.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotel.hms.service.HallService;

// 연회장 컨트롤러
@Controller
public class HallController {
	private static final Logger logger = LoggerFactory.getLogger(HallController.class);
	
	@Autowired
	HallService service;
	
	
	// 식음료 연회장
	@RequestMapping("hallMain.al")
	public String hallMain(HttpServletRequest req, Model model) {
		return "hall/hallMain";
	}
	
	// 연회장 메인
	@RequestMapping("hallList.al")
	public String hallList(HttpServletRequest req, Model model) {
		
		service.hallList(req, model);
		return "hall/hallList";
	}
	
	// 연회장 메인 예약 
	@RequestMapping("hallListAction.al")
	public String hallListAction(HttpServletRequest req, Model model) {
		logger.info("hallListAction.al");
		service.halltime(req, model);
		return "hall/hallListAction";
	}
	
	// 연회장 예약
	@RequestMapping("hallInsert.al")
	public String hallInsert(HttpServletRequest req, Model model) {
		logger.info("hallInsert.al");
		
		return "hall/hallInsert";
	}
	
	// 연회장 예약 확인
	@RequestMapping("hallInsertAction.al")
	public String hallInsertAction(HttpServletRequest req, Model model) {
		logger.info("hallInsertAction.al");
		service.insert(req, model);
		return "hall/hallInsertAction";
	}
	
	// 연회장 예약수정
	@RequestMapping("hallModify.al")
	public String hallModify(HttpServletRequest req, Model model) {
		logger.info("hallModify.al");
		service.resList(req, model);
		return "hall/hallModify";
	}
	
	// 연회장 예약수정 확인
	@RequestMapping("hallModifyAction.al")
	public String hallModifyAction(HttpServletRequest req, Model model) {
		logger.info("hallModifyAction.al");
		
		return "hall/hallModifyAction";
	}
	
	// 연회장 예약 리엑트
	@RequestMapping("hallSelct.al")
	public String hallSelct(HttpServletRequest req, Model model) {
		logger.info("hallSelct.al");
		return "hall/hallSelct";
	}
	

	// 상태변화 팝업창 - 
	@RequestMapping("hallStateChange.al")
	public String hallStateChange(HttpServletRequest req, Model model) {
		return "hall/hallStateChange";
	}
	
	// 상태변화 팝업창 - 
	@RequestMapping("List.al")
	public String List(HttpServletRequest req, Model model) {
		service.resList(req, model);
		return "hall/List";
	}
	
	
}
