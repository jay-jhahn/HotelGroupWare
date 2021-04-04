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

@Repository
public class HRDAOImpl implements HRDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Autowired
    private JavaMailSender mailSender; 

	@Override
	public int insertEmpInfo(EmployeeVO empVo) {
		int insertCnt = sqlSession.insert("com.hotel.hms.persistence.EmployeeDAO.insertEmpInfo", empVo);
		return insertCnt;
	}

	@Override
	public int insertFamMem(FamilyVO famVo) {
		int insertCnt = sqlSession.insert("com.hotel.hms.persistence.EmployeeDAO.insertFamMem", famVo);
		return insertCnt;
	}

	@Override
	public List<EmployeeVO> getEmpList(Map<String, Object> map) {
		List<EmployeeVO> empList = sqlSession.selectList("com.hotel.hms.persistence.EmployeeDAO.getEmpList", map);
		return empList;
	}

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
			message.setSubject("회원가입 인증 메일입니다.");
			message.setText(txt, "UTF-8", "html");
			message.setFrom(new InternetAddress("ajh3678@gmail.com"));
			message.addRecipient(RecipientType.TO, new InternetAddress(toEmail));
			mailSender.send(message);
		}catch(Exception e){
			e.printStackTrace();
		}  
	}
	
	@Override
	public int selectKey(String key) {
		int selectCnt = sqlSession.selectOne("com.hotel.hms.persistence.EmployeeDAO.selectKey", key);
		return selectCnt;
	}

	@Override
	public int updateEnabled(String key) {
		int updateCnt = sqlSession.update("com.hotel.hms.persistence.EmployeeDAO.updateEnabled", key);
		return updateCnt;
	}
	
	
	
}
