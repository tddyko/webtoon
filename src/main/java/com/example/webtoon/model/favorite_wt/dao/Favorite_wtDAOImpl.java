package com.example.webtoon.model.favorite_wt.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.webtoon.model.favorite_wt.dto.Favorite_wtDTO;

@Repository
public class Favorite_wtDAOImpl implements Favorite_wtDAO{

	@Inject
	SqlSession sqlsession;
	
	@Override
	public int favoriteCheck(String title, int idx) {
		int check=0;
		Map<String,Object> map = new HashMap<>();
		map.put("title", title);
		map.put("idx", idx);
		try {
			check = sqlsession.selectOne("favorite_wtCheck", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}

	@Override
	public void favoriteInsert(String title, int idx) {
		Map<String,Object> map = new HashMap<>();
		map.put("title", title);
		map.put("idx", idx);
		try {
			sqlsession.insert("favorite_wtPlus",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Favorite_wtDTO> favorite_wtList(int idx) {
		List<Favorite_wtDTO> dto = null;
				try {
					dto = sqlsession.selectList("favorite_wtList",idx);
				} catch (Exception e) {
					e.printStackTrace();
				}
		
		return dto;
	}

	@Override
	public void favoriteDelete(int idx) {
		try {
			sqlsession.delete("favoriteDelete",idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
