package com.hotel.hms.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hotel.hms.vo.WelfareVO;

@Repository
public class WelfareDAOImpl implements WelfareDAO {

	@Autowired
	SqlSession sqlSession;
	
	// 마이쿠폰 목록 조회 - 박상원
	@Override
	public List<WelfareVO> myCuponList(String empCode) {
		return sqlSession.selectList("com.hotel.hms.persistence.WelfareDAO.myCuponList",empCode);
	}

	// 복지쿠폰 목록 개수 - 박상원
	@Override
	public int welfareCuponCount() {
		return sqlSession.selectOne("com.hotel.hms.persistence.WelfareDAO.welfareCuponCount");
	}
	// 복지쿠폰 목록 조회 - 박상원
	@Override
	public List<WelfareVO> welfareCuponList(Map<String, Object> map) {
		return sqlSession.selectList("com.hotel.hms.persistence.WelfareDAO.welfareCuponList", map);
	}

	// 복지쿠폰 입력 - 박상원
	@Override
	public void welfareCuponInsert(Map<String, Object> map) {
		sqlSession.selectList("com.hotel.hms.persistence.WelfareDAO.welfareCuponInsert", map);
	}
}
