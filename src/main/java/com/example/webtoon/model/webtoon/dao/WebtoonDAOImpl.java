package com.example.webtoon.model.webtoon.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.webtoon.model.webtoon.dto.WebtoonDTO;

@Repository
public class WebtoonDAOImpl implements WebtoonDAO {

	@Inject
	SqlSession sqlsession;

	@Override
	// 주별 웹툰 리스트
	public List<WebtoonDTO> weeklyList(Map<String, String> map) {
		List<WebtoonDTO> list = null;
		try {
			list = sqlsession.selectList("week", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public WebtoonDTO webtoonUpdate(int idx) {
		WebtoonDTO dto = null;
		try {
			dto = sqlsession.selectOne("wt_update_one", idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void webtoonUpdateConfirm(WebtoonDTO dto) {

		try {
			sqlsession.update("wt_update_confirm", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void webtoonDelete(int idx) {
		try {
			sqlsession.delete("wt_delete", idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void webtoonInsert(WebtoonDTO dto) {
		try {
			sqlsession.insert("wt_insert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<WebtoonDTO> wt_finishList(String finish) {
		List<WebtoonDTO> list = null;
		try {
			list = sqlsession.selectList("wt_finishList", finish);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<WebtoonDTO> wt_newList() {
		List<WebtoonDTO> list = null;
		try {
			list = sqlsession.selectList("wt_newList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<WebtoonDTO> wt_topList() {
		List<WebtoonDTO> list = null;
		try {
			list = sqlsession.selectList("wt_topList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<WebtoonDTO> wt_heartList() {
		List<WebtoonDTO> list = null;
		try {
			list = sqlsession.selectList("wt_heartList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 장르별 웹툰들
	@Override
	public List<WebtoonDTO> wt_category(String category) {
		List<WebtoonDTO> list = null;
		try {
			list = sqlsession.selectList("wt_category", category);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public WebtoonDTO webtoonInfo(String title) {
		WebtoonDTO dto = null;
		try {
			dto = sqlsession.selectOne("webtoonInfo",title);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<WebtoonDTO> webtoonSerch(String serch) {
		List<WebtoonDTO> list = null;
		System.out.println("sql직전"+serch);
				try {
					list = sqlsession.selectList("webtoonSerch",serch);
				} catch (Exception e) {
					e.printStackTrace();
				}
		return list;
	}

	@Override
	public List<WebtoonDTO> ad_weeklyList(String week) {
		List<WebtoonDTO> list = null;
		try {
			list = sqlsession.selectList("ad_weeklyList",week);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
