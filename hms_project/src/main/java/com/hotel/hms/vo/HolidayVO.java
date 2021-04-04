package com.hotel.hms.vo;

import lombok.Setter;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Getter;

@Getter
@Setter
public class HolidayVO {

	public static final int AVAILABLEHOLIDAY = 15;		// 휴무 발생 일 ( 1년에 15일)
	
	int holidayCode;			// 휴무 코드 (0:연차 / 1:병가  / 2:오전 반차 / 3:오후 반차 )
	Timestamp startHoliday;		// 휴무 시작 일
	Timestamp endHoliday;		// 휴무 종료 일 
	int state; 					// 휴무 상태 (0:진행중 / 1:승인 / 2:반려 )
	int kindHoliday;			// 휴무 종류 (0:연차 / 1:병가  / 2:오전 반차 / 3:오후 반차 )
	int remainHoliday;			// 휴무 잔여 일
	int usedHoliday;			// 휴무 사용 일
	
	String empCode; 			// 사원 코드
	String empName;				// 사원 이름
	
	String deptName;			// 부서명
	String reasonHoliday;		// 휴무사유
	
	
}
