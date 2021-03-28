package com.hotel.hms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hotel.hms.persistence.HRDAO;

@Service
public class HRServiceImpl implements HRService {
	
	@Autowired
	HRDAO dao;

	@Override
	public void registerEmpAction(MultipartHttpServletRequest multi, Model model) {
		
	}
}
