package com.hotel.hms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.hms.persistence.HallDAO;

@Service
public class HallServiceImpl implements HallService{

	@Autowired
	HallDAO dao;
}
