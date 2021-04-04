package com.hotel.hms.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.hotel.hms.persistence.LoginDAO;
import com.hotel.hms.vo.EmployeeVO;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	LoginDAO dao;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Override
	public void getLoginEmpl(HttpServletRequest req, Model model) {
		String empCode = (String)req.getSession().getAttribute("empCode");
		System.out.println("empCode 서비스서비스서비스서비스==>" + empCode);
		EmployeeVO empVo = dao.getLoginEmpl(empCode);
		model.addAttribute("empVo", empVo);		
	}
}
