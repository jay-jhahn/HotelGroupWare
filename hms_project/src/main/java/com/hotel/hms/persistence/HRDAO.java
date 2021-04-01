package com.hotel.hms.persistence;

import java.util.List;
import java.util.Map;

import com.hotel.hms.vo.EmployeeVO;
import com.hotel.hms.vo.FamilyVO;

public interface HRDAO {

	// 직원 인사정보 INSERT
	public int insertEmpInfo(EmployeeVO empVo);
	
	// 직원 가족사항 INSERT
	public int insertFamMem(FamilyVO famVo);
	
	// 사원명부 리스트 SELECT
	public List<EmployeeVO> getEmpList();
	
	// 총 사원수 조회
	public int empCount();
	
	// 이메일 인증
	public void sendMail(String toEmail, String key);
	
	// 이메일 인증 키 조회
	public int selectKey(String key);
	
	// empEnabled 업데이트
	public int updateEnabled(String key);
	
	// 직원 개인 상세정보
	public EmployeeVO empDetail(String empCode);
	
	// 직원 가족사항 정보
	public List<FamilyVO> empFamMemList(String empCode);
	
	// 직원 개인정보 업데이트
	public int updateEmpInfo(EmployeeVO empVo);	
	
	// 직원 가족사항 업데이트
	public int updateFamInfo(FamilyVO famVo);
}
