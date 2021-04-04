package com.hotel.hms.persistence;

import java.util.List;

import com.hotel.hms.vo.AccountVO;


public interface AccountDAO {
	
	// 결산 리스트
	public List<AccountVO> accountList();		// 수익
	public List<AccountVO> accountByYear();		// 연별 결산
	public List<AccountVO> accountByMonth();	// 월별 결산
	public List<AccountVO> accountByDay();		// 일별 결산
	
}
