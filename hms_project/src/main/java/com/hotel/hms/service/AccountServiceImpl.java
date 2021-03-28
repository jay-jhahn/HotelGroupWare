package com.hotel.hms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.hms.persistence.AccountDAO;

@Service
public class AccountServiceImpl implements AccountService {

	@Autowired
	AccountDAO dao;
}
