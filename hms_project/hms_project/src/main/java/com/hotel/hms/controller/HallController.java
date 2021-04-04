package com.hotel.hms.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

// 연회장 컨트롤러
@Controller
public class HallController {
	private static final Logger logger = LoggerFactory.getLogger(HallController.class);
	
	// 식음료 연회장
	@RequestMapping("hallMain.al")
	public String hallMain() {
		return "hall/hallMain";
	}
}
