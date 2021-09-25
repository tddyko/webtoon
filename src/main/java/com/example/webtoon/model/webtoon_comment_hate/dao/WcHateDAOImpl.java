package com.example.webtoon.model.webtoon_comment_hate.dao;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class WcHateDAOImpl implements WcHateDAO {

	@Inject
	SqlSession sqlsession;
	
	@Override
	public void wchInsert(Map<String, Object> map) {
		try {
			sqlsession.insert("wchInsert", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public boolean wchCheck(Map<String, Object> map) {
		boolean result = false;
		int count= 0;
		try {
			count = sqlsession.selectOne("wchCheck", map);
			result = count>0?true:false;
			// 있으면 트루 없으면 폴스
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void wchDelete(Map<String, Object> map) {
		try {
			sqlsession.delete("wchDelete",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public int count(int c_idx) {
		int result= 0;
		try {
			result=sqlsession.selectOne("wchCount", c_idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void wchDeleteAll(int idx) {
	try {
		sqlsession.delete("wchDeleteAll", idx);
	} catch (Exception e) {
		e.printStackTrace();
	}
		
	}

}
