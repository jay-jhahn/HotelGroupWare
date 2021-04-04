package com.hotel.hms.vo;

import lombok.Getter;
import lombok.Setter;

// 직위테이블
@Getter
@Setter
public class LevelVO {
	
	private int levelCode;		// 직위코드 // level_seq.nextval
	private String levelName;	// 직위명
}
