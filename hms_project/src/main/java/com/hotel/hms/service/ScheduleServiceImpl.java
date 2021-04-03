package com.hotel.hms.service;

import java.time.LocalDate;
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
		int month = cal.get(Calendar.MONDAY) + 2 ;
		map.put("scdMonth", month); // month 에서 +1 을 해주어야 현재 월 출력 month 0부터 시작 함 
		
		map.put("empCode", empCode);
		
		// List 에 담지 않을 시 clear() 를 하지 못 함 
		List<WorkVO> work = dao.getWork(map);
		WorkVO vo = null;
		
		// 1/0/1/0/1/0/1/1/1/1/1/1/1/0/0/1/0/1/0/1/1/1/0/0/0/1/1/0/1  1:근무 0: 휴가
		// work 잘라서 배열에 담는다  근무 (0: 근무선택 / 1:오전근무 / 2: 오후근무 / 3: 야간근무 / 7: 휴무 )
		String[] day = work.get(0).getScdWork().split("/");
		work.clear();

		if(day != null ) {
			for (int i = 0; i < day.length; i++) {
				
				vo = new WorkVO();
				if( i+1 < 10) {
					if (Integer.parseInt(day[i]) == 1) {
						vo.setStart("2021-0" + month + "-0" + (i+1));
						vo.setEnd("2021-0"+  month + "-0" + (i+1));
						vo.setTitle("오전근무");
						vo.setColor("#81F7F3");
					} else if (Integer.parseInt(day[i]) == 2) {
						vo.setStart("2021-0" + month + "-0" + (i+1));
						vo.setEnd("2021-0"+  month + "-0" + (i+1));
						vo.setTitle("오후근무");
						vo.setColor("#BE81F7");
					} else if (Integer.parseInt(day[i]) == 3 ) {
						vo.setStart("2021-0" + month + "-0" + (i+1));
						vo.setEnd("2021-0"+  month + "-0" + (i+1));
						vo.setTitle("야간근무");
						vo.setColor("#F4FA58");
					} else if (Integer.parseInt(day[i]) == 7 ) {
						vo.setStart("2021-0" + month + "-0" + (i+1));
						vo.setEnd("2021-0"+  month + "-0" + (i+1));
						vo.setTitle("휴무");
						vo.setColor("#FA5858");
					}
				} else {
					if (Integer.parseInt(day[i]) == 1) {
						vo.setStart("2021-0" + month + "-" + (i+1));
						vo.setEnd("2021-0"+  month + "-" + (i+1));
						vo.setTitle("오전근무");
						vo.setColor("#81F7F3");
					} else if (Integer.parseInt(day[i]) == 2) {
						vo.setStart("2021-0" + month + "-" + (i+1));
						vo.setEnd("2021-0"+  month + "-" + (i+1));
						vo.setTitle("오후근무");
						vo.setColor("#BE81F7");
					} else if (Integer.parseInt(day[i]) == 3 ) {
						vo.setStart("2021-0" + month + "-" + (i+1));
						vo.setEnd("2021-0"+  month + "-" + (i+1));
						vo.setTitle("야간근무");
						vo.setColor("#F4FA58");
					} else if (Integer.parseInt(day[i]) == 7 ) {
						vo.setStart("2021-0" + month + "-0" + (i+1));
						vo.setEnd("2021-0"+  month + "-0" + (i+1));
						vo.setTitle("휴무");
						vo.setColor("#FA5858");
					}
					
				}
				work.add(vo);	
			}
		} else {
			System.out.println("day 데이터 없음 !!!");
		}
		return work;
	}

	// 근무 입력시 데이터 db에 넣기 - 이철한
	@Override
	public void insertScd(HttpServletRequest req, Model model) {

		Calendar cal = Calendar.getInstance();
		
		// 0: 근무선택 / 1:오전근무 / 2:오후근무 / 3:야간근무 / 7:휴무
		String[] values = req.getParameterValues("workType");
		String empCode = req.getParameter("empCode");
		System.out.println("empCode: 근무입력 !!!!" + empCode);
		int scdMonth = cal.get(Calendar.MONTH) + 2;	// 다음 달 근무 입력하기
		
		Map<String, Object> map = new HashMap<String, Object>();

		StringBuilder builder = new StringBuilder();
		
		// 근무 구분을 위하여 슬러시 / 추가해주기 
		for (int i = 0; i < values.length; i++) {
			builder.append(values[i] + "/");
		}
		
		// 마지막 / 제거해주기 
		builder.deleteCharAt(builder.lastIndexOf("/"));
		
		// scdMonth 나중에 scdMonth 로 바꾸어주기 
		map.put("work", String.valueOf(builder));
		System.out.println("work : " + String.valueOf(builder));
		map.put("empCode", empCode);
		map.put("scdMonth", scdMonth);
		
		// 먼저 이 사원이 해당 월이 근무테이블에 들어가 있는지 확인 하기  (존재할 시 1 / 존재하지 않을시 0)
		int selectCnt = dao.checkWorkData(map);
		
		int insert = 0;
		// selectCnt 0: db에 데이터가 없으므로 관리자가 편성한 근무를 db에 집어 넣는다. 
		
		insert = dao.insertSchedule(map);
		// 나중에 주석 풀기 
		/*
		if(selectCnt == 0) {
			insert = dao.insertSchedule(map);
		// insert 가 5일시 해다 월의 데이터가 이미 존재한다고 알려준다 	
		} else  {
			insert = 5;
		}
		*/
		// insert 근무테이블에 Data 넣기 넣기 성공하였으면 1 성공실패하였으면 0 5는 이미 해당 정보가 테이블에 있음 
		model.addAttribute("insertCnt", insert);

	}

	// 스케줄 표시 정보 값 가져오기 (직원정보, 근무정보) - 이철한
	@Override
	public void getDataScd(HttpServletRequest req, Model model) {

		String empCode = req.getParameter("empCode");
		EmployeeVO vo = dao.getInfoEmp(empCode);
		Calendar calendar = Calendar.getInstance();
		
		// 현재 연/ 다음 월 을 구한다 
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH) + 2;
		
		// 해당 월의 길이를 구한다
		LocalDate date = LocalDate.of(year, month, 01);   
		int lengthOfMonth = date.lengthOfMonth();
		
		// 일 수 길이 만큼 담을 리스트를 생성한다.
		List<Integer> days = new ArrayList<>();
		
		// 현재 월의 수 만큼 리스트를 만든다.	
		for (int i = 0; i <lengthOfMonth; i++) {
			days.add(i);
		}
		
		int nextMonth = calendar.get(Calendar.MONDAY)+2;
		
		model.addAttribute("vo", vo);   	// 직원정보 넘겨주기
		model.addAttribute("days", days);	// 다음달의 일 수 넘겨주기
		model.addAttribute("nextMonth", nextMonth);	// 다음달  몇 월인지 넘겨 주기 

	}

	// 직원이 휴무 신청한거 처리하는 메서드 - 이철한
	@Override
	public void insertDayOff(HttpServletRequest req, Model model) {

		Map<String, Object> map = new HashMap<>();

		String empCode = (String) req.getSession().getAttribute("empCode");
		String dayOffReason = req.getParameter("dayOffReason");

		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		
		System.out.println("startDate : " + startDate);
		System.out.println("endDate : " + endDate );
		
		// DayOffType => 휴무타입 ( 0: 연차, 1: 병가, 2: 오전 반차, 3: 오후 반차)
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
		
		Map <String, Object> map = new HashMap <> ();
		
		// state 값이 있을 시 if 문 타게 한다.
		if( req.getParameter("state") != null ) {
			
			int state = Integer.parseInt(req.getParameter("state"));
			System.out.println("state : !!!!! " + state );
			map.put("empCode", empCode);
			map.put("state", state);
			
			// 휴가 신청내역 가져오기
			// kindHoliday (휴무타입): 0:연차 / 1:병가  / 2:오전 반차 / 3:오후 반차
			// state (휴무 신청 상태 ) ( 0: 진행중 / 1:승인  / 2: 반려)
			List <HolidayVO> holiday = dao.getLogDayOff(map);
			model.addAttribute("logDayOff", holiday);
			
		} else {
		
			// state 없을 시 0 을 주어서 진행중인 휴무를 모두 가져온다
			map.put("state", 0);
			map.put("empCode", empCode);
			List <HolidayVO> holiday = dao.getLogDayOff(map);
			System.out.println("holiday : !!! : " + holiday);
			model.addAttribute("logDayOff", holiday);
			
			// 직원정보 소속부서 데이터 넘기기
			EmployeeVO vo = dao.getInfoEmp(empCode);
			model.addAttribute("vo", vo);
			}
		
}

	// 직원조회하는 메서드 - 이철한
	@Override
	public void getEmpInfo(HttpServletRequest req, Model model) {
		
		String empName = req.getParameter("empName");
		// selectCode 페이지 이동을 위해 설정  1:monthSchedule.al 2: insertSchedule.al
		int selectCode = Integer.parseInt(req.getParameter("selectCode"));
		System.out.println("selectCode : " + selectCode);
		// empName 으로 직원 찾는 부분 (Map으로 empCode 도 함께 넣어서 찾는걸로 바꿔주기 ==> 중복방지 위하여)
		List<EmployeeVO> vo = dao.getEmpInfo(empName);
		// empName에 해당하는 직원 정보를 vo로 리턴해준다 
		model.addAttribute("vo", vo);
		model.addAttribute("selectCode" , selectCode);
		
	}

	// 휴무 잔여일 가져오는 메서드 - 이철한 
	@Override
	public void getHolidayDays(HttpServletRequest req, Model model) {
		
		String empCode = (String)req.getSession().getAttribute("empCode");
		
		int usedCount = dao.getHolidayDays(empCode);
		
		model.addAttribute("usedCount", usedCount);	// 사용 휴무일
		model.addAttribute("available",  HolidayVO.AVAILABLEHOLIDAY); // 발생 휴무일   1년 휴무가 15일 
		
		
	}

	// 직원 근무정보 (근무 일) 뿌리는 메서드 - 이철한
	@Override
	public void getWorkDayInfo(HttpServletRequest req, Model model) {
		
		if(req.getParameter("empCode") != null) {
			
			String empCode = req.getParameter("empCode");
			
			Calendar calendar = Calendar.getInstance();
			int nextMonth = calendar.get(Calendar.MONTH) + 1;	 // 현재 월 구한다 
			;			
			Map <String , Object> giveInfo = new HashMap<String, Object> ();	// 화면에 값 뿌려지기위해서 정보 담아서 가져온다
			
			giveInfo.put("scdMonth", nextMonth);
			giveInfo.put("empCode", empCode);
			
			WorkVO vo = dao.getWorkDayInfo(giveInfo);
			
			if(vo.getScdWork() != null) {
				
			System.out.println("vo.getScdWord() :  " + vo.getScdWork() );
			String [] day = vo.getScdWork().split("/");
			
			int dayWork = 0; 	// 오전근무
			int afterWork =0;	// 오후근무
			int nightWork =0;   // 야간근무
			int rest=0;			// 휴무
			
			// 근무 (0: 근무선택 / 1:오전근무 / 2: 오후근무 / 3: 야간근무 / 7: 휴무 )
			// 근무 잘라서 각자 근무일에 맞게 넣는다
			for(int i=0; i<day.length; i++) {
				if( Integer.parseInt(day[i]) == 1 ) {
					dayWork += 1;
				} else if (Integer.parseInt(day[i]) ==2 ) {
					afterWork += 1;
				} else if (Integer.parseInt(day[i]) == 3) {
					nightWork += 1;
				} else if (Integer.parseInt(day[i]) ==7 ) {
					rest += 1;
				}
				
			}
			
			// 직원정보 가져오는 메서드
			EmployeeVO vos = dao.getInfoEmp(empCode);
						
			Map <String , Integer> workDay = new HashMap <String , Integer> ();
			
			// 근무 일 수 전해주기
			workDay.put("dayWork" , dayWork); 			// 오전 근무
			workDay.put("afterWork" ,  afterWork);		// 오후 근무
			workDay.put("nightWork" , nightWork);		// 야간 근무
			workDay.put("rest" , rest);
			
			model.addAttribute("workDay", workDay);
			model.addAttribute("vo", vos);
			} else {
				System.out.println(" 데이터가 없습니다 !!");
			}
		} else {
			System.out.println(" empCode를 가져오지 못했습니다 !");
		}
		
	}

	
	
	
	

}
