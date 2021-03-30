package com.hotel.hms.service;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface HRService {

	// 인사정보 등록 처리
	public void registerEmpAction(MultipartHttpServletRequest multi, Model model);
	
	
}
