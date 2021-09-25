package com.example.webtoon.service.mylist;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.webtoon.model.mylist.dao.MyListDAO;
import com.example.webtoon.model.mylist.dto.MyListDTO;
import com.example.webtoon.service.member.MemberService;

@Service
public class MyListServiceImpl implements MyListService {

	@Inject
	MyListDAO dao;
	@Inject
	MemberService memberService;
	
	@Override
	public boolean Check(int m_idx, String title, int no) {
		boolean result = false;
		Map<String, Object> map = new HashMap<>();
		map.put("m_idx", m_idx);
		map.put("title", title);
		map.put("no", no);
		result = dao.Check(map)>0?true:false;
		//구매내역 있으면 트루 없으면 폴스
		
		return result;
	}

	@Override
	public void buyWebtoon(int m_idx, String title, int no, int coin) {
		Map<String, Object> map = new HashMap<>();
		map.put("m_idx", m_idx);
		map.put("title", title);
		map.put("no", no);
		map.put("coin", coin);
		dao.buyWebtoon(map);
		memberService.coinDown(m_idx, coin);
	}

	@Override
	public List<MyListDTO> myList(int idx) {
		return dao.myList(idx);
	}

	
	
}
