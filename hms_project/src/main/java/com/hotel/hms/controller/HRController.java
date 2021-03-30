package com.hotel.hms.controller;

import java.io.File;
import java.nio.file.Files;
import java.text.ParseException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public String regEmpAction(MultipartHttpServletRequest multi, Model model) 
			throws ParseException {
		logger.info("regEmpAction.al");
		service.registerEmpAction(multi, model);
		
		return "/hr/regEmpAction";
	}
	
	// 메인페이지 증명사진 이미지 로드
	@Resource(name = "uploadPath")
	private String uploadPath;
	@RequestMapping("imgLoad.al")
	public void imgLoad(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String fileDir = req.getParameter("fileDir");
		String fileName = req.getParameter("empImg");
		
		System.out.println("imgLoad.alimgLoad.alimgLoad.alimgLoad.al");
		String path = uploadPath + "\\" + fileDir;
		File file = new File(path, fileName);
		
		res.setHeader("Content-Length", String.valueOf(file.length()));
		res.setHeader("Content-Disposition", "inline; filename=\"" + file.getName() + "\"");
		Files.copy(file.toPath(), res.getOutputStream());
	}
}
