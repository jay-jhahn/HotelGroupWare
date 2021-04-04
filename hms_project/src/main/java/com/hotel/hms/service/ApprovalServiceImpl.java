package com.hotel.hms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.hms.persistence.ApprovalDAO;

@Service
public class ApprovalServiceImpl implements ApprovalService {

	@Autowired
	ApprovalDAO dao;
}
