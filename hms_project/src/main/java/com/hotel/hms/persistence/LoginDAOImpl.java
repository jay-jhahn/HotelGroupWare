package com.hotel.hms.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hotel.hms.vo.EmployeeVO;

@Repository
public class LoginDAOImpl implements LoginDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public EmployeeVO getLoginEmpl(String empCode) {
		EmployeeVO empVo = sqlSession.selectOne("com.hotel.hms.persistence.EmployeeDAO.getLoginEmpl", empCode);
		return empVo;
	}
}
