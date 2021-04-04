package com.hotel.hms.persistence;

import java.util.List;
import java.util.Map;

import com.hotel.hms.vo.EmployeeVO;
import com.hotel.hms.vo.FamilyVO;
import com.hotel.hms.vo.RatScorePerItemVO;
import com.hotel.hms.vo.RatingItemVO;
import com.hotel.hms.vo.RatingLogVO;
import com.hotel.hms.vo.RatingVO;

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
	
	// 인사고과 부서별 사원 리스트 : 매니저일 때
	public List<EmployeeVO> getEmpListDeptMNG(Map<String, String> map);
	
	// 인사고과 부서별 사원 리스트: 시니어 매니저일 때
	public List<EmployeeVO> getEmpListDeptSMNG(Map<String, String> map);
	
	// 인사고과 평가항목 가져오기
	public List<RatingItemVO> getRatingItem();
	
	// 인사고과 평가창 고과등급 가져오기
	public RatingVO getGrade(float avg);
	
	// 인사고과 평가 내용 저장
	public int insertRatLog(Map<String, Object> map);
	
	// 인사고과 평가내용 조회
	public RatingLogVO getRatLog(Map<String, String> map);

	// 상태 업데이트
	public int updateState(Map<String, Object> map);
	
	// 항목별 점수 업데이트
	public int insertRatScorePerItem(Map<String, Object> map);
	
	// 고과 내역 코드 가져오기
	public int getRatLogCode(Map<String, String> map);
	
	// 고과 평가 항목별 점수 가져오기
	public List<RatScorePerItemVO> getRspi(Map<String, Object> map);
}
