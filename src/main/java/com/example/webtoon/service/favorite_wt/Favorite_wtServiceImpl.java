package com.example.webtoon.service.favorite_wt;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.webtoon.model.favorite_wt.dao.Favorite_wtDAO;
import com.example.webtoon.model.favorite_wt.dto.Favorite_wtDTO;

@Service
public class Favorite_wtServiceImpl implements Favorite_wtService {

	@Inject
	Favorite_wtDAO favoriteDao;
	@Override
	public int favoriteCheck(String title, int idx) {
		
		return favoriteDao.favoriteCheck(title,idx);
	}
	@Override
	public void favoriteInsert(String title, int idx) {
		favoriteDao.favoriteInsert(title,idx);
	}
	@Override
	public List<Favorite_wtDTO> favorite_wtList(int idx) {
		return favoriteDao.favorite_wtList(idx);
	}
	@Override
	public void favoriteDelete(int idx) {
		favoriteDao.favoriteDelete(idx);
		
	}

}
