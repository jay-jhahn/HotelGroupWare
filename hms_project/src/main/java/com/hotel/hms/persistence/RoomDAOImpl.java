package com.hotel.hms.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hotel.hms.vo.GuestVO;
import com.hotel.hms.vo.RoomUseVO;
import com.hotel.hms.vo.RoomVO;
import com.hotel.hms.vo.currentlInUseVO;

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
	public int roomUpdate(String roomNum) {
		// 객실 업데이트
		int updateCnt = sqlSession.update("com.hotel.hms.persistence.RoomDAO.roomUpdate", roomNum);
		return updateCnt;
	}

	@Override
	public int guestInsert(GuestVO guest) {
		// 체크인 고객 인서트
		int insertCnt = sqlSession.insert("com.hotel.hms.persistence.RoomDAO.guestInsert", guest);
		return insertCnt;
	}

	@Override
	public int selectGuestCode(GuestVO vo) {
		// 체크인 고객에서 pk가져오기
		int guestCode = sqlSession.selectOne("com.hotel.hms.persistence.RoomDAO.selectGuestCode", vo);
		return guestCode;
	}

	@Override
	public int roomUseInsert(RoomUseVO roomUse) {
		// 이용내역 테이블 인서트
		int insertCnt = sqlSession.insert("com.hotel.hms.persistence.RoomDAO.roomUseInsert", roomUse);
		return insertCnt;
	}

	@Override
	public int checkInRoomStateChange(String roomNum) {
		// 체크인, 수리중, 청소중에서 빈방으로
		int updateCnt = sqlSession.update("com.hotel.hms.persistence.RoomDAO.checkInRoomStateChange", roomNum);
		return updateCnt;
	}

	@Override
	public currentlInUseVO roomUseInformationGet(String roomNum) {
		// 이용내역테이블 접근 후 정보 가져오기
		currentlInUseVO roomUse = sqlSession.selectOne("com.hotel.hms.persistence.RoomDAO.roomUseInformationGet", roomNum);
		return roomUse;
	}

	@Override
	public GuestVO guestInformationGet(int guestCode) {
		GuestVO guest = sqlSession.selectOne("com.hotel.hms.persistence.RoomDAO.guestInformationGet", guestCode);
		return guest;
	}

	@Override
	public String empNameGet(String empCode) {
		// 고객 이름 가져오기
		String empName = sqlSession.selectOne("com.hotel.hms.persistence.RoomDAO.empNameGet", empCode);
		return empName;
	}

	@Override
	public int currentlInUseInsert(currentlInUseVO currentlInUse) {
		int insertCnt = sqlSession.insert("com.hotel.hms.persistence.RoomDAO.currentlInUseInsert", currentlInUse);
		return insertCnt;
	}

	@Override
	public int deletecurrentlInUse(String roomNum) {
		int deleteCnt = sqlSession.delete("com.hotel.hms.persistence.RoomDAO.deletecurrentlInUse", roomNum);
		return deleteCnt;
	}

	@Override
	public int guestCount(String guestPhone) {
		// 게스트가 있나없나 체크
		int count = sqlSession.selectOne("com.hotel.hms.persistence.RoomDAO.guestCount", guestPhone);
		return count;
	}

	@Override
	public GuestVO geustGet(String guestPhone) {
		// 게스트정보 가져오기
		GuestVO vo = sqlSession.selectOne("com.hotel.hms.persistence.RoomDAO.geustGet", guestPhone);
		return vo;
	}

	@Override
	public int guestPriceUpdate(GuestVO guest) {
		// 고객 이용 금액 업데이트
		int updateCnt = sqlSession.update("com.hotel.hms.persistence.RoomDAO.guestPriceUpdate", guest);
		return updateCnt;
	}

	@Override
	public int guestLevelUpdate(int guestCode) {
		// 고객 등급 다이아로 업데이트
		int updateCnt = sqlSession.update("com.hotel.hms.persistence.RoomDAO.guestLevelUpdate", guestCode);
		return updateCnt;
	}

	@Override
	public int guestLevelUpdateLast(int guestCode) {
		// 고객 등급 플래티넘으로 업데이트
		int updateCnt = sqlSession.update("com.hotel.hms.persistence.RoomDAO.guestLevelUpdateLast", guestCode);
		return updateCnt;
	}
}
