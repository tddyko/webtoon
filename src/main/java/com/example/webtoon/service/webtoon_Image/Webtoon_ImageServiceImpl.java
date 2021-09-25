package com.example.webtoon.service.webtoon_Image;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.webtoon.model.webtoon_Episode.dao.Webtoon_EpisodeDAO;
import com.example.webtoon.model.webtoon_image.dao.Webtoon_ImageDAO;
import com.example.webtoon.model.webtoon_image.dto.Webtoon_ImageDTO;

@Service
public class Webtoon_ImageServiceImpl implements Webtoon_ImageService{

	@Inject
	Webtoon_ImageDAO webtoon_ImageDao;
	@Inject
	Webtoon_EpisodeDAO episodeDao;
	
	@Override
	public List<Webtoon_ImageDTO> webtoonList(String title, int no) {
		Map<String, Object> map = new Hashtable<>();
		map.put("title", title);
		map.put("no", no);
		episodeDao.wtEpisodeHitUp(map);
		return webtoon_ImageDao.webtoonList(map);
	}

	@Override
	public void wt_imageInsert(String title, int no, int image) {
		webtoon_ImageDao.webtoonImageInsert(title,no,image);
	}

	@Override
	public Webtoon_ImageDTO wt_imageUpdate(int idx) {
		Webtoon_ImageDTO  dto= webtoon_ImageDao.webtoonImageUpdate(idx);
		return dto;
	}

	@Override
	public List<Integer> wt_imageList(String title, int no) {
		List<Integer> list = webtoon_ImageDao.wt_imageList(title,no);
		return list;
	}

	@Override
	public void wt_imageUpdateDo(Webtoon_ImageDTO dto) {
		webtoon_ImageDao.wt_imageUpdateDo(dto);
	}

	@Override
	public void wt_imageDelete(int idx) {
		webtoon_ImageDao.wt_imageDelete(idx);
	}
}
