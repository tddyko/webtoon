package com.example.webtoon.model.webtoon_star.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class Webtoon_StarDAOImpl implements Webtoon_StarDAO{
	@Inject
	SqlSession sqlsession;
	@Override
	public int wt_starCheck(String title, int no, int idx) {
		int check=0;
		Map<String,Object> map = new  HashMap<>();
		map.put("title",title);
		map.put("no", no);
		map.put("idx", idx);
		try {
			check=sqlsession.selectOne("wt_starCheck", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}
	@Override
	public void wt_starInsert(String title, int no, int idx, int star) {
		Map<String,Object> map = new  HashMap<>();
		map.put("title",title);
		map.put("no", no);
		map.put("idx", idx);
		map.put("star", star);
		try {
			sqlsession.insert("wt_starInsert",map);	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Override
	public void wt_starSetting(String title, int no) {
		Map<String,Object> map = new  HashMap<>();
		map.put("title",title);
		map.put("no", no);
		try {
			sqlsession.update("wt_starSetting",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Override
	public void wt_starSetting(String title) {
		try {
			sqlsession.update("wt_starAllSetting",title);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
