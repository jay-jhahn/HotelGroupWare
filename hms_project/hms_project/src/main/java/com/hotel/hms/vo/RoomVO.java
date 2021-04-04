package com.hotel.hms.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RoomVO {
	
	public RoomVO() {}
	
	String roomNum, roomKind;
	char roomState;
	int roomPrice;
}
