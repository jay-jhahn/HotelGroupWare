package com.hotel.hms.persistence;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.hotel.hms.vo.EmployeeVO;
import com.hotel.hms.vo.HolidayVO;
import com.hotel.hms.vo.WorkVO;

public interface ScheduleDAO {

	// 근무정보 JSON 데이터로 가져오기 - 이철한
	public List<WorkVO> getWork(Map <String, Object> map);
	
	// 근무정보 db에 넣기 - 이철한
	public int insertSchedule( Map <String,Object> map ); 
	
	// 직원 이름,소속 가져오기  - 이철한
	public EmployeeVO getInfoEmp(String empCode);
	
	// 직원 휴무신청 DB에 넣기 - 이철한
	public int insertDayOff(Map <String, Object> map);
	
	// 직원이 휴무신청한 List 가져오기 (내역 가져오기) - 이철한
	public List<HolidayVO> getLogDayOff (Map <String , Object> map);
	
	// 선택 직원이 해당월이 테이블에 데이터가 있는지 확인하는 메서드  - 이철한
	public int checkWorkData (Map <String, Object> map);
	
	// 직원정보 조회하는 메서드  - 이철한
	public List<EmployeeVO> getEmpInfo(String empName);
	
	// 휴무 잔여일 가져오는 메서드 - 이철한 
	public int getHolidayDays(String empCode);
	
	// 직원 근무정보 뿌리기 위한 메서드 - 이철한
	public WorkVO getWorkDayInfo(Map < String , Object > map);
	
	// 휴가 신청 상태 분류하는 메서드 - 이철한
	public List<HolidayVO> getHolidayState(int state);
	
	
	
	
}
