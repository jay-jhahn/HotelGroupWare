package com.hotel.hms.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hotel.hms.vo.RoomVO;

@Repository
public class RoomDAOImpl implements RoomDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<RoomVO> roomList() {
		// 객실 리스트 가져오기
		List<RoomVO> list = sqlSession.selectList("com.hotel.hms.persistence.RoomDAO.roomList");
		return list;
	}

	@Override
	public int repair(String roomNum) {
		// 수리중으로 상태변경
		int updateCnt = sqlSession.update("com.hotel.hms.persistence.RoomDAO.repair", roomNum);
		return updateCnt;
	}

	@Override
	public int cleaning(String roomNum) {
		// 청소중으로 상태변경
		int updateCnt = sqlSession.update("com.hotel.hms.persistence.RoomDAO.cleaning", roomNum);
		return updateCnt;
	}

	@Override
	public int checkInInsert(String roomNum) {
		// TODO Auto-generated method stub
		return 0;
	}
}
