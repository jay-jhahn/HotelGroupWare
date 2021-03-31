package com.hotel.hms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

// 복리후생 컨트롤러
@Controller
public class WelfareController {

	// 직원복지 목록 - 박상원
	@RequestMapping("welfareCard.al")
	public String welfareCard(Model model) {
		return "/welfare/welfareCard";
	}
	
	// 직원복지 목록 - 박상원
	@RequestMapping("welfareMyCupon.al")
	public String welfareMyCupon(Model model) {
		return "/welfare/welfareMyCupon";
	}
}
