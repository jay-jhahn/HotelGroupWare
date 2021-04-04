package com.hotel.hms.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.hotel.hms.persistence.AccountDAO;
import com.hotel.hms.vo.AccountVO;

@Service
public class AccountServiceImpl implements AccountService {

	@Autowired
	AccountDAO dao;

	// 결산 리스트
	@Override
	public void accountList(HttpServletRequest req, Model model) {
				
		List<AccountVO> list = dao.accountList();
		model.addAttribute("list", list);
		
	}
	
	// 연별 결산 목록
	@Override
	public void accountByYMD(HttpServletRequest req, Model model) {		
		List<AccountVO> list1 = dao.accountByYear();
		List<AccountVO> list2 = dao.accountByMonth();
		List<AccountVO> list3 = dao.accountByDay();
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);		
	}


}
