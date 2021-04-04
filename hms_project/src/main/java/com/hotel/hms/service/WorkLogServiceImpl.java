package com.hotel.hms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.hms.persistence.WorkLogDAO;

@Service
public class WorkLogServiceImpl implements WorkLogService {
	
	@Autowired
	WorkLogDAO dao;

}
