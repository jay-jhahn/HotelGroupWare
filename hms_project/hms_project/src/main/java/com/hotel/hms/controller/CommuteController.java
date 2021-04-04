package com.hotel.hms.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// 근태 컨트롤러
@Controller
public class CommuteController {
	
	private static final Logger logger = LoggerFactory.getLogger(HRController.class);

	// 휴가 사용 현황 리스트 - 안재효
	@RequestMapping("holidayCondition.ad")
	public String holidayCondition() {
		logger.info("holidayCondition.ad");
		return "/commute/holidayCondition";
	}
}
