package com.hotel.hms.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public interface AccountService {
	
	// 결산 리스트
	public void accountList(HttpServletRequest req, Model model);

}
