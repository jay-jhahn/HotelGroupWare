package com.hotel.hms.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class WorkVO {

	String empCode;		// 사원 코드	
	int skdMonth;		// 근무 코드 나타냄 ( 코드 아직 정하지 않음 )
	String skdWorkd; 	// SQL은 VARCHAR2 로 저장되어있음 이것만 왜 출력 ??? !!!!!
	
	String title; 		 // 풀캘린더 타이틀
	String start;		 // event 시작 일	
	String end;			 // event 종료 일 
	
	String color ; 		 // 풀캘린더 배경 색 
	String textColor; 	 // 풀캘린더 클자 색 
	
	
	
	
	
}
