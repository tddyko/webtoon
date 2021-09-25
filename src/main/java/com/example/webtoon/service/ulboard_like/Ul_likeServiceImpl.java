package com.example.webtoon.service.ulboard_like;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.webtoon.model.ulboard.dao.UlboardDAO;
import com.example.webtoon.model.ulboard_like.dao.Ul_likeDAO;

@Service
public class Ul_likeServiceImpl implements Ul_likeService {

	@Inject
	Ul_likeDAO dao;
	@Inject
	UlboardDAO uldao;
	@Override
	public void ul_likeInsert(int m_idx, int u_idx) {
			Map<String, Object> map = new HashMap<>();
			map.put("m_idx", m_idx);
			map.put("u_idx", u_idx);
			dao.ul_likeInsert(map);
	
		
	}

	@Override
	public boolean ul_likeCheck(int m_idx, int u_idx) {
		Map<String, Object> map = new HashMap<>();
		map.put("m_idx", m_idx);
		map.put("u_idx", u_idx);
		return dao.ul_likeheck(map);
	}

	@Override
	public int ul_likeUpdown(int m_idx, int u_idx) {
		int result= 0;
		int idx = u_idx;
		Map<String, Object> map = new HashMap<>();
		map.put("m_idx", m_idx);
		map.put("u_idx", u_idx);
		if (ul_likeCheck(m_idx, u_idx)) {
			dao.ul_likeDelete(map);
			result=2;
			
			uldao.ulheartDown(idx);
		}else {
			dao.ul_likeInsert(map);
			result=1;
			uldao.ulheartUp(idx);
		}
		
		
		return result;
	}

	@Override
	public void ul_likeDelete(int m_idx, int u_idx) {
		Map<String, Object> map = new HashMap<>();
		map.put("m_idx", m_idx);
		map.put("u_idx", u_idx);
		dao.ul_likeDelete(map);
		
	}

	@Override
	public int count(int u_idx) {
	
		return dao.count(u_idx);
	}

	@Override
	public void ul_likeDeleteAll(int u_idx) {
		dao.ul_likeDeleteAll(u_idx);
		
	}
	
	
}
