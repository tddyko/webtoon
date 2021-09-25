package com.example.webtoon.service.webtoon_comment_hate;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.webtoon.model.webtoon_comment.dao.Webtoon_commentDAO;
import com.example.webtoon.model.webtoon_comment_hate.dao.WcHateDAO;

@Service
public class WcHateServiceImpl implements WcHateService {

	@Inject
	WcHateDAO dao;
	@Inject
	Webtoon_commentDAO c_dao;
	
	@Override
	public void wchInsert(int m_idx, int c_idx) {
			Map<String, Object> map = new HashMap<>();
			map.put("m_idx", m_idx);
			map.put("c_idx", c_idx);
			dao.wchInsert(map);
	
		
	}

	@Override
	public boolean wchCheck(int m_idx, int c_idx) {
		Map<String, Object> map = new HashMap<>();
		map.put("m_idx", m_idx);
		map.put("c_idx", c_idx);
		return dao.wchCheck(map);
	}

	@Override
	public int wchUpdown(int m_idx, int c_idx) {
		int result= 0;
		Map<String, Object> map = new HashMap<>();
		map.put("m_idx", m_idx);
		map.put("c_idx", c_idx);
		if (wchCheck(m_idx, c_idx)) {
			dao.wchDelete(map);
			result=2;
			c_dao.wcHateDown(map);
		}else {
			dao.wchInsert(map);
			result=1;
			c_dao.wcHateUp(map);
		}
		
		
		return result;
	}

	@Override
	public void wchDelete(int m_idx, int c_idx) {
		Map<String, Object> map = new HashMap<>();
		map.put("m_idx", m_idx);
		map.put("c_idx", c_idx);
		dao.wchDelete(map);
		
	}

	@Override
	public int count(int c_idx) {
	
		return dao.count(c_idx);
	}

	@Override
	public void wchDeleteAll(int idx) {
		dao.wchDeleteAll(idx);
		
	}
	
}
