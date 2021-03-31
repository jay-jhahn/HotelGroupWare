package com.hotel.hms.persistence;

import com.hotel.hms.vo.EmployeeVO;
import com.hotel.hms.vo.FamilyVO;

public interface HRDAO {

	// 직원 인사정보 INSERT
	public int insertEmpInfo(EmployeeVO empVo);
	
	// 직원 가족사항 INSERT
	public int insertFamMem(FamilyVO famVo);
}
