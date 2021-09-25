package com.example.webtoon.model.webtoon.dao;

import java.util.List;
import java.util.Map;

import com.example.webtoon.model.webtoon.dto.WebtoonDTO;

public interface WebtoonDAO {
	
	public List<WebtoonDTO> weeklyList(Map<String, String> map);

	public WebtoonDTO webtoonUpdate(int idx);

	public void webtoonUpdateConfirm(WebtoonDTO dto);

	public void webtoonDelete(int idx);

	public void webtoonInsert(WebtoonDTO dto);

	public List<WebtoonDTO> wt_finishList(String finish);

	public List<WebtoonDTO> wt_newList();

	public List<WebtoonDTO> wt_heartList();

	public List<WebtoonDTO> wt_category(String category);

	public List<WebtoonDTO> wt_topList();

	public WebtoonDTO webtoonInfo(String title);

	public List<WebtoonDTO> webtoonSerch(String serch);

	public List<WebtoonDTO> ad_weeklyList(String week);
	
}
