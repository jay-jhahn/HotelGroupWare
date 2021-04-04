package com.hotel.hms.vo;

import lombok.Data;

// 부서테이블
@Data
public class AccountVO {

	private long hall_account;			// 연회장 결산
	private String hall_date;			// 연회장 날짜
	private long room_account;			// 객실 결산
	private String room_date;			// 객실 날짜
	private long pmt_account;			// 손실 합계
	private String pmt_date;			// 손실 지급일
	private long sum_sales;				// 총 매출액
	private long sum_expense;			// 총 손실액
	private long sum_profit;			// 총 순이익
	private long room_account_days;		// 금일 객실 매출액
	private long hall_account_days;		// 금일 연회장 매출액
	private long pmt_account_days;		// 금일 손실액
	private long room_account_months;	// 금월 객실 매출액
	private long hall_account_months;	// 금월 연회장 매출액
	private long pmt_account_months;	// 금월 손실액
	private long room_account_years;	// 금년 객실 매출액
	private long hall_account_years;	// 금년 연회장 매출액
	private long pmt_account_years;		// 금년 손실액
	private String this_day;			// 금일 날짜
	private String this_month;			// 월별
	private String this_year;			// 연별 날짜
	
}