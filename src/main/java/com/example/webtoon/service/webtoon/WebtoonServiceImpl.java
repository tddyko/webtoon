package com.example.webtoon.service.webtoon;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.webtoon.model.webtoon.dao.WebtoonDAO;
import com.example.webtoon.model.webtoon.dto.WebtoonDTO;
@Service
public class WebtoonServiceImpl implements WebtoonService {
	
	@Inject
	WebtoonDAO webtoonDao;
	@Override
	public List<WebtoonDTO>  weeklyList(String week) {
		Map<String, String> map = new HashMap<>();
		map.put("week", week);
		return webtoonDao.weeklyList(map);
	}
	
	
	@Override
	public WebtoonDTO webtoonUpdate(int idx) {
		
		return webtoonDao.webtoonUpdate(idx);
	}


	@Override
	public void webtoonUpdateConfrim(WebtoonDTO dto) {

		webtoonDao.webtoonUpdateConfirm(dto);
	}


	@Override
	public void webtoonDelete(int idx) {
		webtoonDao.webtoonDelete(idx);
	}


	@Override
	public void webtoonInsert(WebtoonDTO dto) {
		webtoonDao.webtoonInsert(dto);
	}


	// 완결페이지
	@Override
	public List<WebtoonDTO> wt_finishList(String finish) {
		return webtoonDao.wt_finishList(finish);
	}

	// 신작페이지
	@Override
	public List<WebtoonDTO> wt_newList() {
		return webtoonDao.wt_newList();
	}

	// 탑 리스트 
		@Override
		public List<WebtoonDTO> wt_topList() {
			return webtoonDao.wt_topList();
		}
	
	
	// 메인페이지 평점 순
	@Override
	public List<WebtoonDTO> wt_heartList() {
		return webtoonDao.wt_heartList();
	}

	// 메인페이지 장르별 랭킹
	@Override
	public List<WebtoonDTO> wt_category(String category) {

		return webtoonDao.wt_category(category);
	}


	@Override
	public WebtoonDTO webtoonInfo(String title) {
		return webtoonDao.webtoonInfo(title);
	}


	@Override
	public List<WebtoonDTO> webtoonSerch(String serch) {
		return webtoonDao.webtoonSerch(serch);
	}


	@Override
	public List<WebtoonDTO> ad_weeklyList(String week) {
		return webtoonDao.ad_weeklyList(week);
	}




}
