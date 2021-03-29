package com.hotel.hms.persistence;

import com.hotel.hms.vo.EmployeeVO;

public interface LoginDAO {
	
	// 중복확인 체크
	public int confirmId(String id);
	
	// 회원가입 처리
	public int insertMember(EmployeeVO vo);
	
	// 이메일 인증
	public void sendMail(String toEmail, String key);
	
	// 이메일 인증 처리
	public int selectKey(String key);
	
	// 이메일 인증 업데이트
	public int updateGrade(String key);
	
	// 관리자 or 게스트 확인
	public int gradeCheck(String strId);
	
	// 아이디 체크
	public int idCheck(String strId);
	
	// 비밀번호 가져오기
	public String pwdCheck(String strId);
}
