package com.hotel.hms.service;

import java.util.Random;

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

	// 안재효
	// ///////////////////////////////////////////////////////////////////////////////////////////
	@Override
	public void confirmId(HttpServletRequest req, Model model) {
		String strId = req.getParameter("id");
		int selectCnt = dao.confirmId(strId);
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("id", strId);
	}

	@Override
	public void joinAction(HttpServletRequest req, Model model) {
		EmployeeVO vo = new EmployeeVO();

		vo.setEmpCode(req.getParameter("id"));
		String encryptPassword = passwordEncoder.encode(req.getParameter("pwd"));
		vo.setEmpPwd(encryptPassword);
		vo.setEmpName(req.getParameter("name"));

//		String jumin = "";
//		String jumin1 = req.getParameter("jumin1");
//		String jumin2 = req.getParameter("jumin2");
//		if (!jumin1.equals("") && !jumin2.equals("")) {
//			jumin = jumin1 + "-" + jumin2;
//		}
//		vo.setMemJumin(jumin);

//		String phone = "";
//		String phone1 = req.getParameter("phone1");
//		String phone2 = req.getParameter("phone2");
//		String phone3 = req.getParameter("phone3");
//		if (!phone1.equals("") && !phone2.equals("") && !phone3.equals("")) {
//			phone = phone1 + "-" + phone2 + "-" + phone3;
//		}
//		vo.setMemPhone(phone);

		String email = "";
		String email1 = req.getParameter("email1");
		String email2 = req.getParameter("email2");
		if (!email1.equals("") && !email2.equals("")) {
			email = email1 + "@" + email2;
		}
		vo.setEmpEmail(email);

//		vo.setMemAddr(req.getParameter("addr"));
//		vo.setMemDeAddr(req.getParameter("deAddr"));

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

		vo.setEmpKey(key);

		int insertCnt = dao.insertMember(vo);

		if (insertCnt != 0) {
			dao.sendMail(email, key);
		}
		model.addAttribute("insertCnt", insertCnt);
	}

	@Override
	public void emailChk(HttpServletRequest req, Model model) {
		String key = req.getParameter("key");

		int selectCnt = dao.selectKey(key);
		if (selectCnt == 1) {
			int insertCnt = dao.updateGrade(key);
			model.addAttribute("insertCnt", insertCnt);
		}
	}

	@Override
	public void getLoginEmpl(HttpServletRequest req, Model model) {
		String empCode = (String)req.getSession().getAttribute("empCode");
		System.out.println("empCode 서비스서비스서비스서비스==>" + empCode);
		EmployeeVO empVo = dao.getLoginEmpl(empCode);
		model.addAttribute("empVo", empVo);		
	}
}
