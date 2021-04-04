package com.hotel.hms.vo;

import lombok.Getter;
import lombok.Setter;

// 가족테이블
@Getter
@Setter
public class FamilyVO {
	private int famCode;		// 가족번호
	private String empCode;		// 사원번호
	private String relation;	// 관계
	private String faMemName;	// 구성원 이름
	private String faMemAge;	// 구성원 나이
	private String isLiveTogt;	// 동거여부
}
