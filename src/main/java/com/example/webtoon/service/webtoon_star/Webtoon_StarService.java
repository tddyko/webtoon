package com.example.webtoon.service.webtoon_star;

public interface Webtoon_StarService {

	public int wt_starCheck(String title, int no, int idx);

	public void wt_starInsert(String title, int no, int idx, int star);

	public void wt_starSetting(String title, int no);
	
	public void wt_starSetting(String title);

}
