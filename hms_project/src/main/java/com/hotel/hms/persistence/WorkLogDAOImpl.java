package com.hotel.hms.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WorkLogDAOImpl implements WorkLogDAO {

	@Autowired
	SqlSession sqlSession;
}
