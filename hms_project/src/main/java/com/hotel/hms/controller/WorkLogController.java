package com.hotel.hms.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

// 업무일지 컨트롤러
@Controller
public class WorkLogController {

	// 출퇴근 시간 입력(비콘) - 박성언
	@RequestMapping("/workChk.al")
	public String workChk(HttpServletRequest req, Model model) {
		return "worklog/workChk";
	}
	   
	// 업무일지 - 박성언
	@RequestMapping("/record.al")
	public String record(HttpServletRequest req, Model model) {
		return "worklog/record";
	}
}
