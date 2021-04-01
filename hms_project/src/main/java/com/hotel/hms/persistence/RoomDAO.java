package com.hotel.hms.persistence;

import java.util.List;

import com.hotel.hms.vo.RoomVO;

public interface RoomDAO {

	// 객실 리스트 
	public List<RoomVO> roomList();
	
	// 청소중으로 상태변경
	public int cleaning(String roomNum);
	
	// 수리중으로 상태변경
	public int repair(String roomNum);
	
	// 체크인 인서트
	public int checkInInsert(String roomNum);
}
