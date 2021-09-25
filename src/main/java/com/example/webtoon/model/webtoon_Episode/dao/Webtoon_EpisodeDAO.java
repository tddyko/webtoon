package com.example.webtoon.model.webtoon_Episode.dao;

import java.util.List;
import java.util.Map;

import com.example.webtoon.model.webtoon_Episode.dto.Webtoon_EpisodeDTO;

public interface Webtoon_EpisodeDAO {

	public List<Webtoon_EpisodeDTO> seriesList(String title);

	public List<Webtoon_EpisodeDTO> wtEpisodelist(String title);

	public void wtEpisodeInsert(Webtoon_EpisodeDTO dto);

	public Webtoon_EpisodeDTO wtEpisodoUpdate(int idx);

	public void wtEpisodeUpdateDo(Webtoon_EpisodeDTO dto);

	public void wtEpisodeDelete(int idx);
	
	public void wtEpisodeHitUp(Map<String, Object> map);
	public int wtEpisodeCount(Map<String,Object> map);
	public String freeCheck(Map<String, Object> map);
   public int wt_coin(Map<String, Object> map);
}
