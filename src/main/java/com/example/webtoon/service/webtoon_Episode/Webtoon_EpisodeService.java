package com.example.webtoon.service.webtoon_Episode;

import java.util.List;

import com.example.webtoon.model.webtoon_Episode.dto.Webtoon_EpisodeDTO;

public interface Webtoon_EpisodeService {

	public List<Webtoon_EpisodeDTO> seriesList(String title);

	public List<Webtoon_EpisodeDTO> wtEpisodelist(String title);

	public void wtEpisodeInsert(Webtoon_EpisodeDTO dto);

	public Webtoon_EpisodeDTO wtEpisodeUpdate(int idx);

	public void wtEpisodeUpdateDo(Webtoon_EpisodeDTO dto);

	public void webtoonDelete(int idx);
	public void wtEpisodeHitUp(String title,int no);
	public int wtEpisodeCount(String title,int no);
	public boolean freeCheck(String title,int no);
	public int wt_coin(String title,int no);

}
