package com.hotel.hms.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RatScorePerItemVO {
	private String ratItemCode;	// 항목코드
	private String ratLogCode;	// 고과내역 코드
	private String empCode;		// 사원버호
	private String ratDate;		// 기간
	private float ratScore;		// 점수
	private String ratItem;		// 인사고과 평가항목명
}