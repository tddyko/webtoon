package com.example.webtoon.model.admin.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	SqlSession sqlsession;

	@Override
	public int loginCheck(String adminID, String adminPW) {
		int check = 0;
		Map<String, String> map = new HashMap<>();
		map.put("adminID", adminID);
		map.put("adminPW", adminPW);
		check = sqlsession.selectOne("adminInfo", map);
		return check;
	}

}
