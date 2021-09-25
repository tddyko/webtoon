package com.example.webtoon.model.webtoon_Episode.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.webtoon.model.webtoon_Episode.dto.Webtoon_EpisodeDTO;
@Repository
public class Webtoon_EpisodeDAOImpl implements Webtoon_EpisodeDAO{

	@Inject
	SqlSession sqlsession;
	
	@Override
	public List<Webtoon_EpisodeDTO> seriesList(String title) {
		List<Webtoon_EpisodeDTO> list =null;
		try {
			list =sqlsession.selectList("seriesList",title);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Webtoon_EpisodeDTO> wtEpisodelist(String title) {
		List<Webtoon_EpisodeDTO> list =null;
		try {
			list = sqlsession.selectList("wt_EpisodeList",title);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void wtEpisodeInsert(Webtoon_EpisodeDTO dto) {
		try {
			sqlsession.selectOne("wt_EpisodeInsert",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public Webtoon_EpisodeDTO wtEpisodoUpdate(int idx) {
		
		Webtoon_EpisodeDTO dto = null;
		try {
			dto = sqlsession.selectOne("wt_EpisodeUpdate",idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void wtEpisodeUpdateDo(Webtoon_EpisodeDTO dto) {
		try {
			sqlsession.update("wt_EpisodeUpdateDo",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void wtEpisodeDelete(int idx) {
		try {
			sqlsession.delete("wt_EpisodeDelete",idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void wtEpisodeHitUp(Map<String, Object> map) {
		try {
			sqlsession.update("wt_EpisodeHitUp", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public int wtEpisodeCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = sqlsession.selectOne("seriesCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public String freeCheck(Map<String, Object> map) {
		String result = "";
		try {
			result = sqlsession.selectOne("wt_freeCheck", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int wt_coin(Map<String, Object> map) {
	int result = 0;
	
	try {
		result = sqlsession.selectOne("wt_coin",map);
	} catch (Exception e) {
		e.printStackTrace();
	}
		return result;
	}

}
