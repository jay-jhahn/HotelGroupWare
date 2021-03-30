package com.hotel.hms.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hotel.hms.persistence.HRDAO;
import com.hotel.hms.vo.EmployeeVO;
import com.hotel.hms.vo.FamilyVO;

import net.sf.json.JSONArray;

@Service
public class HRServiceImpl implements HRService {
	
	@Autowired
	HRDAO dao;

	@SuppressWarnings("unchecked")
	@Override
	public void registerEmpAction(MultipartHttpServletRequest multi, Model model) {
		//////////////////증명사진 파일업로드 시작 /////////////////////////////////////////
		//MultipartFile file = multi.getFile("imgInput");
		//
		//String path = "";
		//String original = file.getOriginalFilename(); // 업로드하는 파일 name
		//String uploadPath = "";
		//
		//System.out.println("!!!!!!!!!" + file);
		//System.out.println("!!!!!!!!!" + original);
		//System.out.println("!!!!!!!!!" + file.getSize());
		//
		//uploadPath = path + original;
		
		//try {
		//	file.transferTo(new File(uploadPath));
		//} catch (IllegalStateException e) {
		//	e.printStackTrace();
		//} catch (IOException e) {
		//	e.printStackTrace();
		//}
		//service.registerEmpAction(multi, model);
		////////////////// 증명사진 파일업로드 끝 /////////////////////////////////////////
		
		////////////////// 개인정보 입력창 값 받아오기 시작 /////////////////////////////////////////
		String empCode = multi.getParameter("empCode");		// 사번
		String empPwd = empCode;		// 초기 비밀번호는 사번과 동일하다.
		String empName = multi.getParameter("empName");		// 성명
		
		String empJumin = "";								// 주민번호
		String empJumin1 = multi.getParameter("empJumin1");
		String empJumin2 = multi.getParameter("empJumin2");
		if(empJumin1 != null && empJumin2 != null) {
			empJumin = empJumin1 + "-" + empJumin2;
		}
		System.out.println("empName ==> " + empName);
		System.out.println("empJumin ==> " + empJumin);
		
		String gender = multi.getParameter("gender");		//성별
		String empBirth = multi.getParameter("empBirth");	// 생일
		String solarOrLunar = multi.getParameter("solarOrLunar");	// 양/음력
		
		String empHomePhone = "";	// 자택 전화번호
		String homePhone1 = multi.getParameter("homePhone1");
		String homePhone2 = multi.getParameter("homePhone2");
		String homePhone3 = multi.getParameter("homePhone3");
		if (homePhone1 != null && homePhone2 != null && homePhone3 != null) {
			empHomePhone = homePhone1 + "-" + homePhone2 + "-" + homePhone3;
		} else {
			empHomePhone = "없음";
		}
		
		String empPhone = "";	// 핸드폰
		String empPhone1 = multi.getParameter("empPhone1");
		String empPhone2 = multi.getParameter("empPhone2");
		String empPhone3 = multi.getParameter("empPhone3");
		if (empPhone1 != null && empPhone2 != null && empPhone3 != null) {
			empPhone = empPhone1 + "-" + empPhone2 + "-" + empPhone3;
		} else {
			empPhone = "없음";
		}
		
		String empEmail = "";	// 이메일
		String empEmail1 = multi.getParameter("empEmail1");
		String empEmail2 = multi.getParameter("empEmail2");
		if (empEmail1 != null && empEmail2 != null) {
			empEmail = empEmail1 + "@" + empEmail2;
		} else {
			empEmail = "없음";
		}
		
		String postCode = multi.getParameter("postCode");			// 우편번호
		String roadAddress = multi.getParameter("roadAddress");		// 도로명주소
		String jibunAddress = multi.getParameter("jibunAddress");	// 지번주소
		String detailAddress = multi.getParameter("detailAddress");	// 상세주소
		String extraAddress = multi.getParameter("extraAddress");	// 참고항목
		
		String deptCode = multi.getParameter("dept");				// 부서코드
		String payConStand = multi.getParameter("payConStand");		// 급여계약기준
		String enterDate = multi.getParameter("enterDate");			// 입사일자
		
		int levelCode = Integer.parseInt(multi.getParameter("level"));	// 직위코드
		String isProbation = multi.getParameter("isProbation");		// 수습여부
		String proRate = multi.getParameter("rate");				// 적용률	
		int rate = 0;
		if(!proRate.equals("")) {
			rate = Integer.parseInt(proRate);
		}
		String resignDate = multi.getParameter("resignDate");	// 퇴사일자
		
		String dutyCode = multi.getParameter("duty");			// 직책코드
		String empState = multi.getParameter("empState");		// 재직구분
		
		String empNotes = multi.getParameter("notes");		// 비고
		
		System.out.println("enterDate ==> " + enterDate);
		System.out.println("empPhone ==> " + empPhone); 
		System.out.println("empBirth ==> " + empBirth);
		System.out.println("gender ==> " + gender);
		System.out.println("rate ==> " + rate);
		
		// 부서와 직위로 분류하여 권한 부여
		String empAuthority = "";
		switch (deptCode) {
		case "RO":
			switch (levelCode) {
				case 1: case 2: case 3:
					empAuthority = "ROLE_RO";
					break;
				case 4: case 5: case 6:
					empAuthority = "ROLE_ROM";
				case 7: case 8: case 9:
					empAuthority = "ROLE_ROSM";
					break;
				}
				break;
		case "OF":
			switch (levelCode) {
				case 1: case 2: case 3:
					empAuthority = "ROLE_OFF";
					break;
				case 4: case 5: case 6:
					empAuthority = "ROLE_OFFM";
				case 7: case 8: case 9:
					empAuthority = "ROLE_OFFSM";
					break;
				}
				break;
		}
		
		EmployeeVO empVo = new EmployeeVO();
		
		empVo.setEmpCode(empCode);
		empVo.setDeptCode(deptCode);
		empVo.setLevelCode(levelCode);
		empVo.setDutyCode(dutyCode);
		empVo.setEmpPwd(empPwd);
		empVo.setEmpName(empName);
		empVo.setEmpJumin(empJumin);
		empVo.setGender(gender);
		empVo.setEmpBirth(empBirth);
		empVo.setSolarOrLunar(solarOrLunar);
		empVo.setEmpHomePhone(empHomePhone);
		empVo.setEmpPhone(empPhone);
		empVo.setEmpEmail(empEmail);
		empVo.setPostCode(postCode);
		empVo.setRoadAddress(roadAddress);
		empVo.setDetailAddress(detailAddress);
		empVo.setExtraAddress(extraAddress);
		empVo.setPayConStand(payConStand);
		empVo.setIsProbation(isProbation);
		empVo.setRate(rate);
		empVo.setEmpState(empState);
		empVo.setEnterDate(enterDate);
		empVo.setResignDate(resignDate);
		empVo.setEmpNotes(empNotes);
		empVo.setEmpAuthority(empAuthority);
		empVo.setEmpImg("");
		
		dao.insertEmpInfo(empVo);
		////////////////// 개인정보 입력창 값 받아오기 끝 /////////////////////////////////////////
		
		////////////////// 가족사항 입력창 값 받아오기 시작 /////////////////////////////////////////
		String famMem = multi.getParameter("femMems");
		
		List<Map<String, Object>> famMap = new ArrayList<Map<String,Object>>();
		famMap = JSONArray.fromObject(famMem);
		
		FamilyVO famVo = new FamilyVO();
		for(Map<String, Object> map : famMap) {
			famVo.setEmpCode(empCode);
			famVo.setRelation((String)map.get("relation"));
			famVo.setFaMemName((String)map.get("faMemName"));
			famVo.setFaMemAge((String)map.get("faMemAge"));
			famVo.setIsLiveTogt((String)map.get("isLiveTogt"));
			
			dao.insertFamMem(famVo);
		}

		////////////////// 가족사항 입력창 값 받아오기 끝 /////////////////////////////////////////
	}
}
