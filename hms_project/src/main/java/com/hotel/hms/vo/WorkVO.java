package com.hotel.hms.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class WorkVO {

	String empCode;
	int skdMonth;
	String skdWorkd; // SQL은 VARCHAR2 로 저장되어있음 이것만 왜 출력 ??? !!!!!
	// int realDay;	 // String 을 split 한 후 int에 담는다.
	
	String title; 	 // event 표시될 타이틀
	String start;
	String end;
	
	
	
}
