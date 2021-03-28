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
		map.put("skdMonth", 3);
		map.put("empCode", "lee");
		List<WorkVO> work = dao.getWork(map);
		WorkVO vo = null;

		// 1/0/1/0/1/0/1/1/1/1/1/1/1/0/0/1/0/1/0/1/1/1/0/0/0/1/1/0/1 1: 근무 0: 휴가
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
			vo.setStart("2021-03-" + (i + 1));
			vo.setEnd("2021-03-" + (i + 1));
//		          String [] removeScd = work.get(i).toString().split(",");
//		          removeScd[0].remove();
//					vo.setEmpCode(empCode);
//					vo.setSkdMonth(3);
//					vo.setRealDay( Integer.parseInt(day[i]) );
			work.add(vo);
		}
		// json에 skdMonth 랑 realDay 왜 들어가는지 .. ??????
		return work;
	}

	// 근무 입력시 데이터 db에 넣기 - 이철한
	@Override
	public void insertScd(HttpServletRequest req, Model model) {

		// 0: 근무선택 1:오전근무 2:오후근무 3:야간근무 7:휴무
		String[] values = req.getParameterValues("workType");
		Map<String, Object> map = new HashMap<String, Object>();

		StringBuilder builder = new StringBuilder();
		String workScd = null;
		// null1/2/3/1/2/3/1/2/3/1/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0/0//0/0/0/0/0/0/0/
		for (int i = 0; i < values.length; i++) {
			builder.append(values[i] + "/");
		}
		builder.deleteCharAt(builder.lastIndexOf("/"));

		map.put("work", String.valueOf(builder));
		int insert = dao.insertSchedule(map);

		// 하드코딩임 나중에 고치기
		model.addAttribute("insertCnt", 1);

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

	// 직언이 휴무 신청한거 처리하는 메서드
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

	// 휴무 신청 내역 가져오기
	@Override
	public void logDayOff(HttpServletRequest req, Model model) {

		String empCode = (String) req.getSession().getAttribute("empCode");
		// 직원정보 소속부서 데이터 넘기기
		EmployeeVO vo = dao.getInfoEmp(empCode);
		model.addAttribute("vo", vo);

		// 휴가 신청내역 가져오기
		List<HolidayVO> holiday = dao.getLogDayOff(empCode);
		// 휴무 신청 상태 ( 0: 신청됨 1: 반려 / 2: 승인 나타내는 코드)
		model.addAttribute("logDayOff", holiday);

	}
}
