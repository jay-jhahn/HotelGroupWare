package com.hotel.hms.persistence;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hotel.hms.vo.EmployeeVO;
import com.hotel.hms.vo.PayVO;

@Repository
public class PayDAOImpl implements PayDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public EmployeeVO selectSabun(String empCode) {
		return sqlSession.selectOne("com.hotel.hms.persistence.PayDAO.selectSabun", empCode);
	}
	@Override
	public int selectBonus(String empCode) {
		return sqlSession.selectOne("com.hotel.hms.persistence.PayDAO.selectBonus", empCode);
	}
	
	@Override
	public int selectPmtDate(Map<String,Object> map) {
		return sqlSession.selectOne("com.hotel.hms.persistence.PayDAO.selectPmtDate", map);
	}
	
	@Override
	public void insertPay(Map<String,Object> map) {
		sqlSession.insert("com.hotel.hms.persistence.PayDAO.insertPay", map);
	}

	@Override
	public void updatePay(Map<String, Object> map) {
		sqlSession.update("com.hotel.hms.persistence.PayDAO.updatePay", map);
	}
	
	@Override
	public List<PayVO> selectPayEmp(Timestamp pmtDate) {
		return sqlSession.selectList("com.hotel.hms.persistence.PayDAO.selectPayEmp", pmtDate);
	}
	
	@Override
	public PayVO payMgtDetail(Map<String, Object> map) {
		return sqlSession.selectOne("com.hotel.hms.persistence.PayDAO.payMgtDetail", map);
	}
}
