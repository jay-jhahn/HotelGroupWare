package com.hotel.hms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// 환전 컨트롤러
@Controller
public class ExchangeController {

	// 환율 메인 - 김석원
	@RequestMapping("exchangeMain.al")
	public String exchangeMain() {
		return "exchange/exchangeMain";
	}

	// 환율 - 김석원
	@RequestMapping("exchangeRate.al")
	public String exchangeRate() {
		return "exchange/exchangeRate";
	}

	// 환전내역조회 - 김석원
	@RequestMapping("exchangeCheck.al")
	public String exchangeCheck() {
		return "exchange/exchangeCheck";
	}

	// 환전내역입력 - 김석원
	@RequestMapping("exchangeInsert.al")
	public String exchangeInsert() {
		return "exchange/exchangeInsert";
	}

	// 외화 보유 금액 - 김석원
	@RequestMapping("exchangeTotal.al")
	public String exchangeTotal() {
		return "exchange/exchangeTotal";
	}
}
