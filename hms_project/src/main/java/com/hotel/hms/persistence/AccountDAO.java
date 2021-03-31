package com.hotel.hms.persistence;

import java.util.List;

import com.hotel.hms.vo.AccountVO;


public interface AccountDAO {
	
	// 결산 리스트
	public List<AccountVO> accountList();
}
