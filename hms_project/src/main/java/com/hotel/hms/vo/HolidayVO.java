package com.hotel.hms.vo;

import lombok.Setter;

import java.util.Date;

import lombok.Getter;

@Getter
@Setter
public class HolidayVO {

	Date startHoliday;
	Date endHoliday;
	int state; // 휴무 상태 (반려 / 승인  나타내는 코드)
	
	
}
