package com.hotel.hms.controller;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotel.hms.service.PayServiceImpl;

// 급여관리 컨트롤러
@Controller
public class PayController {
	
	@Autowired
	PayServiceImpl service;
	
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

	// 급여명세서 입력페이지 사원이름 AJAX - 박상원
	@ResponseBody 
	@RequestMapping(value="selectISabun.ad", produces = "application/text; charset=utf8")
	public String selectISabun(HttpServletRequest req, Model model) {
		String empName = service.selectSabun(req, model);
		return empName;
	}
	// 급여명세서 입력페이지 상여급 AJAX - 박상원
	@ResponseBody 
	@RequestMapping(value="selectIBonus.ad", produces = "application/text; charset=utf8")
	public String selectIBonus(HttpServletRequest req, Model model) {
		String bonus = Integer.toString(service.selectBonus(req, model));
		return bonus;
	}
	
	// 급여명세서 입력  - 박상원
	@RequestMapping("insertPay.ad")
	public String insertPay(HttpServletRequest req, Model model) {
		service.insertPay(req, model);
		model.addAttribute("onload", "payMgtInsert();");
		return "/pay/payMgt";
	}
	
	// 급여명세서 수정페이지 사원이름 AJAX - 박상원
	@ResponseBody 
	@RequestMapping(value="selectUSabun.ad", produces = "application/text; charset=utf8")
	public String selectUSabun(HttpServletRequest req, Model model) {
		String empName = service.selectSabun(req, model);
		return empName;
	}
	// 급여명세서 수정페이지 상여급 AJAX - 박상원
	@ResponseBody 
	@RequestMapping(value="selectUBonus.ad", produces = "application/text; charset=utf8")
	public String selectUBonus(HttpServletRequest req, Model model) {
		String bonus = Integer.toString(service.selectBonus(req, model));
		return bonus;
	}

	// 급여명세서 수정  - 박상원
	@RequestMapping("updatePay.ad")
	public String updatePay(HttpServletRequest req, Model model) {
		service.updatePay(req, model);

		model.addAttribute("onload", "payMgtUpdate();");
		return "/pay/payMgt";
	}

	// 급여명세서 관리페이지 날짜별 사원 목록 - 박상원
	@RequestMapping("selectPayEmp.ad")
	public String selectPayEmp(HttpServletRequest req, Model model) {
		service.selectPayEmp(req, model);
		return "/pay/payMgtList";
	}
	
	// 날짜와 사원코드에 따른 급여명세서 세부 내용 조회 - 박상원
	@RequestMapping("payMgtDetail.ad")
	public String payMgtDetail(HttpServletRequest req, Model model) {
		Timestamp pmtDate = java.sql.Timestamp.valueOf(req.getParameter("pmtDate") + "00000000");
		String empCode = req.getParameter("empCode");
		service.payMgtDetail(req,model, pmtDate, empCode);
		return "/pay/payMgtDetail";
	}
	
	
}
