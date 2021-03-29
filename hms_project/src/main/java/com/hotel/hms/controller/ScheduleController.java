package com.hotel.hms.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotel.hms.service.ScheduleService;
import com.hotel.hms.vo.WorkVO;

// 스케줄 컨트롤러
@Controller
public class ScheduleController {
	
	private static final Logger logger = LoggerFactory.getLogger(ScheduleController.class);
	
	@Autowired
	ScheduleService service;
	
	// 공통 > 스케줄관리  > 휴가신청  - 이철한
	@RequestMapping("/reqDayOff.al")
	public String reqDayOff(HttpServletRequest req, Model model) {
		// 휴무 신청 내역 가져오기
		service.logDayOff(req, model);
		return "schedule/reqDayOff";
	}
	
	// 휴무신청 처리 페이지 - 이철한
	@RequestMapping("/reqDayOffAction.al")
	public String reqDayOffAction(HttpServletRequest req, Model model) {
		service.insertDayOff(req, model);
		return "schedule/reqDayOffAction";
		
	}
	
	// 공통 > 스케줄관리  > 스케줄 근무조회  - 이철한
	@RequestMapping("/monthSchedule.al")
	public String monthSchedule(HttpServletRequest req, Model model) {
		return "schedule/monthSchedule";
	}

	// 공통 > 스케줄관리  > 스케줄 근무조회 > 스케줄 상세 조회 - 이철한 
	@RequestMapping("/detailSchedule.al")
	public String detailSchedule(HttpServletRequest req, Model model) {
		return "schedule/detailSchedule";
	}

	// 공통 > 스케줄관리  > 스케줄 입력  - 이철한
	@RequestMapping("/insertSchedule.al")
	public String insertShift(HttpServletRequest req, Model model) {
		return "schedule/insertSchedule";
	}

	// 공통 > 스케줄관리  > 스케줄 입력 > 입력 팝업 창 - 이철한
	@RequestMapping("/makeSchedule.al")
	public String makeSchedule(HttpServletRequest req, Model model) {
		service.getDataScd(req, model);
		return "schedule/makeSchedule";
	}
	
	// 달력 데이터 JSON 데이터 RETURN (근무조회 위하여) -이철한
	@RequestMapping("/getWork.al")
	public @ResponseBody List<WorkVO> getWork (HttpServletRequest req, Model model) {
		
		return service.getWork(req, model);
	}

	// 리액트 가져오기 - 이철한
	@RequestMapping("/reqModify.al")
	public String toReact(HttpServletRequest req, Model model) {
		return "schedule/reqModify";
	}
	
	// 관리자 근무 집어넣기 - 이철한 삭제 고려
	@RequestMapping("/insertAction.al")
	public String insertAction(HttpServletRequest req, Model model) {
		service.insertScd(req, model);
		return "schedule/insertAction";
	}
	
	// 근무 변경신청 승인/반려 페이지 - 이철한
	@RequestMapping("/reqModifyScdList.al")
	public String  reqModifyScd (HttpServletRequest req, Model model) {
		
		return "schedule/reqModifyScdList";
	}
	
	// 근무 신청변경폼 ajax 로 변경하기
	@RequestMapping("/dayOffTypeForm.al")
	public String dayOffTypeForm (HttpServletRequest req, Model model) {
		
		return "schedule/dayOffTypeForm";
	}
	
	// 근무조회에서 직원찾는 메서드 - 이철한
	@RequestMapping("/searchEmp.al")
	public String searchEmp(HttpServletRequest req, Model model) {
		service.getEmpInfo(req, model);
		return "schedule/searchEmp";
	}
	
	// 직원들이 스케줄 변경신청한것 부서별 관리자가 확인하는 페이지  - 이철한
	@RequestMapping("/scdModifyList.al")
	public String scdModifyList(HttpServletRequest req, Model model) {
		
		return "schedule/scdModifyList";
		
	}
	
	// 조회한 직원 선택하는 메서드 (스케줄 입력 페이지에서) - 이철한
	@RequestMapping("/selectEmp.al")
	public String selectEmp(HttpServletRequest req, Model model) {
		
		return "schedule/selectEmp";
	}
	
	
	
	
	
}
