package com.hotel.hms.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class UserLoginFailureHandler implements AuthenticationFailureHandler{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	public UserLoginFailureHandler(SqlSessionTemplate sqlSession, BCryptPasswordEncoder passwordEncoder ) {
		this.sqlSession = sqlSession;
		this.passwordEncoder = passwordEncoder;
	}
	
	// 로그인이 실패할 경우 자동으로 실행되는 코드 
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
	
		System.out.println("실패 ");
		String empCode =  request.getParameter("empCode");
		String empPwd = request.getParameter("empPwd");
		
		int cnt = sqlSession.selectOne("com.hotel.hms.persistence.EmployeeDAO.idCheck", empCode);
		
		if(cnt!=0) {
			String pwd = sqlSession.selectOne("com.hotel.hms.persistence.EmployeeDAO.pwdCheck", empCode);
			System.out.println(empPwd);
			System.out.println(pwd);
			System.out.println(passwordEncoder.matches(empPwd, pwd));
			if(passwordEncoder.matches(empPwd, pwd)) {
				request.setAttribute("errMsg", "이메일 인증하세요.");
			}else {
				request.setAttribute("errMsg", "비밀번호가 일치하지 않습니다. 확인 후 다시 시도하세요.");
			}
		}else {
			request.setAttribute("errMsg", "아이디가 존재하지 않습니다. 확인 후 다시 시도하세요.");
		}
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/index.jsp");
		rd.forward(request, response);
	}

}
