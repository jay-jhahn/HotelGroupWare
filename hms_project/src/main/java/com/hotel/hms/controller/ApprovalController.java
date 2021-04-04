package com.hotel.hms.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.hotel.hms.service.ApprovalService;

// 전자결재 컨트롤러 - 안재효
@Controller
public class ApprovalController {
	
	private static final Logger logger = LoggerFactory.getLogger(ApprovalController.class);
	
	@Autowired
	ApprovalService service;
	
	
}
