package com.hotel.hms.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hotel.hms.controller.HRController;
import com.hotel.hms.persistence.HRDAO;
import com.hotel.hms.vo.EmployeeVO;
import com.hotel.hms.vo.FamilyVO;
import com.hotel.hms.vo.RatScorePerItemVO;
import com.hotel.hms.vo.RatingItemVO;
import com.hotel.hms.vo.RatingLogVO;
import com.hotel.hms.vo.RatingVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import net.sf.json.JSONArray;

@Service
public class HRServiceImpl implements HRService {

	private static final Logger logger = LoggerFactory.getLogger(HRController.class);

	@Autowired
	HRDAO dao;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	// 업로드 외부 경로맵핑
	@Resource(name = "uploadPath")
	private String uploadPath;

	@SuppressWarnings("unchecked")
	@Override
	public void registerEmpAction(MultipartHttpServletRequest req, Model model) {
		////////////////// 증명사진 파일업로드 시작 /////////////////////////////////////////
		MultipartFile file = req.getFile("empImg");

		System.out.println("file ==> " + file);
		logger.info("originalName: " + file.getOriginalFilename());

		logger.info("size: " + file.getSize());
		logger.info("contentType: " + file.getContentType());
		String savedName = "";
		try {
			UUID uid = UUID.randomUUID();
			savedName = uid.toString() + "_" + file.getOriginalFilename();
			System.out.println("savedName ==> " + savedName);
			File target = new File(uploadPath, savedName);
			FileCopyUtils.copy(file.getBytes(), target);
		} catch (IOException e) {
			e.printStackTrace();
		}
		////////////////// 증명사진 파일업로드 끝 /////////////////////////////////////////

		////////////////// 개인정보 입력창 값 받아오기 시작 /////////////////////////////////////////
		String empCode = req.getParameter("empCode"); // 사번
		String empPwd = empCode; // 초기 비밀번호는 사번과 동일하다.
		String encryptPassword = passwordEncoder.encode(empPwd);
		String empName = req.getParameter("empName"); // 성명

		String empJumin = ""; // 주민번호
		String empJumin1 = req.getParameter("empJumin1");
		String empJumin2 = req.getParameter("empJumin2");
		if (empJumin1 != null && empJumin2 != null) {
			empJumin = empJumin1 + "-" + empJumin2;
		}
		System.out.println("empName ==> " + empName);
		System.out.println("empJumin ==> " + empJumin);

		String gender = req.getParameter("gender"); // 성별
		String empBirth = req.getParameter("empBirth"); // 생일
		String solarOrLunar = req.getParameter("solarOrLunar"); // 양/음력

		String empHomePhone = ""; // 자택 전화번호
		String homePhone1 = req.getParameter("homePhone1");
		String homePhone2 = req.getParameter("homePhone2");
		String homePhone3 = req.getParameter("homePhone3");
		if (homePhone1 != null && homePhone2 != null && homePhone3 != null) {
			empHomePhone = homePhone1 + "-" + homePhone2 + "-" + homePhone3;
		} else {
			empHomePhone = "없음";
		}

		String empPhone = ""; // 핸드폰
		String empPhone1 = req.getParameter("empPhone1");
		String empPhone2 = req.getParameter("empPhone2");
		String empPhone3 = req.getParameter("empPhone3");
		if (empPhone1 != null && empPhone2 != null && empPhone3 != null) {
			empPhone = empPhone1 + "-" + empPhone2 + "-" + empPhone3;
		} else {
			empPhone = "없음";
		}

		String empEmail = ""; // 이메일
		String empEmail1 = req.getParameter("empEmail1");
		String empEmail2 = req.getParameter("empEmail2");
		if (empEmail1 != null && empEmail2 != null) {
			empEmail = empEmail1 + "@" + empEmail2;
		} else {
			empEmail = "없음";
		}

		String postCode = req.getParameter("postCode"); // 우편번호
		String roadAddress = req.getParameter("roadAddress"); // 도로명주소
		String detailAddress = req.getParameter("detailAddress"); // 상세주소
		String extraAddress = req.getParameter("extraAddress"); // 참고항목

		String deptCode = req.getParameter("dept"); // 부서코드
		String payConStand = req.getParameter("payConStand"); // 급여계약기준
		String enterDate = req.getParameter("enterDate"); // 입사일자

		int levelCode = Integer.parseInt(req.getParameter("level")); // 직위코드
		String isProbation = req.getParameter("isProbation"); // 수습여부
		// 체크가 되지 않은 체크박스의 value는 null이 넘어오므로 null일 경우엔 N으로 초기화해준다.
		if (isProbation == null) {
			isProbation = "N";
		}
		System.out.println("isProbation ==> " + isProbation);
		String proRate = req.getParameter("rate"); // 적용률
		int rate = 0;
		if (!proRate.equals("")) {
			rate = Integer.parseInt(proRate);
		}
		String resignDate = req.getParameter("resignDate"); // 퇴사일자

		String dutyCode = req.getParameter("duty"); // 직책코드
		String empState = req.getParameter("empState"); // 재직구분

		String empNotes = req.getParameter("notes"); // 비고

		System.out.println("enterDate ==> " + enterDate);
		System.out.println("empPhone ==> " + empPhone);
		System.out.println("empBirth ==> " + empBirth);
		System.out.println("gender ==> " + gender);
		System.out.println("rate ==> " + rate);

		// 부서와 직위로 분류하여 권한 부여
		String empAuthority = "";
		switch (deptCode) {
			case "RO":
				switch (dutyCode) {
				case "NONE": case "EMP":
					empAuthority = "ROLE_RO";
					break;
				case "MNG":
					empAuthority = "ROLE_ROM";
					break;
				case "SMNG":
					empAuthority = "ROLE_ROSM";
					break;
				case "GM":
					empAuthority = "ROLE_GM";
					break;
				}
				break;
			case "OF":
				switch (dutyCode) {
				case "NONE": case "EMP":
					empAuthority = "ROLE_OFF";
					break;
				case "MNG":
					empAuthority = "ROLE_OFFM";
					break;
				case "SMNG":
					empAuthority = "ROLE_OFFSM";
					break;
				case "GM":
					empAuthority = "ROLE_GM";
					break;
				}
			break;
		}

		EmployeeVO empVo = new EmployeeVO();

		empVo.setEmpCode(empCode);
		empVo.setDeptCode(deptCode);
		empVo.setLevelCode(levelCode);
		empVo.setDutyCode(dutyCode);
		empVo.setEmpPwd(encryptPassword);
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
		empVo.setEmpImg(savedName);

		////////////////// 개인정보 입력창 값 받아오기 끝 /////////////////////////////////////////

		////////////////// 메세지 전송하기 시작 ///////////////////////////////////////////////
		String api_key = "NCSVCHFM3EJ6LS11";
		String api_secret = "S59P6KLXU4JIF8F6TDW0R3BGQA9ITRWA";
		Message coolsms = new Message(api_key, api_secret);

		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		String smsPhone = empPhone1 + empPhone2 + empPhone3;
		params.put("to", smsPhone);
		params.put("from", "01044591537");
		params.put("type", "LMS");
		params.put("text", empName + "님의 입사를 환영합니다.\n귀하의 사번은 '" + empCode
				+ "'입니다.\n본사의 그룹웨어 시스템 계정생성 이메일이 발송되었으니, 인증 후 이용하시기 바랍니다.\n감사합니다.");
		params.put("app_version", "test app 1.2"); // application name and version

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
		////////////////// 메세지 전송하기 끝 ///////////////////////////////////////////////

		////////////////// 이메일 전송하기 시작 ///////////////////////////////////////////////
		// Email 인증
		// 인증 키 부분
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 6; i++) {
			int rIndex = rnd.nextInt(2);
			switch (rIndex) {
			case 0:
				temp.append((char) ((int) (rnd.nextInt(26)) + 65));
				break;
			case 1:
				temp.append((rnd.nextInt(10)));
				break;
			}
		}
		String key = temp.toString();
		System.out.println("key1111111==>"+key);
		empVo.setEmpKey(key);
		
		// 개인정보 insert
		int insertEmpCnt = dao.insertEmpInfo(empVo);

		
		if (insertEmpCnt != 0) {
			dao.sendMail(empEmail, key);
		}
		////////////////// 이메일 전송하기 끝 ///////////////////////////////////////////////

		//////////////////가족사항 입력창 값 받아오기 시작 /////////////////////////////////////////
		String famMem = req.getParameter("femMems");
		
		List<Map<String, Object>> famMap = new ArrayList<Map<String, Object>>();
		famMap = JSONArray.fromObject(famMem);
		
		FamilyVO famVo = new FamilyVO();
		
		int insertFamCnt = 0;
		for (Map<String, Object> map : famMap) {
			famVo.setEmpCode(empCode);
			famVo.setRelation((String) map.get("relation"));
			famVo.setFaMemName((String) map.get("faMemName"));
			famVo.setFaMemAge((String) map.get("faMemAge"));
			famVo.setIsLiveTogt((String) map.get("isLiveTogt"));
			
			// 가족사항 insert
			insertFamCnt = dao.insertFamMem(famVo);
		}
		////////////////// 가족사항 입력창 값 받아오기 끝 /////////////////////////////////////////

		model.addAttribute("insertEmpCnt", insertEmpCnt);
		model.addAttribute("insertFamCnt", insertFamCnt);
	}

	@Override
	public void getEmpList(HttpServletRequest req, Model model) {
		int pageSize = 10; // 한 페이지당 출력할 글 갯수
		int pageBlock = 5; // 한 블록당 페이지 갯수

		int cnt = 0; // 글 갯수
		int start = 0; // 현재 페이지의 시작 글 번호
		int end = 0; // 현재 페이지의 마지막 글 번호
		int number = 0; // 출력용 글 번호
		String pageNum = ""; // 페이지 번호
		int currentPage = 0; // 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 마지막 페이지

		cnt = dao.empCount();

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1";
		}

		currentPage = Integer.parseInt(pageNum);

		pageCount = (cnt / pageSize) + ((cnt % pageSize) > 0 ? 1 : 0);

		start = (currentPage - 1) * pageSize + 1;

		end = start + pageSize - 1;

		number = cnt - (currentPage - 1) * pageSize;

		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if (currentPage % pageBlock == 0)
			startPage -= pageBlock;

		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;

		if (cnt > 0) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			List<EmployeeVO> empList = dao.getEmpList(map);
			model.addAttribute("empList", empList);
		}

		model.addAttribute("cnt", cnt);
		model.addAttribute("number", number);
		model.addAttribute("pageNum", pageNum);

		if (cnt > 0) {
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageBlock", pageBlock);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("currentPage", currentPage);
		}
	}
	
	// 이메일 인증 체크
	@Override
	public void emailChk(HttpServletRequest req, Model model) {
		String key = req.getParameter("key");
		System.out.println("key"+key);
		int selectCnt = dao.selectKey(key);
		if (selectCnt == 1) {
			int updateCnt = dao.updateEnabled(key);
			model.addAttribute("updateCnt", updateCnt);
		}
	}
<<<<<<< HEAD
=======

	@Override
	public void empDetail(HttpServletRequest req, Model model) {
		String empCode = req.getParameter("empCode");
		EmployeeVO empVo = dao.empDetail(empCode);
		List<FamilyVO> empFamMemList = dao.empFamMemList(empCode);
		List<RatingItemVO> rtList = dao.getRatingItem();
		
		model.addAttribute("rtList", rtList);
		model.addAttribute("empVo", empVo);
		model.addAttribute("empFamMemList", empFamMemList);
	}

	@SuppressWarnings("unchecked")
	@Override
	public void modifyAction(MultipartHttpServletRequest req, Model model) {
		//////////////////증명사진 파일업로드 시작 /////////////////////////////////////////
		MultipartFile file = req.getFile("empImg");
		
		System.out.println("file ==> " + file);
		logger.info("originalName: " + file.getOriginalFilename());
		
		logger.info("size: " + file.getSize());
		logger.info("contentType: " + file.getContentType());
		String savedName = "";
		try {
			UUID uid = UUID.randomUUID();
			savedName = uid.toString() + "_" + file.getOriginalFilename();
			System.out.println("savedName ==> " + savedName);
			File target = new File(uploadPath, savedName);
			FileCopyUtils.copy(file.getBytes(), target);
		} catch (IOException e) {
			e.printStackTrace();
		}
		////////////////// 증명사진 파일업로드 끝 /////////////////////////////////////////
		
		////////////////// 개인정보 입력창 값 받아오기 시작 /////////////////////////////////////////
		String empCode = req.getParameter("empCode"); // 사번
		String empName = req.getParameter("empName"); // 성명
		
		String empJumin = ""; // 주민번호
		String empJumin1 = req.getParameter("empJumin1");
		String empJumin2 = req.getParameter("empJumin2");
		if (empJumin1 != null && empJumin2 != null) {
			empJumin = empJumin1 + "-" + empJumin2;
		}
		System.out.println("empJumin ==> " + empJumin);
		
		String gender = req.getParameter("gender"); // 성별
		String empBirth = req.getParameter("empBirth"); // 생일
		String solarOrLunar = req.getParameter("solarOrLunar"); // 양/음력
		
		String empHomePhone = ""; // 자택 전화번호
		String homePhone1 = req.getParameter("homePhone1");
		String homePhone2 = req.getParameter("homePhone2");
		String homePhone3 = req.getParameter("homePhone3");
		if (homePhone1 != null && homePhone2 != null && homePhone3 != null) {
			empHomePhone = homePhone1 + "-" + homePhone2 + "-" + homePhone3;
		} else {
			empHomePhone = "없음";
		}
		
		String empPhone = ""; // 핸드폰
		String empPhone1 = req.getParameter("empPhone1");
		String empPhone2 = req.getParameter("empPhone2");
		String empPhone3 = req.getParameter("empPhone3");
		if (empPhone1 != null && empPhone2 != null && empPhone3 != null) {
			empPhone = empPhone1 + "-" + empPhone2 + "-" + empPhone3;
		} else {
			empPhone = "없음";
		}
		
		String empEmail = ""; // 이메일
		String empEmail1 = req.getParameter("empEmail1");
		String empEmail2 = req.getParameter("empEmail2");
		if (empEmail1 != null && empEmail2 != null) {
			empEmail = empEmail1 + "@" + empEmail2;
		} else {
			empEmail = "없음";
		}
		
		String postCode = req.getParameter("postCode"); // 우편번호
		String roadAddress = req.getParameter("roadAddress"); // 도로명주소
		String detailAddress = req.getParameter("detailAddress"); // 상세주소
		String extraAddress = req.getParameter("extraAddress"); // 참고항목
		
		String deptCode = req.getParameter("dept"); // 부서코드
		String payConStand = req.getParameter("payConStand"); // 급여계약기준
		String enterDate = req.getParameter("enterDate"); // 입사일자
		
		int levelCode = Integer.parseInt(req.getParameter("level")); // 직위코드
		String isProbation = req.getParameter("isProbation"); // 수습여부
		// 체크가 되지 않은 체크박스의 value는 null이 넘어오므로 null일 경우엔 N으로 초기화해준다.
		if (isProbation == null) {
			isProbation = "N";
		}
		System.out.println("isProbation ==> " + isProbation);
		String proRate = req.getParameter("rate"); // 적용률
		int rate = 0;
		if (!proRate.equals("")) {
			rate = Integer.parseInt(proRate);
		}
		String resignDate = req.getParameter("resignDate"); // 퇴사일자
		
		String dutyCode = req.getParameter("duty"); // 직책코드
		String empState = req.getParameter("empState"); // 재직구분
		
		String empNotes = req.getParameter("notes"); // 비고
		
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
			case 1:
			case 2:
			case 3:
				empAuthority = "ROLE_RO";
				break;
			case 4:
			case 5:
			case 6:
				empAuthority = "ROLE_ROM";
			case 7:
			case 8:
			case 9:
				empAuthority = "ROLE_ROSM";
				break;
			}
			break;
		case "OF":
			switch (levelCode) {
			case 1:
			case 2:
			case 3:
				empAuthority = "ROLE_OFF";
				break;
			case 4:
			case 5:
			case 6:
				empAuthority = "ROLE_OFFM";
			case 7:
			case 8:
			case 9:
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
		empVo.setEmpImg(savedName);
		////////////////// 개인정보 입력창 값 받아오기 끝 /////////////////////////////////////////
		
		////////////////// 가족사항 입력창 값 받아오기 시작 /////////////////////////////////////////
		String famMem = req.getParameter("femMems");
		
		List<Map<String, Object>> famMap = new ArrayList<Map<String, Object>>();
		famMap = JSONArray.fromObject(famMem);
		FamilyVO famVo = new FamilyVO();
		
		int updateFamCnt = 0;
		for (Map<String, Object> map : famMap) {
			famVo.setEmpCode(empCode);
			famVo.setRelation((String) map.get("relation"));
			famVo.setFaMemName((String) map.get("faMemName"));
			famVo.setFaMemAge((String) map.get("faMemAge"));
			famVo.setIsLiveTogt((String) map.get("isLiveTogt"));
		
			updateFamCnt = dao.updateFamInfo(famVo);
		}
		////////////////// 가족사항 입력창 값 받아오기 끝 /////////////////////////////////////////
		
		////////////////// 메세지 전송하기 시작 ///////////////////////////////////////////////
		String api_key = "NCSVCHFM3EJ6LS11";
		String api_secret = "S59P6KLXU4JIF8F6TDW0R3BGQA9ITRWA";
		Message coolsms = new Message(api_key, api_secret);
		
		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		String smsPhone = empPhone1 + empPhone2 + empPhone3;
		params.put("to", smsPhone);
		params.put("from", "01044591537");
		params.put("type", "LMS");
		params.put("text", empName + "님의 개인정보가 수정되었습니다.\n그룹웨어 내 마이페이지에서 하시기 바랍니다.\n감사합니다.");
		params.put("app_version", "test app 1.2"); // application name and version
		
		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
		////////////////// 메세지 전송하기 끝 ///////////////////////////////////////////////
		// 개인정보 insert
		int updateEmpCnt = dao.updateEmpInfo(empVo);
		
		model.addAttribute("updateEmpCnt", updateEmpCnt);
		model.addAttribute("updateFamCnt", updateFamCnt);
		}

	@Override
	public void getEmpListDept(HttpServletRequest req, Model model) {
		String deptCode = req.getParameter("deptCode");
		String empCode = (String)req.getSession().getAttribute("empCode");
		
		System.out.println("deptCodedeptCode"+deptCode);
		System.out.println("empCodeempCode"+empCode);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("empCode", empCode);
		map.put("deptCode", deptCode);
		
		// 로그인한 사원의 권한(직책)체크
		EmployeeVO empVo = dao.empDetail(empCode);
		String dutyCode = empVo.getDutyVo().getDutyCode();
		List<EmployeeVO> empList = null;
		
		if(dutyCode.equals("MNG")) {
			empList = dao.getEmpListDeptMNG(map);
		} else if(dutyCode.equals("SMNG") || dutyCode.equals("GM")) {
			empList = dao.getEmpListDeptSMNG(map);
		}
		
		model.addAttribute("deptCode", deptCode);
		model.addAttribute("deptName", empList.get(0).getDeptVo().getDeptName());
		model.addAttribute("empList", empList);
	}

	// 인사고과 평가 내용 저장
	@Override
	public void ratingAction(HttpServletRequest req, Model model) {
		//////////////////////// 고과내역 테이블 저장 시작 ////////////////////////
		// 평가항목별 점수 받아오기
		String score1 = req.getParameter("score1");
		String score2 = req.getParameter("score2");
		String score3 = req.getParameter("score3");
		String score4 = req.getParameter("score4");
		String score5 = req.getParameter("score5");
		String score6 = req.getParameter("score6");
		String score7 = req.getParameter("score7");
		String score8 = req.getParameter("score8");
		
		// 받아온 점수들을 array에 담아줌
		ArrayList<String> scoreArr = new ArrayList<String>();
		scoreArr.add(score1);
		scoreArr.add(score2);
		scoreArr.add(score3);
		scoreArr.add(score4);
		scoreArr.add(score5);
		scoreArr.add(score6);
		scoreArr.add(score7);
		scoreArr.add(score8);
	
		// 고과 평가 날짜 받아오기
		String ratDate = req.getParameter("ratDate");
		String year = ratDate.substring(0, 4);
		System.out.println("year=================>"+year);
		// 피평가자 사번 받아오기
		String empCode = req.getParameter("empCode");
		
		// 피평가자 직위, 부서코드 검색
		EmployeeVO empVo = dao.empDetail(empCode);
		int levelCode = empVo.getLevelVo().getLevelCode();
		String deptCode = empVo.getDeptVo().getDeptCode();

		// 평균 받아오기
		String avg = req.getParameter("avg");
		// String형의 평균을 float으로 변환
		float favg = Float.parseFloat(avg);
		
		// 평균값이 해당하는 등급 조회
		RatingVO rtVo = dao.getGrade(favg);
		String ratGrade = rtVo.getRatGrade();
		
		Map<String, Object> ratLogMap = new HashMap<String, Object>();
		ratLogMap.put("empCode", empCode);
		ratLogMap.put("levelCode", levelCode);
		ratLogMap.put("deptCode", deptCode);
		ratLogMap.put("ratGrade", ratGrade);
		ratLogMap.put("ratDate", ratDate);
		ratLogMap.put("ratAvg", avg);
		
		// 인사고과 내역 저장
		int insertCnt = dao.insertRatLog(ratLogMap);
		System.out.println("insertCnt=======>" + insertCnt);
		//////////////////////// 고과내역 테이블 저장 끝 ////////////////////////

		//////////////////////// 고과항목별 점수 저장 //////////////////////////
		// 저장한 고과 내역 코드 가져오기
		Map<String , String> logCodeMap = new HashMap<String, String>();
		logCodeMap.put("empCode", empCode);
		logCodeMap.put("year", year);
		int ratLogCode = dao.getRatLogCode(logCodeMap);


		List<RatingItemVO> riList = dao.getRatingItem();	// 고가평가항목명을 담을 리스트
		
		Map<String, Object> ratScorePerItemMap = new HashMap<String, Object>();
		int insertRspiCnt = 0;
		for(int i=0;i<riList.size();i++) {
			int ratItemCode = riList.get(i).getRatItemCode();
			float ratScore = Float.parseFloat(scoreArr.get(i));
			ratScorePerItemMap.put("ratItemCode", ratItemCode);
			ratScorePerItemMap.put("ratLogCode", ratLogCode);
			ratScorePerItemMap.put("empCode", empCode);
			ratScorePerItemMap.put("ratDate", ratDate);
			ratScorePerItemMap.put("ratScore", ratScore);
			// 고과 항목별 점수 저장
			insertRspiCnt = dao.insertRatScorePerItem(ratScorePerItemMap);
		}
		//////////////////////// 고과항목별 점수 끝 ////////////////////////////

		///////////////////// 화면에 뿌릴 평가정보 가져오기 /////////////////////////
		// 제대로 저장이 되었다면
		if(insertCnt==1 && insertRspiCnt==1) {
			Map<String, String> logMap = new HashMap<String, String>();
			logMap.put("empCode", empCode);
			logMap.put("year", year);
			
			// 고과내역 가져옴
			RatingLogVO rlVo = dao.getRatLog(logMap);
			
			Map<String, Object> updateMap = new HashMap<String, Object>();
			updateMap.put("empCode", empCode);
			updateMap.put("cnt", 1); // 저장(제출 전)
			dao.updateState(updateMap);
			
			Map<String, Object> rspiMap = new HashMap<String, Object>();
			rspiMap.put("empCode", empCode);
			rspiMap.put("year", year);
			
			System.out.println("Before getRspi()");
			List<RatScorePerItemVO> rspiList = dao.getRspi(rspiMap);
			System.out.println("rspiList ==> "+rspiList);
			System.out.println(rspiList.get(1).getRatItem());
			
			model.addAttribute("rspiList", rspiList);
			model.addAttribute("empVo", empVo);
			model.addAttribute("rlVo", rlVo);
		} else {
			model.addAttribute("errMsg", "평가정보 입력에 실패하였습니다.");
		}
		///////////////////// 화면에 뿌릴 평가정보 가져오기 /////////////////////////		
	}

	@Override
	public void getRatingResult(HttpServletRequest req, Model model) {
		Calendar cal = Calendar.getInstance();
		String year = Integer.toString(cal.get(Calendar.YEAR));
		
		// 피평가자 사번 받아오기
		String empCode = req.getParameter("empCode");
		// 피평가자 직위, 부서코드 검색
		EmployeeVO empVo = dao.empDetail(empCode);
		
		Map<String, String> logMap = new HashMap<String, String>();
		logMap.put("empCode", empCode);
		logMap.put("year", year);
		
		// 고과내역 가져옴
		RatingLogVO rlVo = dao.getRatLog(logMap);
		
		Map<String, Object> updateMap = new HashMap<String, Object>();
		updateMap.put("empCode", empCode);
		updateMap.put("cnt", 1); // 저장(제출 전)
		dao.updateState(updateMap);
		
		Map<String, Object> rspiMap = new HashMap<String, Object>();
		rspiMap.put("empCode", empCode);
		rspiMap.put("year", year);
		
		System.out.println("Before getRspi()");
		List<RatScorePerItemVO> rspiList = dao.getRspi(rspiMap);
		System.out.println("rspiList ==> "+rspiList);
		System.out.println(rspiList.get(1).getRatItem());
		
		String ratingState = empVo.getRatingState();
		
		if(ratingState.equals("0")) {
			model.addAttribute("rspiList", rspiList);
			model.addAttribute("empVo", empVo);
		} else if (ratingState.equals("1")) {
			model.addAttribute("rspiList", rspiList);
			model.addAttribute("empVo", empVo);
			model.addAttribute("rlVo", rlVo);
		}
	}
	
	// 인사고과 평가 결재 상태 변경
	@Override
	public void updateState(HttpServletRequest req, Model model) {
		String empCode = req.getParameter("empCode");
		// 피평가자 정보 가져오기
		EmployeeVO empVo = dao.empDetail(empCode);
		// 피평가자 인사고과 평가 결재 상태 가져오기
		String ratingState = empVo.getRatingState();
		
		// 결재상태가 저장(제출 전)
		if(ratingState == "1") {
			// 결재상태 2 : 제출, 결재대기
			ratingState = "2";
		} else if(ratingState == "2") {
			// 결재상태 3 : 결재완료
			ratingState = "3";
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("empCode", empCode);
		map.put("ratingState", ratingState);

		int updateCnt = dao.updateState(map);
		model.addAttribute("ratingState", ratingState);
		model.addAttribute("updateCnt", updateCnt);
	}

>>>>>>> main
}