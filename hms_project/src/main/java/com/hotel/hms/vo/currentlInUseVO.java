package com.hotel.hms.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class currentlInUseVO {

	int currentlInUseNum, guestCode;
	String roomNum, checkIn, checkOut, empCode;
	Date roomUseDate;
}
