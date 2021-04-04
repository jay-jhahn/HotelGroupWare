package com.hotel.hms.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EmployeeVO {
	private String empCode;			// 사원번호
	private String deptCode;		// 부서코드
	private String deptName;		// 부서명
	private int levelCode;			// 직위코드
	private String dutyCode;		// 직책코드
	private String empPwd;			// 비밀번호
	private String empName;			// 직원명
	private String empJumin;		// 주민번호
	private String gender;			// 성별
	private String empBirth;		// 생년월일
	private String solarOrLunar;	// 양력/음력
	private String empHomePhone;	// 자택 전화번호
	private String empPhone;		// 핸드폰
	private String empEmail;		// 이메일
	private String postCode;		// 우편번호
	private String roadAddress;		// 도로명주소
	private String jibunAddress;	// 지번주소
	private String detailAddress;	// 상세주소
	private String extraAddress;	// 참고항목
	
	private String payConStand;		// 급여계약기준
	private String isProbation;		// 수습여부
	private int rate;				// 적용률
	private String empState;		// 재직구분
	private String enterDate;		// 입사일자
	private String resignDate;		// 퇴직일자
	private String empNotes;		// 비고

	private String empKey;			// 이메일 인증 키  // 지울거임 안씀
	private String empEnabled;		// 유효성
	private String empAuthority;	// 권한
	
	private String empImg;			// 증명사진
	private String ratingState;		// 인사고과 평가 상태

	private DeptVO deptVo;			// 부서
	private LevelVO levelVo;		// 직위 // 인턴, 수습, 사원, 주임 ...
	private DutyVO dutyVo;			// 직책 // 사원, 매니저, 시니어매니저 ...
}
