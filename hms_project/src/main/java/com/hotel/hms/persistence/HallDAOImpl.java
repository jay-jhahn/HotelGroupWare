package com.hotel.hms.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hotel.hms.vo.HallVO;
import com.hotel.hms.vo.ResVO;

@Repository
public class HallDAOImpl implements HallDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public int uptime(String timecheck) {
		HallDAO dao = sqlSession.getMapper(HallDAO.class);
		return dao.uptime(timecheck);
	}
	
	// 홀리스트 가져오기
	@Override
	public List<HallVO> hallList() {
		HallDAO dao = sqlSession.getMapper(HallDAO.class);
		return dao.hallList();
	}

	// 예약 수정
	@Override
	public int hallin(Map<String, Object> map) {
		System.out.println("========DAO======");
		HallDAO dao = sqlSession.getMapper(HallDAO.class);
		return dao.hallin(map);
	}

	// 
	@Override
	public int update(Map<String, Object> map) {
		HallDAO dao = sqlSession.getMapper(HallDAO.class);
		return dao.update(map);
	}

	@Override
	public List<ResVO> resList() {
		HallDAO dao = sqlSession.getMapper(HallDAO.class);
		return dao.resList();
	}

	// 연회장 예약 에서 게스트 데이터 를 게스트 테이블에 입력
	@Override
	public int guestInsert(Map<String, Object> map) {
		HallDAO dao = sqlSession.getMapper(HallDAO.class);
		return dao.guestInsert(map);
	}

	// 연회장 예약 에서 연회장 데이터 를 홀 테이블에 입력 
	@Override
	public int hallInsert(Map<String, Object> map) {
		HallDAO dao = sqlSession.getMapper(HallDAO.class);
		return dao.hallin(map);
	}


}
