package com.hotel.hms.persistence;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import com.hotel.hms.vo.EmployeeVO;
import com.hotel.hms.vo.PayVO;

public interface PayDAO {

	EmployeeVO selectSabun(String empCode);

	int selectBonus(String empCode);

	int selectPmtDate(Map<String,Object> map);

	void insertPay(Map<String, Object> map);
	
	void updatePay(Map<String, Object> map);

	List<PayVO> selectPayEmp(Timestamp pmtDate);

	PayVO payMgtDetail(Map<String, Object> map);


}
