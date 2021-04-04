package com.hotel.hms.persistence;

import java.util.List;
import java.util.Map;

import com.hotel.hms.vo.HallVO;
import com.hotel.hms.vo.ResVO;

public interface HallDAO {
	
	// 연회장 예약시간
	public int uptime(String timecheck);

	// 연회장 리스트 
	public List<HallVO> hallList();
	
	// 연회장 예약
	public int hallin(Map<String, Object> map);
	
	// 연회장 예약 내용 변경하기
	public int update(Map<String, Object> map);
	
	// 연회장 예약 리스트
	public List<ResVO> resList();
	
	// 연회장 예약 에서 연회장 데이터 를 홀 테이블에 입력 
	public int hallInsert(Map<String, Object> map);
	
	// 연회장 예약 에서 게스트 데이터 를 게스트 테이블에 입력
	public int guestInsert(Map<String, Object> map);

}
