package com.hotel.hms.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class WorkVO {

	String empCode;		// 사원 코드	
	int scdMonth;		// 근무 코드 나타냄 ( 코드 아직 정하지 않음 )
	String scdWork; 	// 근무 (0: 근무선택 / 1:오전근무 / 2: 오후근무 / 3: 야간근무 / 7: 휴무 )
	
	String title; 		 // 풀캘린더 타이틀
	String start;		 // event 시작 일	
	String end;			 // event 종료 일 
	
	String color ; 		 // 풀캘린더 배경 색 
	String textColor; 	 // 풀캘린더 클자 색 
	
	
	
	
	
}
