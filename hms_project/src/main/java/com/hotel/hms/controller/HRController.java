package com.hotel.hms.controller;

import java.text.ParseException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
	public String regEmpAction(MultipartHttpServletRequest multi, Model model) throws ParseException {
		logger.info("regEmpAction.al");
		
		String empCode = multi.getParameter("empCode");		// 사번
		String empPwd = empCode;		// 초기 비밀번호는 사번과 동일하다.
		String deptCode = multi.getParameter("dept");		// 부서코드
		String levelCode = multi.getParameter("level"); 	// 직위코드
		String dutyCode = multi.getParameter("duty"); 		// 직책코드
		String empName = multi.getParameter("empName");		// 성명

		String empJumin = "";								// 주민번호
		String empJumin1 = multi.getParameter("empJumin1");
		String empJumin2 = multi.getParameter("empJumin2");
		if(empJumin1 != null && empJumin2 != null) {
			empJumin = empJumin1 + "-" + empJumin2;
		}
		System.out.println("empName ==> " + empName);
		System.out.println("empJumin ==> " + empJumin);
		String gender = multi.getParameter("gender");		//성별
		String date = multi.getParameter("empBirth");
		String empBirth = multi.getParameter("empBirth");	// 생일
		String solarOrLunar = multi.getParameter("solarOrLunar");	// 양/음력
		
		String empHomePhone = "";	// 자택 전화번호
		String homePhone1 = multi.getParameter("homePhone1");
		String homePhone2 = multi.getParameter("homePhone2");
		String homePhone3 = multi.getParameter("homePhone3");
		if (homePhone1 != null && homePhone2 != null && homePhone3 != null) {
			empHomePhone = homePhone1 + "-" + homePhone2 + "-" + homePhone3;
		} else {
			empHomePhone = "없음";
		}

		String empPhone = "";	// 핸드폰
		String empPhone1 = multi.getParameter("empPhone1");
		String empPhone2 = multi.getParameter("empPhone2");
		String empPhone3 = multi.getParameter("empPhone3");
		if (empPhone1 != null && empPhone2 != null && empPhone3 != null) {
			empPhone = empPhone1 + "-" + empPhone2 + "-" + empPhone3;
		} else {
			empPhone = "없음";
		}

		String empEmail = "";	// 이메일
		String empEmail1 = multi.getParameter("empEmail1");
		String empEmail2 = multi.getParameter("empEmail2");
		if (empEmail1 != null && empEmail2 != null) {
			empEmail = empEmail1 + "@" + empEmail2;
		} else {
			empEmail = "없음";
		}

		String postCode = multi.getParameter("postCode");			// 우편번호
		String roadAddress = multi.getParameter("roadAddress");		// 도로명주소
		String jibunAddress = multi.getParameter("jibunAddress");	// 지번주소
		String detailAddress = multi.getParameter("detailAddress");	// 상세주소
		String extraAddress = multi.getParameter("extraAddress");	// 참고항목

		String payConStand = multi.getParameter("payConStand");			// 급여계약기준
		String isProbation = multi.getParameter("isProbation");			// 수습여부
		String rate = multi.getParameter("rate");
		int rrate = 0;
		if(!rate.equals("")) {
			rrate = Integer.parseInt(rate);		// 적용률
		}
		String enterDate = multi.getParameter("enterDate");	// 입사일자
		String resignDate = multi.getParameter("resignDate");	// 퇴사일자
		String empState = multi.getParameter("empState");				// 재직구분
		String notes = multi.getParameter("notes");		// 비고

		System.out.println("enterDate ==> " + enterDate);
		System.out.println("empPhone ==> " + empPhone); 
		System.out.println("empBirth ==> " + empBirth);
		System.out.println("gender ==> " + gender);
		System.out.println("rrate ==> " + rrate);
		
		String[] famMemArray = multi.getParameterValues("famMemArr[]");
		if(famMemArray.length>0) {
			for(int i=0;i<famMemArray.length;i++) {
				System.out.println(famMemArray[i]);
			}
		}
		
//		MultipartFile file = multi.getFile("imgInput");
//
//		String path = "";
//		String original = file.getOriginalFilename(); // 업로드하는 파일 name
//		String uploadPath = "";
//
//		System.out.println("!!!!!!!!!" + file);
//		System.out.println("!!!!!!!!!" + original);
//		System.out.println("!!!!!!!!!" + file.getSize());
//
//		uploadPath = path + original;

//		try {
//			file.transferTo(new File(uploadPath));
//		} catch (IllegalStateException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		service.registerEmpAction(multi, model);
		return "/hr/regEmpAction";
	}
}
