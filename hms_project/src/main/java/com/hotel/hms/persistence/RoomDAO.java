package com.hotel.hms.persistence;

import java.util.List;

import com.hotel.hms.vo.GuestVO;
import com.hotel.hms.vo.RoomUseVO;
import com.hotel.hms.vo.RoomVO;
import com.hotel.hms.vo.currentlInUseVO;

public interface RoomDAO {

	// 객실 리스트 
	public List<RoomVO> roomList();
	
	// 청소중으로 상태변경
	public int cleaning(String roomNum);
	
	// 수리중으로 상태변경
	public int repair(String roomNum);

	// 체크인 업데이트
	public int roomUpdate(String roomNum);
	
	// 체크인 고객 인서트
	public int guestInsert(GuestVO guest);
	
	// 체크인 고객에서 pk가져오기
	public int selectGuestCode(GuestVO vo);
	 
	// 객실 이용내역 테이블에 인서트
	public int roomUseInsert(RoomUseVO roomUse);
	
	// 객실 현재 이용 내역 인서트
	public int currentlInUseInsert(currentlInUseVO currentlInUse);
	
	// 체크인, 수리중, 청소중에서 빈방으로
	public int checkInRoomStateChange(String roomNum);
	
	// 이용내역테이블 접근 후 정보 가져오기
	public currentlInUseVO roomUseInformationGet(String roomNum);
	
	// 고객테이블 접근 후 정보 가져오기
	public GuestVO guestInformationGet(int guestCode);
	
	// 고객 이름 가져오기
	public String empNameGet(String empCode);
	
	// 빈방으로 바꿀 때 deletecurrentlInUse_tbl에서 삭제
	public int deletecurrentlInUse(String roomNum);
	
	// 게스트가 있나없나 체크
	public int guestCount(String guestPhone);
	
	// 게스트가 정보 가져오기
	public GuestVO geustGet(String guestPhone);
	
	// 고객 이용 금액 합쳐서 업데이트
	public int guestPriceUpdate(GuestVO guest);
	
	// 고객 등급 다이아로 업데이트
	public int guestLevelUpdate(int guestCode);
	
	// 고객 등급 플래티넘으로 업데이트
	public int guestLevelUpdateLast(int guestCode);
}
