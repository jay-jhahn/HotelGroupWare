package com.hotel.hms.vo;

import lombok.Setter;

import java.sql.Timestamp;

import lombok.Getter;

@Getter
@Setter
public class HolidayVO {

	int holidayCode;			// 휴무 코드 (숫자 아직 정하지 않음 )
	Timestamp startHoliday;		// 휴무 시작 일
	Timestamp endHoliday;		// 휴무 종료 일 
	int state; 					// 휴무 상태 (반려 / 승인  나타내는 코드)
	int kindHoliday;			// 휴무 종류
}
