package com.hotel.hms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

// 급여관리 컨트롤러
@Controller
public class PayController {
	
	// 사이드바에서 급여관리 클릭시 급여명세서 입력 페이지로 이동 - 박상원
	@RequestMapping("payMgt.ad")
	public String payMgt(Model model) {
		// 급여명세서 입력 페이지가 열리도록 값 전달
		model.addAttribute("onload", "payMgtInsert();");
		return "/pay/payMgt";
	}
	
	// 사원명부 AJAX - 박상원
	@RequestMapping("payMgtInsert.ad")
	public String payMgtInsert(Model model) {
		return "/pay/payMgtInsert";
	}
	
	// 사원명부 AJAX - 박상원
	@RequestMapping("payMgtUpdate.ad")
	public String payMgtUpdate(Model model) {
		return "/pay/payMgtUpdate";
	}
	
	// 급여명세서 목록 - 박상원
	@RequestMapping("payMgtList.ad")
	public String payMgtList(Model model) {
		return "/pay/payMgtList";
	}
	
	// 급여명세서 목록에서 수정 클릭시 급여명세서 수정 페이지로 이동 - 박상원
	@RequestMapping("payMgtLUpdate.ad")
	public String payMgtLUpdate(Model model) {
		// 급여명세서 수정 페이지가 열리도록 값 전달
		model.addAttribute("onload", "payMgtUpdate();");
		return "/pay/payMgt";
	}
}
