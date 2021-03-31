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
}
