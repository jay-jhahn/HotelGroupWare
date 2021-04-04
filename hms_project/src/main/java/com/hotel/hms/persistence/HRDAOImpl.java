package com.hotel.hms.persistence;

import java.util.List;
import java.util.Map;

import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;

import com.hotel.hms.vo.EmployeeVO;
import com.hotel.hms.vo.FamilyVO;
import com.hotel.hms.vo.RatScorePerItemVO;
import com.hotel.hms.vo.RatingItemVO;
import com.hotel.hms.vo.RatingLogVO;
import com.hotel.hms.vo.RatingVO;

@Repository
public class HRDAOImpl implements HRDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Autowired
    private JavaMailSender mailSender; 

	// 인적사항 insert
	@Override
	public int insertEmpInfo(EmployeeVO empVo) {
		int insertCnt = sqlSession.insert("com.hotel.hms.persistence.EmployeeDAO.insertEmpInfo", empVo);
		return insertCnt;
	}

	// 가족사항 insert
	@Override
	public int insertFamMem(FamilyVO famVo) {
		int insertCnt = sqlSession.insert("com.hotel.hms.persistence.EmployeeDAO.insertFamMem", famVo);
		return insertCnt;
	}

	// 사원 리스트 조회
	@Override
	public List<EmployeeVO> getEmpList(Map<String, Object> map) {
		List<EmployeeVO> empList = sqlSession.selectList("com.hotel.hms.persistence.EmployeeDAO.getEmpList", map);
		return empList;
	}

	// 사원 총 인원 조회
	@Override
	public int empCount() {
		int empCnt = sqlSession.selectOne("com.hotel.hms.persistence.EmployeeDAO.empCount");
		return empCnt;
	}
	
	// 이메일 인증
	@Override
	public void sendMail(String toEmail, String key) {
		try{
            MimeMessage message = mailSender.createMimeMessage();
            String txt = "귀하의 Royal Kostel 입사를 진심으로 축하드립니다.<br>이 메일은 본사 그룹웨어 시스템 계정생성 인증 메일입니다. 링크를 눌러 귀하의 계정 생성을 완료하세요.<br>"
            		+ "초기 비밀번호는 사번과 동일합니다. 반드시 비밀번호 변경이후에 이용하시기 바랍니다. 감사합니다.<br>" 
            		+ "<a href='http://localhost/hms/emailChk.al?key=" + key + "'>인증하기</a>";
            
            System.out.println(txt);
			message.setSubject("Royal Kostel 그룹웨어 계정생성 인증 메일입니다.");
			message.setText(txt, "UTF-8", "html");
			message.setFrom(new InternetAddress("ajh3678@gmail.com"));
			message.addRecipient(RecipientType.TO, new InternetAddress(toEmail));
			mailSender.send(message);
		}catch(Exception e){
			e.printStackTrace();
		}  
	}
	
	// 이메일 인증 키 조회
	@Override
	public int selectKey(String key) {
		int selectCnt = sqlSession.selectOne("com.hotel.hms.persistence.EmployeeDAO.selectKey", key);
		return selectCnt;
	}

	// empEnabled 업데이트
	@Override
	public int updateEnabled(String key) {
		int updateCnt = sqlSession.update("com.hotel.hms.persistence.EmployeeDAO.updateEnabled", key);
		return updateCnt;
	}
<<<<<<< HEAD
=======

	// 직원 개인 상세정보
	@Override
	public EmployeeVO empDetail(String empCode) {
		EmployeeVO empVo = sqlSession.selectOne("com.hotel.hms.persistence.EmployeeDAO.empDetail", empCode);
		return empVo;
	}

	// 직원 가족사항 정보
	@Override
	public List<FamilyVO> empFamMemList(String empCode) {
		List<FamilyVO> empFamMemList = sqlSession.selectList("com.hotel.hms.persistence.EmployeeDAO.empFamMemList", empCode);
		return empFamMemList;
	}

	// 직원 개인정보 업데이트
	@Override
	public int updateEmpInfo(EmployeeVO empVo) {
		int updateCnt = sqlSession.update("com.hotel.hms.persistence.EmployeeDAO.updateEmpInfo", empVo);
		return updateCnt;
	}

	// 직원 가족사항 업데이트
	@Override
	public int updateFamInfo(FamilyVO famVo) {
		int updateCnt = sqlSession.update("com.hotel.hms.persistence.EmployeeDAO.updateFamInfo", famVo);
		return updateCnt;
	}

	// 인사고과 부서별 사원 리스트 : 매니저일 때
	@Override
	public List<EmployeeVO> getEmpListDeptMNG(Map<String, String> map) {
		List<EmployeeVO> empList = sqlSession.selectList("com.hotel.hms.persistence.EmployeeDAO.getEmpListDeptMNG", map);
		return empList;
	}

	// 인사고과 부서별 사원 리스트: 시니어 매니저일 때
	@Override
	public List<EmployeeVO> getEmpListDeptSMNG(Map<String, String> map) {
		List<EmployeeVO> empList = sqlSession.selectList("com.hotel.hms.persistence.EmployeeDAO.getEmpListDeptSMNG", map);
		return empList;
	}

	// 인사고과 평가항목 가져오기
	@Override
	public List<RatingItemVO> getRatingItem() {
		List<RatingItemVO> rtList = sqlSession.selectList("com.hotel.hms.persistence.EmployeeDAO.getRatingItem");
		return rtList;
	}

	// 인사고과 평가창 고과등급 가져오기
	@Override
	public RatingVO getGrade(float avg) {
		RatingVO rtVo = sqlSession.selectOne("com.hotel.hms.persistence.EmployeeDAO.getGrade", avg);
		return rtVo;
	}
	
	// 인사고과 평가 내용 저장
	@Override
	public int insertRatLog(Map<String, Object> map) {
		int insertCnt = sqlSession.insert("com.hotel.hms.persistence.EmployeeDAO.insertRatLog", map);
		return insertCnt;
	}

	// 인사고과 평가내용 조회
	@Override
	public RatingLogVO getRatLog(Map<String, String> map) {
		RatingLogVO rlVo = sqlSession.selectOne("com.hotel.hms.persistence.EmployeeDAO.getRatLog", map);
		return rlVo;
	}

	// 상태 업데이트
	@Override
	public int updateState(Map<String, Object> map) {
		int updateCnt = sqlSession.update("com.hotel.hms.persistence.EmployeeDAO.updateState", map);
		return updateCnt;
	}

	// 항목별 점수 업데이트
	@Override
	public int insertRatScorePerItem(Map<String, Object> map) {
		int insertCnt = sqlSession.insert("com.hotel.hms.persistence.EmployeeDAO.insertRatScorePerItem", map);
		return insertCnt;
	}

	// 고과 내역 코드 가져오기
	@Override
	public int getRatLogCode(Map<String, String> map) {
		int ratLogCode = sqlSession.selectOne("com.hotel.hms.persistence.EmployeeDAO.getRatLogCode", map);
		return ratLogCode;
	}
	
	// 고과 평가 항목별 점수 가져오기
	@Override
	public List<RatScorePerItemVO> getRspi(Map<String, Object> map) {
		List<RatScorePerItemVO> rspiList = sqlSession.selectList("com.hotel.hms.persistence.EmployeeDAO.getRspi", map);
		return rspiList;
	}
	
	
>>>>>>> main
	
	
	
}
