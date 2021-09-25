package com.example.webtoon.service.webtoon_Episode;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.webtoon.model.webtoon_Episode.dao.Webtoon_EpisodeDAO;
import com.example.webtoon.model.webtoon_Episode.dto.Webtoon_EpisodeDTO;

@Service
public class Webtoon_EpisodeServiceImpl implements Webtoon_EpisodeService {

	@Inject
	Webtoon_EpisodeDAO webtoon_EpisodeDao;
	
	@Override
	public List<Webtoon_EpisodeDTO> seriesList(String title) {
		return webtoon_EpisodeDao.seriesList(title);
	}

	@Override
	public List<Webtoon_EpisodeDTO> wtEpisodelist(String title) {
		return webtoon_EpisodeDao.wtEpisodelist(title);
	}

	@Override
	public void wtEpisodeInsert(Webtoon_EpisodeDTO dto) {
		webtoon_EpisodeDao.wtEpisodeInsert(dto);
	}

	@Override
	public Webtoon_EpisodeDTO wtEpisodeUpdate(int idx) {
		return webtoon_EpisodeDao.wtEpisodoUpdate(idx);
	}

	@Override
	public void wtEpisodeUpdateDo(Webtoon_EpisodeDTO dto) {
		webtoon_EpisodeDao.wtEpisodeUpdateDo(dto);
	}

	@Override
	public void webtoonDelete(int idx) {
		webtoon_EpisodeDao.wtEpisodeDelete(idx);
	}

	@Override
	public void wtEpisodeHitUp(String title, int no) {
		Map<String, Object> map = new HashMap<>();
		map.put("title", title);
		map.put("no", no);
		webtoon_EpisodeDao.wtEpisodeHitUp(map);
		
	}

	@Override
	public int wtEpisodeCount(String title, int no) {
		Map<String, Object> map = new HashMap<>();
		map.put("title", title);
		map.put("no", no);
		return webtoon_EpisodeDao.wtEpisodeCount(map);
	}

	@Override
	public boolean freeCheck(String title,int no) {
		boolean result = false;
		Map<String, Object> map = new HashMap<>();
		map.put("title", title);
		map.put("no", no);
		String cost ="";
		try {
			cost= webtoon_EpisodeDao.freeCheck(map);
		} catch (Exception e) {
		 e.printStackTrace();
		}
	
		if(!cost.equals("")&&cost!=null){
			result = cost.equals("무료")?true:false;
		}
		
		
		return result;
	}

	@Override
	public int wt_coin(String title, int no) {
		Map<String, Object> map = new HashMap<>();
		map.put("title", title);
		map.put("no", no);
		return webtoon_EpisodeDao.wt_coin(map);
	}

}
