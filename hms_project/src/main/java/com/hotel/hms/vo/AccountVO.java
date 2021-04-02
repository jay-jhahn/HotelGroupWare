package com.hotel.hms.vo;

import lombok.Data;

// 부서테이블
@Data
public class AccountVO {
	private int accountCode;	// 결산코드
	private String resCode;		// 예약코드
	private String hallCode;	// 연회장코드
	private String roomNum;		// 객실번호
	private String totalSale;	// 총매출
	private String loss;		// 손실
	private String netProfit;	// 순이익
	private String year;		// 연
	private String month;		// 월
	private String day;			// 일
	
}