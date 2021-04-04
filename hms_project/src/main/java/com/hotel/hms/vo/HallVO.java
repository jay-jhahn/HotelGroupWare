package com.hotel.hms.vo;
import lombok.Data;
@Data
public class HallVO {
	String hallCode;	//VARCHAR2(20)  PRIMARY KEY,    -- 연회장코드
	String hallName;	//VARCHAR2(50),   -- 연회장명
	String state;	   // CHAR(1),        -- 상태 0:빈방  1:사용중  2:예약
	int price;	    //NUMBER     
	
}
