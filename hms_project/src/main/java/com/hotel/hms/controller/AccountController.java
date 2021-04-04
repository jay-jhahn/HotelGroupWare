package com.hotel.hms.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotel.hms.service.AccountService;

// 결산 컨트롤러
@Controller
public class AccountController {

	@Autowired
	AccountService service;
	
	// 결산 목록 조회 - 박성언
	@RequestMapping("account.ad")
	public String account(HttpServletRequest req, Model model) {
		service.accountList(req, model);
		return "/account/account";
	}

	// 결산 상세 조회- 박성언
	@RequestMapping("accountByYMD.ad")
	public String accountByYMD(HttpServletRequest req, Model model) {	
		service.accountByYMD(req, model);
		return "/account/accountByYMD";
	}
}
