package com.hotel.hms.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.hotel.hms.persistence.LoginDAO;
import com.hotel.hms.vo.EmployeeVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	LoginDAO loginDao;

	@Override
	public void boardList(HttpServletRequest req, Model model) {
		// 리액트로 부서명 가져가기
		String empCode = (String)req.getSession().getAttribute("empCode");
		
		EmployeeVO vo = loginDao.getLoginEmpl(empCode);
		
		String deptName = vo.getDeptName();
		String deptCode = vo.getDeptCode();
		System.out.println(deptCode);
		model.addAttribute("deptName", deptName);
		model.addAttribute("deptCode", deptCode);
		model.addAttribute("empCode", empCode);
		
		int cnt = 7;
		model.addAttribute("cnt", cnt);
		
		
	}
}
