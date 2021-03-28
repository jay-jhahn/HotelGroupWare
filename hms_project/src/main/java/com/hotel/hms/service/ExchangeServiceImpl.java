package com.hotel.hms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.hms.persistence.ExchangeDAO;

@Service
public class ExchangeServiceImpl implements ExchangeService {
	
	@Autowired
	ExchangeDAO dao;

}
