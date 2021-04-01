package com.hotel.hms.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hotel.hms.vo.AccountVO;

@Repository
public class AccountDAOImpl implements AccountDAO {

	@Autowired
	SqlSession sqlSession;

	// 결산 리스트
	@Override
	public List<AccountVO> accountList() {
		return sqlSession.selectList("com.hotel.hms.persistence.AccountDAO.accountList");
	}
	
}
