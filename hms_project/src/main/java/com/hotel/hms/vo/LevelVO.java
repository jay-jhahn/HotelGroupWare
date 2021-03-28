package com.hotel.hms.vo;

import lombok.Data;

// 직위테이블
@Data
public class LevelVO {
	
	private int levelCode;		// 직위코드 // level_seq.nextval
	private String levelName;	// 직위명
}
