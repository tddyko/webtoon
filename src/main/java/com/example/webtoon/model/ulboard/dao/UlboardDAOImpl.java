package com.example.webtoon.model.ulboard.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.webtoon.model.ulboard.dto.UlboardDTO;

@Repository
public class UlboardDAOImpl implements UlboardDAO {
	
	@Inject
	SqlSession sqlsession;
	
	@Override
	public List<UlboardDTO> ulboardList(Map<String, Object> map) {
		List<UlboardDTO> list = null;
		try {
			list = sqlsession.selectList("ulboardList", map);
		} catch (Exception e) {
		e.printStackTrace();
		}
		return list;
	}

	@Override
	public int count() {
		int count = 0;
		try {
			count = sqlsession.selectOne("ulboardcount");
		} catch (Exception e) {
		e.printStackTrace();
		}
		return count;
	}

	@Override
	public void ulboardInsert(UlboardDTO dto) {
		try {
			sqlsession.insert("ulboardInsert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public UlboardDTO ulboardView(int idx) {
		UlboardDTO dto = null;
		try {
			dto = sqlsession.selectOne("ulboardView", idx);
		} catch (Exception e) {
		e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void hitUp(int idx) {
		try {
			sqlsession.update("ulboardhitUp", idx);
		} catch (Exception e) {
		e.printStackTrace();
		}
	}

	@Override
	public void ulboardDelete(int idx) {
		try {
			sqlsession.delete("ulboardDelete", idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void ulboardUpdate(UlboardDTO dto) {
		try {
			sqlsession.update("ulboardUpdate", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public String ulimg(int idx) {
		String name = "";
		try {
			name = sqlsession.selectOne("ul_img", idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return name;
	}

	@Override
	public void ulheartUp(int idx) {
		try {
			sqlsession.update("ulheartUp",idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void ulheartDown(int idx) {
		try {
			sqlsession.update("ulheartDown",idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}