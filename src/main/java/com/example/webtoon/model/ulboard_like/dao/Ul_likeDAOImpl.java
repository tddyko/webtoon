package com.example.webtoon.model.ulboard_like.dao;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class Ul_likeDAOImpl implements Ul_likeDAO {

	@Inject SqlSession sqlsession;

	@Override
	public void ul_likeInsert(Map<String, Object> map) {
		try {
			sqlsession.insert("ul_likeInsert", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void ul_likeDelete(Map<String, Object> map) {
		try {
			sqlsession.delete("ul_likeDelete",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean ul_likeheck(Map<String, Object> map) {
		boolean result = false;
		int count= 0;
		try {
			count = sqlsession.selectOne("ul_likeCheck", map);
			result = count>0?true:false;
			// 있으면 트루 없으면 폴스
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int count(int u_idx) {
		int result= 0;
		try {
			result=sqlsession.selectOne("ul_likeCount", u_idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void ul_likeDeleteAll(int idx) {
		try {
			sqlsession.delete("ul_likeDeleteAll", idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
