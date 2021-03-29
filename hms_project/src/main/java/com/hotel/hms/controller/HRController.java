package com.hotel.hms.controller;

import java.io.File;
import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hotel.hms.service.HRService;

// 인사관리 컨트롤러
@Controller
public class HRController {

	private static final Logger logger = LoggerFactory.getLogger(HRController.class);

	@Autowired
	HRService service;

	// 경영지원
	@RequestMapping("officeMain.ad")
	public String officeMain() {
		logger.info("officeMain.ad");
		return "/hr/hrInfo";
	}

	// 사이드바에서 인사정보 클릭시 인사정보 페이지로 이동 - 안재효
	@RequestMapping("hrInfo.ad")
	public String hrInfo() {
		logger.info("hrInfo.ad");
		return "/hr/hrInfo";
	}

	// 사원명부 AJAX - 안재효
	@RequestMapping("empList.ad")
	public String empList() {
		logger.info("empList.ad");
		return "/hr/empList";
	}

	// 인사정보 등록 페이지 AJAX - 안재효
	@RequestMapping("regEmpPage.ad")
	public String regEmpPage() {
		logger.info("regEmpPage.ad");
		return "/hr/regEmpPage";
	}

	// 휴가 사용 현황 리스트 - 안재효
	@RequestMapping("holidayCondition.ad")
	public String holidayCondition() {
		logger.info("holidayCondition.ad");
		return "/commute/holidayCondition";
	}

	// 인사정보 등록 처리 - 안재효
	@RequestMapping("regEmpAction.al")
	public String regEmpAction(MultipartHttpServletRequest multi, Model model) {
		logger.info("regEmpAction.al");
		String empCode = multi.getParameter("");
		String empName = multi.getParameter("empName");
		String empEngName = multi.getParameter("empEngName");
		String empChiName = multi.getParameter("empChiName");
		String empJumin = multi.getParameter("empJumin");
		String gender = multi.getParameter("gender");
		String empBirth = multi.getParameter("empBirth");
		String solarOrLunar = multi.getParameter("solarOrLunar");
		String isMarried = multi.getParameter("isMarried");
		String weddingAnniv = multi.getParameter("weddingAnniv");

		String comPhone = "";
		String comPhone1 = multi.getParameter("comPhone1");
		String comPhone2 = multi.getParameter("comPhone2");
		String comPhone3 = multi.getParameter("comPhone3");
		if (comPhone1 != null && comPhone2 != null && comPhone3 != null) {
			comPhone = comPhone1 + "-" + comPhone2 + "-" + comPhone3;
		}

		String homePhone = "";
		String homePhone1 = multi.getParameter("homePhone1");
		String homePhone2 = multi.getParameter("homePhone2");
		String homePhone3 = multi.getParameter("homePhone3");
		if (homePhone1 != null && homePhone2 != null && homePhone3 != null) {
			comPhone = comPhone1 + "-" + comPhone2 + "-" + comPhone3;
		}

		String empPhone = "";
		String empPhone1 = multi.getParameter("empPhone1");
		String empPhone2 = multi.getParameter("empPhone2");
		String empPhone3 = multi.getParameter("empPhone3");
		if (empPhone1 != null && empPhone2 != null && empPhone3 != null) {
			empPhone = empPhone1 + "-" + empPhone2 + "-" + empPhone3;
		}

		String empComEmail = "";
		String empComEmail1 = multi.getParameter("empComEmail1");
		String empComEmail2 = multi.getParameter("empComEmail2");
		if (empComEmail1 != null && empComEmail2 != null) {
			empComEmail = empComEmail1 + "@" + empComEmail2;
		}

		String empEmail = "";
		String empEmail1 = multi.getParameter("empEmail1");
		String empEmail2 = multi.getParameter("empEmail2");
		if (empEmail1 != null && empEmail2 != null) {
			empEmail = empEmail1 + "@" + empEmail2;
		}

		String postCode = multi.getParameter("postCode");
		String roadAddress = multi.getParameter("roadAddress");
		String jibunAddress = multi.getParameter("jibunAddress");
		String detailAddress = multi.getParameter("detailAddress");
		String extraAddress = multi.getParameter("extraAddress");

		String deptCode = multi.getParameter("dept");
		String payConStand = multi.getParameter("payConStand");
		String strEnterDate = multi.getParameter("enterDate");

		System.out.println("empName ==> " + empName);
		System.out.println("empEngName ==> " + empEngName);
		System.out.println("empChiName ==> " + empChiName);
		System.out.println("empJumin ==> " + empJumin);
		System.out.println("gender ==> " + gender);

		MultipartFile file = multi.getFile("imgInput");

		String path = "";
		String original = file.getOriginalFilename(); // 업로드하는 파일 name
		String uploadPath = "";

		System.out.println("!!!!!!!!!" + file);
		System.out.println("!!!!!!!!!" + original);
		System.out.println("!!!!!!!!!" + file.getSize());

		uploadPath = path + original;

		try {
			file.transferTo(new File(uploadPath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		service.registerEmpAction(multi, model);
		return "/hr/regEmpAction";
	}
}
