package com.example.webtoon.model.webtoon_comment_like.dao;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class WcLikeDAOImpl implements WcLikeDAO {

	@Inject
	SqlSession sqlsession;
	
	@Override
	public void wclInsert(Map<String, Object> map) {
		try {
			sqlsession.insert("wclInsert", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public boolean wclCheck(Map<String, Object> map) {
		boolean result = false;
		int count= 0;
		try {
			count = sqlsession.selectOne("wclCheck", map);
			result = count>0?true:false;
			// 있으면 트루 없으면 폴스
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void wclDelete(Map<String, Object> map) {
		try {
			sqlsession.delete("wclDelete",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public int count(int c_idx) {
		int result= 0;
		try {
			result=sqlsession.selectOne("wclCount", c_idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void wclDeleteAll(int idx) {
		try {
			sqlsession.delete("wclDeleteAll", idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
