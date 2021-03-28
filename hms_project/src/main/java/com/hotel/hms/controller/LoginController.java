package com.hotel.hms.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotel.hms.service.LoginService;

// 로그인/로그아웃 컨트롤러
@Controller
public class LoginController {
	
	@Autowired
	LoginService service;
	
	// 메인페이지
	@RequestMapping("main.al")
	public String main() {
		return "index";
	}
	
	// 로그인페이지 - 안재효
	@RequestMapping("loginPage.al")
	public String login() {
		return "client/loginPage";
	}
	
	// 임시 회원가입 시작 ------------------------------------------------------------
	@RequestMapping("joinPage.al")
	public String joinPage() {
		return "login/joinPage";
	}
	
	@RequestMapping("joinAction.al")
	public String joinAction(HttpServletRequest req, Model model) {
		service.joinAction(req, model);
		return "login/joinAction";
	}
	
	@RequestMapping("emailChk.al")
	public String emailChk(HttpServletRequest req, Model model) {
		service.emailChk(req, model);
		return "index";
	}
	// 임시 회원가입 끝 ------------------------------------------------------------
}
