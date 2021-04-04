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
	public String main(HttpServletRequest req, Model model) {
		if(req.getSession().getAttribute("empCode")!=null) {
			service.getLoginEmpl(req, model);
		}
		return "index";
	}
	
}
