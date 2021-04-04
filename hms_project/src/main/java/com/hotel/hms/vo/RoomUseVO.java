package com.hotel.hms.vo;

import java.sql.Date;

import com.sun.jmx.snmp.Timestamp;

import lombok.Data;

@Data
public class RoomUseVO {

	int roomUseNum, guestCode;
	String roomNum, checkIn, checkOut, empCode;
	Timestamp roomUseDate;

}
