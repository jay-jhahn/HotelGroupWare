package com.hotel.hms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.hms.persistence.PayDAO;

@Service
public class PayServiceImpl implements PayService {
	
	@Autowired
	PayDAO dao;

}
