package com.hotel.hms.vo;
import lombok.Data;



@Data
public class ResVO {

	  private String resCode;         //VARCHAR2(20)  PRIMARY KEY,    -- 예약코드 시퀀스
	  private String hallCode;        //VARCHAR2(20)  REFERENCES hall_tbl(hallCode) ON DELETE CASCADE,    -- 연회장 코드 시퀀스
	  private String empCode;        //VARCHAR2(20)  REFERENCES emp_tbl(empCode) ON DELETE CASCADE,      -- 직원코드 
	  private String guestCode;      // VARCHAR2(20)  REFERENCES guest_tbl(guestCode) ON DELETE CASCADE,  -- 고객코드
	  private String eventTitle;     // VARCHAR2(100),  -- 행사명(연회장)
	  private String eventDate;       //TIMESTAMP  ,      -- 예약날짜(연회장)
	  private String startDate;
	  private String endDate;
	  private String resCount;        //VARCHAR2(1000),         -- 예약인원
	  private String eventMenu;       //VARCHAR2(50),   -- 연회장 음식 메뉴
	  private String decoration;
	  private String eventNotes;     //VARCHAR2(1000) -- 기타사항	
	  private String eventMenu1;     //varchar2(200), -- 연회장 메뉴 상세
	  private String eventTableSet;   //VARCHAR2(1000), -- 연회장 테이블 셋팅
	  private String resName;  			//VARCHAR2(1000), -- 고객성함
	  private String resPhone;			// VARCHAR2(1000), -- 고객번호
	  private String resHallPrice;		// VARCHAR2(1000)  -- 연회장명
	  private String resHallName; 		// VARCHAR2(1000) 연회장명
	  //private HallVO hVo;	// hall 정보
	  //private GuestVO gVo;  // guest 정보
}
