package com.example.webtoon.service.webtoon_comment_like;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.webtoon.model.webtoon_comment.dao.Webtoon_commentDAO;
import com.example.webtoon.model.webtoon_comment_like.dao.WcLikeDAO;

@Service
public class WcLikeServiceImpl implements WcLikeService {

	@Inject
	WcLikeDAO dao;
	@Inject
	Webtoon_commentDAO c_dao;
	@Override
	public void wclInsert(int m_idx, int c_idx) {
			Map<String, Object> map = new HashMap<>();
			map.put("m_idx", m_idx);
			map.put("c_idx", c_idx);
			dao.wclInsert(map);
	
		
	}

	@Override
	public boolean wclCheck(int m_idx, int c_idx) {
		Map<String, Object> map = new HashMap<>();
		map.put("m_idx", m_idx);
		map.put("c_idx", c_idx);
		return dao.wclCheck(map);
	}

	@Override
	public int wclUpdown(int m_idx, int c_idx) {
		int result= 0;
		Map<String, Object> map = new HashMap<>();
		map.put("m_idx", m_idx);
		map.put("c_idx", c_idx);
		if (wclCheck(m_idx, c_idx)) {
			dao.wclDelete(map);
			result=2;
			c_dao.wcHeartDown(map);
		}else {
			dao.wclInsert(map);
			result=1;
			c_dao.wcHeartUp(map);
		}
		
		
		return result;
	}

	@Override
	public void wclDelete(int m_idx, int c_idx) {
		Map<String, Object> map = new HashMap<>();
		map.put("m_idx", m_idx);
		map.put("c_idx", c_idx);
		dao.wclDelete(map);
		
	}

	@Override
	public int count(int c_idx) {
	
		return dao.count(c_idx);
	}

	@Override
	public void wclDeleteAll(int idx) {
		dao.wclDeleteAll(idx);
		
	}

}
