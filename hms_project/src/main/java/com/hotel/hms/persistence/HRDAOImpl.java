package com.hotel.hms.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hotel.hms.vo.EmployeeVO;
import com.hotel.hms.vo.FamilyVO;

@Repository
public class HRDAOImpl implements HRDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public int insertEmpInfo(EmployeeVO empVo) {
		int insertCnt = sqlSession.insert("com.hotel.hms.persistence.EmployeeDAO.insertEmpInfo", empVo);
		return insertCnt;
	}

	@Override
	public int insertFamMem(FamilyVO famVo) {
		int insertCnt = sqlSession.insert("com.hotel.hms.persistence.EmployeeDAO.insertFamMem", famVo);
		return insertCnt;
	}
}
