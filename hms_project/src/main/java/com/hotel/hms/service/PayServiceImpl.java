package com.hotel.hms.service;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.hotel.hms.persistence.PayDAOImpl;
import com.hotel.hms.vo.EmployeeVO;
import com.hotel.hms.vo.PayVO;

@Service
public class PayServiceImpl implements PayService {
	
	@Autowired
	PayDAOImpl dao;
	
	public String selectSabun(HttpServletRequest req, Model model) {
		String empCode = req.getParameter("empCode");
		// 사번 테이블에서 사원이름 empName select
		EmployeeVO vo = dao.selectSabun(empCode);
	    String empName= vo.getEmpName();
		return empName;
	}
	
	public int selectBonus(HttpServletRequest req, Model model) {
		String empCode = req.getParameter("empCode");
		// 사번 테이블에서 사원이름 empName select
		EmployeeVO vo = dao.selectSabun(empCode);
		int levelCode = vo.getLevelCode();
		String deptCode = vo.getDeptCode();
		
		// 직원의 인사고과 등금에 따른 상여금 지급 퍼센트 incentive select
		float incentive = dao.selectBonus(empCode)/100;

		int salary_default = 0;	// 기본수당
		int salary_level = 0;	// 직책수당
		int salary_dept = 0;	// 부서수당
		int salary = 0;		// 급여
		switch(levelCode){	// 직위수당
		    case 1: salary_default=(int)(incentive*0.9); salary_level=0; break;	// 인턴
		    case 2: salary_default=(int)(1100000*0.7); salary_level=150000; break;	// 수습
		    case 3: salary_default=1100000; salary_level=250000; break;	// 사원
		    case 4: salary_default=1500000; salary_level=300000; break;	// 주임
			case 5: salary_default=2000000; salary_level=350000; break;	// 계장
			case 6: salary_default=2500000; salary_level=450000; break;	// 대리
		    case 7: salary_default=3000000; salary_level=550000; break;	// 주임
			case 8: salary_default=3500000; salary_level=700000; break;	// 계장
			case 9: salary_default=4000000; salary_level=950000; break;	// 대리
		}
		switch(deptCode){	// 부서수당
			case"RO": salary_dept=230000; break;	// 객실부
			case"OF": salary_dept=210000; break;	// 사무부
			case"FB": salary_dept=220000; break;	// 식음료
			case"CO": salary_dept=240000; break;	// 조리부
		}
		salary = salary_default + salary_level + salary_dept;
		
		int bonus = (int) (salary*incentive);	// 상여금
		return bonus;
	}
	
	public void insertPay(HttpServletRequest req, Model model) {
		
		/*===== 값 가져오기 =====*/
		// 1.input 값 가져오기
		String empCode = req.getParameter("empCode");
		Timestamp pmtDate = java.sql.Timestamp.valueOf(req.getParameter("pmtDate") + "-25 00:00:00.000000000");
		int bonus = Integer.parseInt(req.getParameter("bonus"));		// 1-4.상여금
		int meals = Integer.parseInt(req.getParameter("meals"));		// 1-5.식대
		int selfDrive= Integer.parseInt(req.getParameter("selfDrive"));	// 1-6.자가운전보조금
		int welfare= Integer.parseInt(req.getParameter("welfare"));		// 1-7.출산/보육수당
		int etc =Integer.parseInt(req.getParameter("etc"));				// 1-8.기타수당
		
		// 2. 사번 테이블에서 사번번호 empCode, 부서코드 deptCode, 직위코트 levelCode select
		EmployeeVO vo = dao.selectSabun(empCode);
		int levelCode = vo.getLevelCode();
		String deptCode = vo.getDeptCode();
		
		// 3. 휴가테이블에서 한달 휴가일 select
		int isHoliday = 5; // 한달에 빠진 휴일
		int isOvertime = 460; // 연장시간
		
		/*===== 급여명세서 계산 시작 =====*/
		// 1.지급계
		int mHourlywage = 8720;	// 최저시급
		int salary_default = 0;	// 기본수당
		int salary_duty = 0;	// 직위수당
		int salary_dept = 0;	// 부서수당
		int salary = 0;			// 1-1.급여 = 기본수당 + 직위수당 + 부서수당
		switch(levelCode){		// 직위수당
		    case 1: salary_default=(int)(mHourlywage*0.9); salary_duty=0; break;	// 인턴
		    case 2: salary_default=800000; salary_duty=150000; break;	// 수습
		    case 3: salary_default=1100000; salary_duty=250000; break;	// 사원
		    case 4: salary_default=1500000; salary_duty=300000; break;	// 주임
			case 5: salary_default=2000000; salary_duty=350000; break;	// 계장
			case 6: salary_default=2500000; salary_duty=450000; break;	// 대리
		    case 7: salary_default=3000000; salary_duty=550000; break;	// 주임
			case 8: salary_default=3500000; salary_duty=700000; break;	// 계장
			case 9: salary_default=4000000; salary_duty=950000; break;	// 대리
		}
		switch(deptCode){		// 부서수당
			case"RO": salary_dept=230000; break;	// 객실부
			case"OF": salary_dept=210000; break;	// 사무부
			case"FB": salary_dept=220000; break;	// 식음료
			case"CO": salary_dept=240000; break;	// 조리부
		}
		salary = salary_default + salary_duty+salary_dept;	// 급여 = 기본수당 + 직위수당 + 부서수당
		
		int extension = (int) (mHourlywage*1.5*Math.round(isOvertime/30));	// 1-2.연장수당
		int holiday = 200000*(10-isHoliday)/100;							// 1-3.휴일수당
		
		// 1-4~1-8까지는 위에 값 가져오는 부분에서 초기화됨
		
		int taxPmt = salary+extension+holiday+bonus+etc;	// 1-9.과세지급계
		int nonTaxPmt =meals+selfDrive+welfare;				// 1-10.비과세지급계
		int totalPmt=taxPmt+nonTaxPmt;						// 1-11.지급합계

		// 2. 과세계
		int payrollTx=0;			// 2-1.갑근세
		int taxPmt12 =taxPmt*12;	// 연간 총 급여액=월급여액(비과세소득제외)*12
		
		int determinedTax =0; 		// 결정세액 = 산출세액-근로소득세액공제
		int calculateTaxBased=0;	// 산출세액
		if(taxPmt12 <= 12000000) {
			calculateTaxBased=(int) (taxPmt12*0.06);
		} else if (taxPmt12>12000000 && taxPmt12 <=46000000) {
			calculateTaxBased=(int) (12000000*0.06+(taxPmt12-12000000)*0.15-1080000);
		} else if (taxPmt12>46000000 && taxPmt12 <=88000000) {
			calculateTaxBased=(int) (12000000*0.06+(46000000-12000000)*0.15+(taxPmt12-46000000)*0.24-5220000);
		} else if (taxPmt12>88000000 && taxPmt12 <=150000000) {
			calculateTaxBased=(int) (12000000*0.06+(46000000-12000000)*0.15+(88000000-46000000)*0.24+(taxPmt12-88000000)*0.35-14900000);
		} else if (taxPmt12>150000000 && taxPmt12 <=300000000) {
			calculateTaxBased=(int) (12000000*0.06+(46000000-12000000)*0.15+(88000000-46000000)*0.24+(150000000-88000000)*0.35+(taxPmt12-150000000)*0.38-19400000);
		} else if (taxPmt12>300000000 && taxPmt12 <=500000000) {
			calculateTaxBased=(int) (12000000*0.06+(46000000-12000000)*0.15+(88000000-46000000)*0.24+(150000000-88000000)*0.35+(300000000-150000000)*0.38+(taxPmt12-300000000)*0.4-25400000);
		} else if (taxPmt12>500000000) {
			calculateTaxBased=(int) (12000000*0.06+(46000000-12000000)*0.15+(88000000-46000000)*0.24+(150000000-88000000)*0.35+(300000000-150000000)*0.38+(500000000-300000000)*0.4+(taxPmt12-500000000)*0.42-35400000);
		}
		int eItaxCredit =0; // 근로소득세액공제
		if (calculateTaxBased<=500000) {
			eItaxCredit=(int) (calculateTaxBased*0.55);
		} else if (calculateTaxBased>500000) {
			eItaxCredit=(int) (275000+(calculateTaxBased-50)*0.3);
		}
		if(taxPmt12<=55000000 && eItaxCredit>660000) {
			eItaxCredit=660000;
		}else if(taxPmt12>55000000 && eItaxCredit>630000) {
			eItaxCredit=630000;
		}else if(taxPmt12>70000000 && eItaxCredit>500000) {
			eItaxCredit=500000;
		}
		determinedTax=calculateTaxBased-eItaxCredit;	// 결정세액 = 산출세액-근로소득세액공제
		
		payrollTx = determinedTax/12; 				// 갑근세_종료
		int rsdtTx=(int) (payrollTx*0.1);			// 2-1.주민세
		int employmentIns=(int) (taxPmt*0.0045); 	// 2-2.고용보험
		int nationalPension=(int) (taxPmt*0.008);	// 2-3.국민연금
		int healthIns=(int) (taxPmt*0.0045);		// 2-4.건강보험
		int longCareIns=(int) (healthIns*0.1152);	// 2-5.장기요양
		
		int totalDeduct=payrollTx+rsdtTx+employmentIns+nationalPension+healthIns+longCareIns;	// 2-6.공제합계
		// 3. 차감수령액 = 지급합계 - 공제합계
		int ddctAmount=totalPmt-totalDeduct;	
		
		
		/*===== 급여명세서 계산 완료 =====*/
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("empCode",empCode);		// 사번
		map.put("levelCode",levelCode);	// 직위코드
		map.put("deptCode",deptCode);	// 부서코드
		map.put("salary",salary);		// 급여
		map.put("extension",extension);	// 연상수당
		map.put("holiday",holiday);		// 휴일수당
		map.put("bonus",bonus);			// 상여금
		map.put("taxPmt",taxPmt);		// 과세지급계
		map.put("meals",meals);			// 식대
		map.put("selfDrive",selfDrive); // 자가운전보조금
		map.put("welfare",welfare);		// 출산/보육수당
		map.put("etc",etc);				// 기타수당
		map.put("nonTaxPmt",nonTaxPmt);	// 비과세지급계
		map.put("totalPmt",totalPmt);	// 지급합계
		map.put("payrollTx",payrollTx);	//갑근세
		map.put("rsdtTx",rsdtTx);		// 주민세
		map.put("employmentIns",employmentIns);		// 고용보험
		map.put("nationalPension",nationalPension);	// 국민연금
		map.put("healthIns",healthIns);				// 건강보험
		map.put("longCareIns",longCareIns);	// 장기요양
		map.put("totalDeduct",totalDeduct);	// 공제합계
		map.put("ddctAmount",ddctAmount);	// 차감수령액
		map.put("pmtDate",pmtDate);			//지급일자
		
		// 해당 월이 있으면 수정
		int cnt = dao.selectPmtDate(map);
		if (cnt>0) {
			dao.updatePay(map);
		} else {
			// 해당 월이 없으면 등록
			dao.insertPay(map);
		}
		
	}
	public void updatePay(HttpServletRequest req, Model model) {
		
		/*===== 값 가져오기 =====*/
		// 1.input 값 가져오기
		String empCode = req.getParameter("empCode");
		Timestamp pmtDate = java.sql.Timestamp.valueOf(req.getParameter("pmtDate") + "-25 00:00:00.000000000");
		int bonus = Integer.parseInt(req.getParameter("bonus"));	// 1-4.상여금
		int meals = Integer.parseInt(req.getParameter("meals"));		// 1-5.식대
		int selfDrive= Integer.parseInt(req.getParameter("selfDrive"));	// 1-6.자가운전보조금
		int welfare= Integer.parseInt(req.getParameter("welfare"));		// 1-7.출산/보육수당
		int etc =Integer.parseInt(req.getParameter("etc"));			// 1-8.기타수당
		
		// 2. 사번 테이블에서 사번번호 empCode, 부서코드 deptCode, 직위코트 levelCode select
		EmployeeVO vo = dao.selectSabun(empCode);
		int levelCode = vo.getLevelCode();
		String deptCode = vo.getDeptCode();
		
		// 3. 휴가테이블에서 한달 휴가일 select
		int isHoliday = 5; // 한달에 빠진 휴일
		int isOvertime = 460; // 연장시간
		

		/*===== 급여명세서 계산 시작 =====*/
		// 1.지급계
		int salary_default = 0;	// 기본수당
		int salary_duty = 0;	// 직위수당
		int salary_dept = 0;	// 부서수당
		int salary = 0;			// 1-1.급여 = 기본수당 + 직위수당 + 부서수당
		switch(levelCode){		// 직위수당
		    case 1: salary_default=800000; salary_duty=0; break;		// 인턴
		    case 2: salary_default=950000; salary_duty=150000; break;	// 수습
		    case 3: salary_default=1100000; salary_duty=250000; break;	// 사원
		    case 4: salary_default=1500000; salary_duty=300000; break;	// 주임
			case 5: salary_default=2000000; salary_duty=350000; break;	// 계장
			case 6: salary_default=2500000; salary_duty=450000; break;	// 대리
		    case 7: salary_default=3000000; salary_duty=550000; break;	// 주임
			case 8: salary_default=3500000; salary_duty=700000; break;	// 계장
			case 9: salary_default=4000000; salary_duty=950000; break;	// 대리
		}
		switch(deptCode){		// 부서수당
			case"RO": salary_dept=230000; break;	// 객실부
			case"OF": salary_dept=210000; break;	// 사무부
			case"FB": salary_dept=220000; break;	// 식음료
			case"CO": salary_dept=240000; break;	// 조리부
		}
		salary = salary_default + salary_duty+salary_dept;	// 급여 = 기본수당 + 직위수당 + 부서수당
		int mHourlywage = 8720;	// 최저시급
		int extension = (int) (mHourlywage*1.5*Math.round(isOvertime/30));	// 1-2.연장수당
		int holiday = 200000*(10-isHoliday)/100;							// 1-3.휴일수당
		
		// 1-4~1-8까지는 위에 값 가져오는 부분에서 초기화됨
		
		int taxPmt = salary+extension+holiday+bonus+etc;	// 1-9.과세지급계
		int nonTaxPmt =meals+selfDrive+welfare;				// 1-10.비과세지급계
		int totalPmt=taxPmt+nonTaxPmt;						// 1-11.지급합계

		// 2. 과세계
		int payrollTx=0;			// 2-1.갑근세
		int taxPmt12 =taxPmt*12;	// 연간 총 급여액=월급여액(비과세소득제외)*12
		
		int determinedTax =0; 		// 결정세액 = 산출세액-근로소득세액공제
		int calculateTaxBased=0;	// 산출세액
		if(taxPmt12 <= 12000000) {
			calculateTaxBased=(int) (taxPmt12*0.06);
		} else if (taxPmt12>12000000 && taxPmt12 <=46000000) {
			calculateTaxBased=(int) (12000000*0.06+(taxPmt12-12000000)*0.15-1080000);
		} else if (taxPmt12>46000000 && taxPmt12 <=88000000) {
			calculateTaxBased=(int) (12000000*0.06+(46000000-12000000)*0.15+(taxPmt12-46000000)*0.24-5220000);
		} else if (taxPmt12>88000000 && taxPmt12 <=150000000) {
			calculateTaxBased=(int) (12000000*0.06+(46000000-12000000)*0.15+(88000000-46000000)*0.24+(taxPmt12-88000000)*0.35-14900000);
		} else if (taxPmt12>150000000 && taxPmt12 <=300000000) {
			calculateTaxBased=(int) (12000000*0.06+(46000000-12000000)*0.15+(88000000-46000000)*0.24+(150000000-88000000)*0.35+(taxPmt12-150000000)*0.38-19400000);
		} else if (taxPmt12>300000000 && taxPmt12 <=500000000) {
			calculateTaxBased=(int) (12000000*0.06+(46000000-12000000)*0.15+(88000000-46000000)*0.24+(150000000-88000000)*0.35+(300000000-150000000)*0.38+(taxPmt12-300000000)*0.4-25400000);
		} else if (taxPmt12>500000000) {
			calculateTaxBased=(int) (12000000*0.06+(46000000-12000000)*0.15+(88000000-46000000)*0.24+(150000000-88000000)*0.35+(300000000-150000000)*0.38+(500000000-300000000)*0.4+(taxPmt12-500000000)*0.42-35400000);
		}
		int eItaxCredit =0; // 근로소득세액공제
		if (calculateTaxBased<=500000) {
			eItaxCredit=(int) (calculateTaxBased*0.55);
		} else if (calculateTaxBased>500000) {
			eItaxCredit=(int) (275000+(calculateTaxBased-50)*0.3);
		}
		if(taxPmt12<=55000000 && eItaxCredit>660000) {
			eItaxCredit=660000;
		}else if(taxPmt12>55000000 && eItaxCredit>630000) {
			eItaxCredit=630000;
		}else if(taxPmt12>70000000 && eItaxCredit>500000) {
			eItaxCredit=500000;
		}
		determinedTax=calculateTaxBased-eItaxCredit;	// 결정세액 = 산출세액-근로소득세액공제
		
		payrollTx = determinedTax/12; 				// 갑근세_종료
		int rsdtTx=(int) (payrollTx*0.1);			// 2-1.주민세
		int employmentIns=(int) (taxPmt*0.0045); 	// 2-2.고용보험
		int nationalPension=(int) (taxPmt*0.008);	// 2-3.국민연금
		int healthIns=(int) (taxPmt*0.0045);		// 2-4.건강보험
		int longCareIns=(int) (healthIns*0.1152);	// 2-5.장기요양
		
		int totalDeduct=payrollTx+rsdtTx+employmentIns+nationalPension+healthIns+longCareIns;	// 2-6.공제합계
		// 3. 차감수령액 = 지급합계 - 공제합계
		int ddctAmount=totalPmt-totalDeduct;	
		
		
		/*===== 급여명세서 계산 완료 =====*/
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("empCode",empCode);		// 사번
		map.put("levelCode",levelCode);	// 직위코드
		map.put("deptCode",deptCode);	// 부서코드
		map.put("salary",salary);		// 급여
		map.put("extension",extension);	// 연상수당
		map.put("holiday",holiday);		// 휴일수당
		map.put("bonus",bonus);			// 상여금
		map.put("taxPmt",taxPmt);		// 과세지급계
		map.put("meals",meals);			// 식대
		map.put("selfDrive",selfDrive); // 자가운전보조금
		map.put("welfare",welfare);		// 출산/보육수당
		map.put("etc",etc);				// 기타수당
		map.put("nonTaxPmt",nonTaxPmt);	// 비과세지급계
		map.put("totalPmt",totalPmt);	// 지급합계
		map.put("payrollTx",payrollTx);	//갑근세
		map.put("rsdtTx",rsdtTx);		// 주민세
		map.put("employmentIns",employmentIns);		// 고용보험
		map.put("nationalPension",nationalPension);	// 국민연금
		map.put("healthIns",healthIns);				// 건강보험
		map.put("longCareIns",longCareIns);	// 장기요양
		map.put("totalDeduct",totalDeduct);	// 공제합계
		map.put("ddctAmount",ddctAmount);	// 차감수령액
		map.put("pmtDate",pmtDate);			//지급일자
		
		// 해당 월이 있으면 수정
		int cnt = dao.selectPmtDate(map);
		if (cnt>0) {
			dao.updatePay(map);
		}
		
	}
	
	public void selectPayEmp(HttpServletRequest req, Model model) {
		Timestamp pmtDate = java.sql.Timestamp.valueOf(req.getParameter("pmtDate") + "-25 00:00:00.000000000");
		// 직원명담기
		List<PayVO> list = dao.selectPayEmp(pmtDate);
		model.addAttribute("list",list);
		model.addAttribute("pmtDate", req.getParameter("pmtDate"));
	}
	
	public void payMgtDetail(HttpServletRequest req, Model model, Timestamp pmtDate, String empCode) {
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("pmtDate", pmtDate);
		map.put("empCode", empCode);
		PayVO vo = dao.payMgtDetail(map);
		model.addAttribute("vo",vo);
	}
}
