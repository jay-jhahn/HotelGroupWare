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
		
		// 연별 결산 리스트
		@Override
		public List<AccountVO> accountByYear() {
			return sqlSession.selectList("com.hotel.hms.persistence.AccountDAO.accountByYear");
		}

		// 월별 결산 리스트
		@Override
		public List<AccountVO> accountByMonth() {
			return sqlSession.selectList("com.hotel.hms.persistence.AccountDAO.accountByMonth");
		}

		@Override
		public List<AccountVO> accountByDay() {
			return sqlSession.selectList("com.hotel.hms.persistence.AccountDAO.accountByDay");
		}

		
}
