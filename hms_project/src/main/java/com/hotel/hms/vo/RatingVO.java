package com.hotel.hms.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RatingVO {
	private String ratGrade;	// 고과등급
	private int ratHighScore;	// 등급내 고과 최고점수
	private int ratLowScore;	// 등급내 고과 최저점수
	private int incentive;		// 인센티브
}
