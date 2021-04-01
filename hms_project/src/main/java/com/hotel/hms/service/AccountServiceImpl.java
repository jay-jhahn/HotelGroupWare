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
		
		AccountVO vo = new AccountVO();
		//List<AccountVO> list = dao.();
		
		
	}
}
