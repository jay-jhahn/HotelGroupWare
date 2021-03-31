package com.hotel.hms.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hotel.hms.controller.HRController;
import com.hotel.hms.persistence.HRDAO;
import com.hotel.hms.vo.EmployeeVO;
import com.hotel.hms.vo.FamilyVO;

import net.sf.json.JSONArray;

@Service
public class HRServiceImpl implements HRService {
	
	private static final Logger logger = LoggerFactory.getLogger(HRController.class);
	
	@Autowired
	HRDAO dao;
	
	// 업로드 외부 경로맵핑
	@Resource(name = "uploadPath")
	private String uploadPath;

	@SuppressWarnings("unchecked")
	@Override
	public void registerEmpAction(MultipartHttpServletRequest req, Model model) {
		//////////////////증명사진 파일업로드 시작 /////////////////////////////////////////
		MultipartFile file = req.getFile("empImg");
		System.out.println("file ==> "+file);
		logger.info("originalName: " + file.getOriginalFilename());
		logger.info("size: " + file.getSize());
		logger.info("contentType: " + file.getContentType());

		try {
			UUID uid = UUID.randomUUID();
			String savedName = uid.toString() + "_" + file.getOriginalFilename();
			System.out.println("savedName ==> "+savedName);
			File target = new File(uploadPath, savedName);
			FileCopyUtils.copy(file.getBytes(), target);
		} catch (IOException e) {
			e.printStackTrace();
		}
		////////////////// 증명사진 파일업로드 끝 /////////////////////////////////////////
		
		////////////////// 개인정보 입력창 값 받아오기 시작 /////////////////////////////////////////
		String empCode = req.getParameter("empCode");		// 사번
		String empPwd = empCode;		// 초기 비밀번호는 사번과 동일하다.
		String empName = req.getParameter("empName");		// 성명
		
		String empJumin = "";								// 주민번호
		String empJumin1 = req.getParameter("empJumin1");
		String empJumin2 = req.getParameter("empJumin2");
		if(empJumin1 != null && empJumin2 != null) {
			empJumin = empJumin1 + "-" + empJumin2;
		}
		System.out.println("empName ==> " + empName);
		System.out.println("empJumin ==> " + empJumin);
		
		String gender = req.getParameter("gender");		//성별
		String empBirth = req.getParameter("empBirth");	// 생일
		String solarOrLunar = req.getParameter("solarOrLunar");	// 양/음력
		
		String empHomePhone = "";	// 자택 전화번호
		String homePhone1 = req.getParameter("homePhone1");
		String homePhone2 = req.getParameter("homePhone2");
		String homePhone3 = req.getParameter("homePhone3");
		if (homePhone1 != null && homePhone2 != null && homePhone3 != null) {
			empHomePhone = homePhone1 + "-" + homePhone2 + "-" + homePhone3;
		} else {
			empHomePhone = "없음";
		}
		
		String empPhone = "";	// 핸드폰
		String empPhone1 = req.getParameter("empPhone1");
		String empPhone2 = req.getParameter("empPhone2");
		String empPhone3 = req.getParameter("empPhone3");
		if (empPhone1 != null && empPhone2 != null && empPhone3 != null) {
			empPhone = empPhone1 + "-" + empPhone2 + "-" + empPhone3;
		} else {
			empPhone = "없음";
		}
		
		String empEmail = "";	// 이메일
		String empEmail1 = req.getParameter("empEmail1");
		String empEmail2 = req.getParameter("empEmail2");
		if (empEmail1 != null && empEmail2 != null) {
			empEmail = empEmail1 + "@" + empEmail2;
		} else {
			empEmail = "없음";
		}
		
		String postCode = req.getParameter("postCode");			// 우편번호
		String roadAddress = req.getParameter("roadAddress");		// 도로명주소
		String jibunAddress = req.getParameter("jibunAddress");	// 지번주소
		String detailAddress = req.getParameter("detailAddress");	// 상세주소
		String extraAddress = req.getParameter("extraAddress");	// 참고항목
		
		String deptCode = req.getParameter("dept");				// 부서코드
		String payConStand = req.getParameter("payConStand");		// 급여계약기준
		String enterDate = req.getParameter("enterDate");			// 입사일자
		
		int levelCode = Integer.parseInt(req.getParameter("level"));	// 직위코드
		String isProbation = req.getParameter("isProbation");		// 수습여부
		System.out.println("isProbation ==> " + isProbation);
		String proRate = req.getParameter("rate");				// 적용률	
		int rate = 0;
		if(!proRate.equals("")) {
			rate = Integer.parseInt(proRate);
		}
		String resignDate = req.getParameter("resignDate");	// 퇴사일자
		
		String dutyCode = req.getParameter("duty");			// 직책코드
		String empState = req.getParameter("empState");		// 재직구분
		
		String empNotes = req.getParameter("notes");		// 비고
		
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
		
		int insertEmpCnt = dao.insertEmpInfo(empVo);
		////////////////// 개인정보 입력창 값 받아오기 끝 /////////////////////////////////////////
		
		////////////////// 가족사항 입력창 값 받아오기 시작 /////////////////////////////////////////
		String famMem = req.getParameter("femMems");
		
		List<Map<String, Object>> famMap = new ArrayList<Map<String,Object>>();
		famMap = JSONArray.fromObject(famMem);
		
		FamilyVO famVo = new FamilyVO();
		
		int insertFamCnt = 0;
		for(Map<String, Object> map : famMap) {
			famVo.setEmpCode(empCode);
			famVo.setRelation((String)map.get("relation"));
			famVo.setFaMemName((String)map.get("faMemName"));
			famVo.setFaMemAge((String)map.get("faMemAge"));
			famVo.setIsLiveTogt((String)map.get("isLiveTogt"));
			
			insertFamCnt = dao.insertFamMem(famVo);
		}
		////////////////// 가족사항 입력창 값 받아오기 끝 /////////////////////////////////////////
		
		model.addAttribute("insertEmpCnt", insertEmpCnt);
		model.addAttribute("insertFamCnt", insertFamCnt);
	}

}
