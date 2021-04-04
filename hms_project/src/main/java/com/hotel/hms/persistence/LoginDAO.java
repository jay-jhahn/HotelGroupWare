package com.hotel.hms.persistence;

import com.hotel.hms.vo.EmployeeVO;

public interface LoginDAO {
	
	// 로그인한 직원 정보 가져오기
	public EmployeeVO getLoginEmpl(String empCode);
	
}
