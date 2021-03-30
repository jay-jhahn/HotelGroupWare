package com.hotel.hms.persistence;

import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;

import com.hotel.hms.vo.EmployeeVO;

@Repository
public class LoginDAOImpl implements LoginDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Autowired
    private JavaMailSender mailSender; 
	
	// 안재효 ///////////////////////////////////////////////////////////////////////////////////////////
	@Override
	public int confirmId(String id) {
		int selectCnt = sqlSession.selectOne("com.hotel.hms.persistence.EmployeeDAO.confirmId", id);
		if(selectCnt != 1) {
			selectCnt = 0;
		}
		return selectCnt;
	}

	@Override
	public int insertMember(EmployeeVO vo) {
		int insertCnt = sqlSession.insert("com.hotel.hms.persistence.EmployeeDAO.insertMember", vo);
		return insertCnt;
	}

	// 이메일 인증
	@Override
	public void sendMail(String toEmail, String key) {
		try{
            MimeMessage message = mailSender.createMimeMessage();
            String txt = "회원가입 인증 메일입니다. 링크를 눌러 회원가입을 완료하세요." 
			+ "<a href='http://localhost/hms/emailChk.al?key=" + key + "'>Please click</a>";
            
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
	public int updateGrade(String key) {
		int updateCnt = sqlSession.update("com.hotel.hms.persistence.EmployeeDAO.updateGrade", key);
		return updateCnt;
	}
	
	@Override
	public int gradeCheck(String strId) {
		String grade = sqlSession.selectOne("com.hotel.hms.persistence.EmployeeDAO.gradeCheck", strId);
		int gradeCnt = 0;
		
		if(grade.equals("ROLE_USER")) {
			gradeCnt = 1;
		}else {
			gradeCnt = 0;
		}
		return gradeCnt;
	}

	@Override
	public int idCheck(String strId) {
		int selectCnt = sqlSession.selectOne("com.hotel.hms.persistence.EmployeeDAO.idCheck", strId);
		return selectCnt;
	}

	@Override
	public String pwdCheck(String strId) {
		String pwd = sqlSession.selectOne("com.hotel.hms.persistence.EmployeeDAO.pwdCheck", strId);
		return pwd;
	}

	@Override
	public EmployeeVO getLoginEmpl(String empCode) {
		EmployeeVO empVo = sqlSession.selectOne("com.hotel.hms.persistence.EmployeeDAO.getLoginEmpl", empCode);
		return empVo;
	}
}
