package com.example.webtoon.service.ulboard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.webtoon.model.ulboard.dao.UlboardDAO;
import com.example.webtoon.model.ulboard.dto.UlboardDTO;
import com.example.webtoon.model.ulboard_like.dao.Ul_likeDAO;

@Service
public class UlboardServiceImpl implements UlboardService {
	
	@Inject
	UlboardDAO dao;
	@Inject
	Ul_likeDAO likedao;

	@Override
	public int count() {
		return dao.count();
	}

	@Override
	public List<UlboardDTO> ulboardList(int start, int end) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start",  start);
		map.put("end", end);
		return dao.ulboardList(map);
	}

	@Override
	public void ulboardInsert(UlboardDTO dto) {
		String content = dto.getContent().replace("<img>", "<img class=\"img-responsive\"");
		dto.setContent(content);
		dao.ulboardInsert(dto);
	}

	@Override
	public UlboardDTO ulboardView(int idx) {
		return dao.ulboardView(idx);
	}

	@Override
	public void hitUp(int idx) {
		dao.hitUp(idx);
	}

	@Override
	public void ulboardDelete(int idx) {
		dao.ulboardDelete(idx);
		likedao.ul_likeDeleteAll(idx);
	}

	@Override
	public void ulboardUpdate(UlboardDTO dto) {
		
		dao.ulboardUpdate(dto);
	}

	@Override
	public String ulimg(int idx) {
		return dao.ulimg(idx);
	}
}