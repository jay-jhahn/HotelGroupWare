package com.hotel.hms.vo;
import lombok.Data;

@Data
public class GuestVO {
	
	 private String guestCode;  //고객코드       // VARCHAR2(20)
	 private String guestName;  // 고객명        // VARCHAR2(20)
	 private String guestPhone; //연락처       // VARCHAR2(20)
	 private String guestEmail; //이메일        //VARCHAR2(20)
	 private String guestLevel; //회원등급      // VARCHAR2(20)
	 private int guestUsePrice; //회원이용가격 //NUMBER

}
	