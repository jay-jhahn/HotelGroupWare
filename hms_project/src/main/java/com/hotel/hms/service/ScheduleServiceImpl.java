package com.hotel.hms.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.hotel.hms.persistence.ScheduleDAO;
import com.hotel.hms.vo.EmployeeVO;
import com.hotel.hms.vo.HolidayVO;
import com.hotel.hms.vo.WorkVO;

@Service
public class ScheduleServiceImpl implements ScheduleService {

	@Autowired
	ScheduleDAO dao;
	
	// 근무 데이터 가져오기 - 이철한
	@Override
	public List<WorkVO> getWork(HttpServletRequest req, Model model) {

		Map<String, Object> map = new HashMap<String, Object>();
		String empCode = (String)req.getSession().getAttribute("empCode");
		// 현재 월 구하기 
		Calendar cal = Calendar.getInstance();
		 
		map.put("skdMonth", cal.get(Calendar.MONTH) +1);
		map.put("empCode", empCode);
		List<WorkVO> work = dao.getWork(map);
		WorkVO vo = null;

		// 1/0/1/0/1/0/1/1/1/ㅊㅇ1/1/1/1/0/0/1/0/1/0/1/1/1/0/0/0/1/1/0/1 1: 근무 0: 휴가
		String[] day = work.get(0).getSkdWorkd().split("/");
		work.clear();

		for (int i = 0; i < day.length; i++) {
			vo = new WorkVO();
			if (Integer.parseInt(day[i]) == 1) {
				vo.setTitle("주간근무");
			} else if (Integer.parseInt(day[i]) == 0) {
				vo.setTitle(" 휴무");
			} else {
				vo.setTitle("입력 오류");
			}
			// 10일보다 작을 시 일 앞에 0 이 없으므로 0 붙여주기 
			if( i+1 < 10) {
				vo.setStart("2021-03-0" + (i+1));
				vo.setEnd("2021-03-0" +(i+1));
			} else {
				vo.setStart("2021-03-" + (i+1));
				vo.setEnd("2021-03-" +(i+1));
			}
			
			work.add(vo);
		}
		return work;
	}

	// 근무 입력시 데이터 db에 넣기 - 이철한
	@Override
	public void insertScd(HttpServletRequest req, Model model) {

		Calendar cal = Calendar.getInstance();
		
		// 0: 근무선택 1:오전근무 2:오후근무 3:야간근무 7:휴무
		String[] values = req.getParameterValues("workType");
		String empCode = (String)req.getSession().getAttribute("empCode");
		int skdMonth = cal.get(Calendar.MONTH) +1 ;
		
		Map<String, Object> map = new HashMap<String, Object>();

		StringBuilder builder = new StringBuilder();
		String workScd = null;
		// null1/2/3/1/2/3/1/2/3/1/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0//0/0/0/0/0/0/0/
		for (int i = 0; i < values.length; i++) {
			builder.append(values[i] + "/");
		}
		builder.deleteCharAt(builder.lastIndexOf("/"));
		// skdMonth 나중에 scdMonth 로 바꾸어주기 
		map.put("work", String.valueOf(builder));
		map.put("empCode", empCode);
		map.put("skdMonth", skdMonth);
		
		// 먼저 이 사원이 해당 월이 근무테이블에 들어가 있는지 확인 하기 
		int selectCnt = dao.checkWorkData(map);
		int insert = 0;
		if(selectCnt == 0) {
			insert = dao.insertSchedule(map);
		} else  {
			insert = 5;
		}
		
		// insert 근무테이블에 Data 넣기 넣기 성공하였으면 1 성공실패하였으면 0 5는 이미 해당 정보가 테이블에 있음 
		model.addAttribute("insertCnt", insert);

	}

	// 스케줄 표시 정보 값 가져오기 (직원정보, 근무정보) - 이철한
	@Override
	public void getDataScd(HttpServletRequest req, Model model) {

		String empCode = (String) req.getSession().getAttribute("empCode");
		EmployeeVO vo = dao.getInfoEmp(empCode);
			
		Date date = new Date();
		int year = 2021;
		int month = Calendar.FEBRUARY;
		int day = 1;

		// 파라미터가 empty 일 시 현재 날짜 기준으로 출력 date 정보 넣어줄시 그 날짜 기준으로 출력
		Calendar calendar = new GregorianCalendar(year, month, day);
		int march = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
		List<Integer> days = new ArrayList<>();
			
		for (int i = 0; i < march; i++) {
			days.add(i);
		}
		
		System.out.println("march : " + march);
		// int year, int month, int day 값 받기
		// session 을 통해 empCode 가져온 후 직원정보 가져온 후 vo 로 리턴
		model.addAttribute("vo", vo);
		model.addAttribute("days", days);

	}

	// 직원이 휴무 신청한거 처리하는 메서드 - 이철한
	@Override
	public void insertDayOff(HttpServletRequest req, Model model) {

		Map<String, Object> map = new HashMap<>();

		String empCode = (String) req.getSession().getAttribute("empCode");
		String dayOffReason = req.getParameter("dayOffReason");

		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		// DayOffType => 휴무타입 (0: 휴무선택, 1:휴가, 2:반차, 3:연차)
		String dayOffType = req.getParameter("dayOffType");
		map.put("empCode", empCode);
		map.put("dayOffReason", dayOffReason);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("dayOffType", dayOffType);
		// map 에 담은거 db에 넣기
		int insertCnt = dao.insertDayOff(map);
		model.addAttribute("insertCnt", insertCnt);

	}

	// 휴무 신청 내역 가져오기 - 이철한
	@Override
	public void logDayOff(HttpServletRequest req, Model model) {

		String empCode = (String) req.getSession().getAttribute("empCode");
		// 직원정보 소속부서 데이터 넘기기
		EmployeeVO vo = dao.getInfoEmp(empCode);
		model.addAttribute("vo", vo);

		// 휴가 신청내역 가져오기
		List<HolidayVO> holiday = dao.getLogDayOff(empCode);
		// kindHoliday : 0: 반차     1: 연차      2: 병가 
		// 휴무 신청 상태 ( 0: 신청됨 1: 반려 / 2: 승인 나타내는 코드)
		model.addAttribute("logDayOff", holiday);

	}

	// 직원조회하는 메서드 - 이철한
	@Override
	public void getEmpInfo(HttpServletRequest req, Model model) {
		
		
		String empName = req.getParameter("empName");
		// selectCode 페이지 이동을 위해 설정  1:monthSchedule.al 2: insertSchedule.al
		int selectCode = Integer.parseInt(req.getParameter("selectCode"));
		System.out.println("selectCode : " + selectCode);
		// empName 으로 직원 찾는 부분
		List<EmployeeVO> vo = dao.getEmpInfo(empName);
		// empName에 해당하는 직원 정보를 vo로 리턴해준다 
		model.addAttribute("vo", vo);
		model.addAttribute("selectCode" , selectCode);
		
	}

	
	
	
	
	
	
	
}
