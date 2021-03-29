package com.hotel.hms.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hotel.hms.vo.EmployeeVO;
import com.hotel.hms.vo.HolidayVO;
import com.hotel.hms.vo.WorkVO;

@Repository
public class ScheduleDAOImpl implements ScheduleDAO {

	@Autowired
	SqlSession sqlSession;
	
	// workData 가져오기  - 이철한
	@Override
	public List<WorkVO> getWork(Map <String, Object> map) {
		
		return sqlSession.selectList("com.hotel.hms.persistence.ShareDAO.getWork", map);
	}
	
	// 근무정보 db에 넣기 - 이철한
	@Override
	public int insertSchedule( Map < String , Object > map ) {
		
		return sqlSession.insert("com.hotel.hms.persistence.ShareDAO.insertSchedule", map);
	}

	// 직원 정보 가져오는 메서드 - 이철한
	@Override
	public EmployeeVO getInfoEmp(String empCode) {
		
		return sqlSession.selectOne("com.hotel.hms.persistence.ShareDAO.getInfoEmp", empCode);
	}

	// 직원 휴무신청 DB에 넣기  - 이철한
	@Override
	public int insertDayOff(Map<String, Object> map) {
		
		return sqlSession.insert("com.hotel.hms.persistence.ShareDAO.insertDayOff", map);
	}

	// 직원이 휴무신청한 내역 가져오기 - 이철한
	@Override
	public List<HolidayVO> getLogDayOff(String empCode) {
		
		return sqlSession.selectList("com.hotel.hms.persistence.ShareDAO.getLogDayOff" , empCode);
		
	}

	// 선택 직원이 해당월이 테이블에 데이터가 있는지 확인하는 메서드  - 이철한
	@Override
	public int checkWorkData(Map<String, Object> map) {
		
		return sqlSession.selectOne("com.hotel.hms.persistence.ShareDAO.checkWorkData", map);
	}
	
	
	
	
	
	
}
