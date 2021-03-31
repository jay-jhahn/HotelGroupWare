package com.hotel.hms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.hms.persistence.CommuteDAO;

@Service
public class CommuteServiceImpl implements CommuteService {
	
	@Autowired
	CommuteDAO dao;

}
