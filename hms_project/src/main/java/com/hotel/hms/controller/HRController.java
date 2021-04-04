package com.hotel.hms.controller;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.hotel.hms.service.HRService;
import com.hotel.hms.service.LoginService;

// 인사관리 컨트롤러
@Controller
public class HRController {

	private static final Logger logger = LoggerFactory.getLogger(HRController.class);

	@Autowired
	HRService service;
	
	@Autowired
	LoginService loginService;
	
	// 사이드바에서 인사정보 클릭시 인사정보 페이지로 이동 - 안재효
	@RequestMapping("hrInfo.oa")
	public ModelAndView hrInfo(HttpServletRequest req, ModelAndView mav) {
		logger.info("hrInfo.ad");
		String requestCnt = req.getParameter("requestCnt");
		mav.addObject("requestCnt", requestCnt).setViewName("/hr/hrInfo");
		return mav;
	}

	// 사원명부 AJAX - 안재효
	@RequestMapping("empList.oa")
	public String empList(HttpServletRequest req, Model model) {
		logger.info("empList.oa");
		service.getEmpList(req, model);
		return "/hr/empList";
	}
	
	// 인사정보 등록 페이지 AJAX - 안재효
	@RequestMapping("regEmpPage.oa")
	public String regEmpPage() {
		logger.info("regEmpPage.oa");
		return "/hr/regEmpPage";
	}

	// 인사정보 등록 처리 - 안재효
	@RequestMapping("regEmpAction.oa")
	public String regEmpAction(MultipartHttpServletRequest req, Model model) 
			throws ParseException {
		logger.info("regEmpAction.oa");
		service.registerEmpAction(req, model);
		return "forward:/hrInfo.oa";
	}
	
	// 이메일 인증 체크
	@RequestMapping("/emailChk.al")
	public String emailChk(HttpServletRequest req, Model model) {
		logger.info("emailChk.al");
		service.emailChk(req, model);
		return "/hr/emailChk";
	}
	
	// 메인페이지 증명사진 이미지 로드
	@RequestMapping("imgLoad.al")
	public void imgLoad(MultipartFile file, Model model) throws Exception {
	}
	
	// 개인정보 상세보기
	@RequestMapping("/empDetail.oa")
	public String empDetail(HttpServletRequest req, Model model) {
		logger.info("empDetail.oa");
		service.empDetail(req, model);
		return "/hr/empDetail";
	}
	
	// 직원정보 수정
	@RequestMapping("/modifyAction.oa")
	public String modifyAction(MultipartHttpServletRequest req, Model model) {
		logger.info("modifyAction.oa");
		service.modifyAction(req, model);
		return "forward:/hrInfo.oa";
	}
	
	// 인사고과 페이지 이동 - 객실팀
	@RequestMapping("/ratingRoList.or")
	public String ratingRoList(HttpServletRequest req, Model model) {
		logger.info("ratingRoList.or");
		return "/room/ratingRoList";
	}
	
	// 인사고과 페이지 이동 - 사무부
	@RequestMapping("/ratingList.or")
	public String ratingList(HttpServletRequest req, Model model) {
		logger.info("ratingList.or");
		loginService.getLoginEmpl(req, model);
		return "/hr/ratingList";
	}
	
	// 인사고과 부서별 사원리스트 
	@RequestMapping("/getEmpListDept.or")
	public String getEmpListDept(HttpServletRequest req, Model model) {
		logger.info("getEmpListDept.or");
		service.getEmpListDept(req, model);
		return "/hr/empListDept";
	}
	
	// 인사고과 평가창
	@RequestMapping("goRating.or")
	public String goRating(HttpServletRequest req, Model model) {
		logger.info("goRating.or");
		service.empDetail(req, model);
		return "/hr/rating";
	}
	
	// 인사고과 평가 확인창
	@RequestMapping("goRatResult.or")
	public String goRatResult(HttpServletRequest req, Model model) {
		logger.info("goRatResult.or");
		service.getRatingResult(req, model);
		return "/hr/ratingResult";
	}
	
	// 인사고과 평가창 저장          
	@RequestMapping("ratingAction.or")
	public String ratingAction(HttpServletRequest req, Model model) {
		logger.info("ratingAction.or");
		service.ratingAction(req, model);
		return "/hr/rating";
	}
	
	// 인사고과 평가 결재 상태 제출 후 일때 (수정 불가능 페이지)
	@RequestMapping("updateState.or")
	public String updateState(HttpServletRequest req, Model model) {
		logger.info("updateState.or");
		service.updateState(req, model);
		return "/hr/ratingResult";
	}
	
}





