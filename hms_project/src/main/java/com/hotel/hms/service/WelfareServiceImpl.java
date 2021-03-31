package com.hotel.hms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.hms.persistence.WelfareDAO;

@Service
public class WelfareServiceImpl implements WelfareService {
	
	@Autowired
	WelfareDAO dao;

}
