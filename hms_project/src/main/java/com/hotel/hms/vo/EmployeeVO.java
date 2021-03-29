package com.hotel.hms.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class EmployeeVO {
	private String empCode;			// 직원코드
	private String empName;			// 직원명
	private String empEngName;		// 영문 이름
	private String empChiName;		// 한문 이름
	private String gender;			// 성별
	private String empPwd;			// 비밀번호
	private String empComPhone;		// 회사 전화번호
	private String empHomePhone;	// 집전화번호
	private String empPhone;		// 핸드폰
	private String empJumin;		// 주민번호
	private String empComEmail;		// 회사 메일
	private String empEmail;		// 이메일
	private String empAddr1;		// 우편번호
	private String empAddr2;		// 주소
	private String empAddr3;		// 상세주소
	private String empKey;			// 이메일 인증 키
	private String empEnabled;		// 유효성
	private String empAuthority;	// 권한
	private String empState;		// 재직구분
	private String isMerried;		// 결혼유무
	private Date weddingAnniv;		// 결혼기념일
	private Date enterDate;			// 입사일자
	private Date resignDate;		// 퇴직일자
	private String empNotes;		// 비고
	private String payConStand;		// 급여계약기준
	private String isProbation;		// 수습여부
}
