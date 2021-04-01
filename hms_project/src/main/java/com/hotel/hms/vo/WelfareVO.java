package com.hotel.hms.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class WelfareVO {
	private int rNum;
	private int welfareCode;		// 직원상품코드
	private String empCode; 		// 사원번호
	private String prodName;		// 상품명
	private int realPrice;			// 원가
	private int dcPrice;			// 할인가
	private String roomKind;		// 객실종류
	private String isBreakfast;		// 조식여부
	private String prodContents1;	// 상세내용1
	private String prodContents2;	// 상세내용2
	private String prodContents3;	// 상세내용3
	private int isUsed;				// 사용여부
	
	public WelfareVO() {}
	
}
