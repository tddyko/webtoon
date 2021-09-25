package com.example.webtoon.service.webtoon_star;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.webtoon.model.webtoon_star.dao.Webtoon_StarDAO;

@Service
public class Webtoon_StarServiceImpl implements Webtoon_StarService {

	@Inject
	Webtoon_StarDAO wt_starDao;
	
	@Override
	public int wt_starCheck(String title, int no, int idx) {
		int check = wt_starDao.wt_starCheck(title,no,idx);
		return check;
	}

	@Override
	public void wt_starInsert(String title, int no, int idx, int star) {
		wt_starDao.wt_starInsert(title,no,idx,star);
	}

	@Override
	public void wt_starSetting(String title, int no) {
		wt_starDao.wt_starSetting(title,no);
	}

	@Override
	public void wt_starSetting(String title) {
		wt_starDao.wt_starSetting(title);
	}

}
