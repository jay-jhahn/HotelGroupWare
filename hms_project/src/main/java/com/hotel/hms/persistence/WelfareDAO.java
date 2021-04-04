package com.hotel.hms.persistence;

import java.util.List;
import java.util.Map;

import com.hotel.hms.vo.EmployeeVO;
import com.hotel.hms.vo.WelfareVO;

public interface WelfareDAO {

	EmployeeVO empDetail(String empCode);
	
	// 마이쿠폰 목록 조회 - 박상원
	List<WelfareVO> myCuponList(String empCode);

	int welfareCuponCount();
	
	// 복지쿠폰 목록 조회 - 박상원
	List<WelfareVO> welfareCuponList(Map<String, Object> map);

	// 복지쿠폰 입력 - 박상원
	void welfareCuponInsert(Map<String, Object> map);


}
