package com.hotel.hms.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RatingLogVO {
	private int ratLogCode;		// 인사고과 평가 내역 코드
	private String empCode;		// 사번
	private String levelCode;	// 직위코드
	private String deptCode;	// 부서코드
	private String ratGrade;	// 고과등급
	private String ratDate;		// 고과 평가 날짜
	private String ratAvg;		// 고과점수 평균
}
