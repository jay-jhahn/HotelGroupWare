package com.hotel.hms.vo;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PayVO {
	private int pmtCode;		// 급여명세코드
	private String empCode;		// 사원번호
	private String empName;		// 직원명
	private String deptName;	// 부서명
	private String levelName;	// 직위명
	private int levelCode;		// 직위코드
	private String deptCode;	// 부서코드
	private int salary;			// 급여
	private int extension;		// 연상수당
	private int holiday;		// 휴일수당
	private int bonus;			// 상여금
	private int taxPmt;			// 과세지급계
	private int meals;			// 식대
	private int selfDrive; 		// 자가운전보조금
	private int welfare;		// 출산/보육수당
	private int etc;			// 기타수당
	private int nonTaxPmt;		// 비과세지급계
	private int totalPmt;		// 지급합계
	private int payrollTx;		//갑근세
	private int rsdtTx;			// 주민세
	private int employmentIns;		// 고용보험
	private int nationalPension;	// 국민연금
	private int healthIns;			// 건강보험
	private int longCareIns;	// 장기요양
	private int totalDeduct;	// 공제합계
	private int ddctAmount;		// 차감수령액
	private Timestamp pmtDate;		// 지급일
	
	
	
}
