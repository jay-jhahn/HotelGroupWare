package com.hotel.hms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

// 결산 컨트롤러
@Controller
public class AccountController {

	// 결산 목록 조회 - 박성언
	@RequestMapping("account.ad")
	public String account(Model model) {
		model.addAttribute("dp",6);
		return "/account/account";
	}

	// 결산 상세 조회- 박성언
	@RequestMapping("accountByYMD.ad")
	public String accountByYMD(Model model) {
		model.addAttribute("dp",6);
		return "/account/accountByYMD";
	}

	// 매출 증감률 예측- 박성언
	@RequestMapping("prediction.ad")
	public String prediction(Model model) {
		model.addAttribute("dp",6);
		return "/account/prediction";
	}
}
