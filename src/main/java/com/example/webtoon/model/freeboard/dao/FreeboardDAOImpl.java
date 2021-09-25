package com.example.webtoon.model.freeboard.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.webtoon.model.freeboard.dto.FreeboardDTO;

@Repository
public class FreeboardDAOImpl implements FreeboardDAO {

	@Inject
	SqlSession sqlsession;
	
	@Override
	public List<FreeboardDTO> freeboardList(Map<String, Object> map) {
		List<FreeboardDTO> list = null;
		try {
			list= sqlsession.selectList("freeboardList",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int count() {
		int count= 0;
		
		try {
			count = sqlsession.selectOne("freeboardcount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}

	@Override
	public void freeboardInsert(FreeboardDTO dto) {
		try {
			sqlsession.insert("freeboardInsert",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	@Override
	public FreeboardDTO freeboardView(int idx) {
		FreeboardDTO dto = null;
		try {
			dto = sqlsession.selectOne("freeboardView", idx);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public void hitUp(int idx) {
		try {
			sqlsession.update("freeboardhitUp",idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void freeboardDelete(int idx) {
		try {
			sqlsession.delete("freeboardDelete",idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void freeboardUpdate(Map<String, Object> map) {
		try {
			sqlsession.update("freeboardUpdate",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public List<FreeboardDTO> freeboardSearchTitle(String title) {
		List<FreeboardDTO> list = null;
		try {
			list= sqlsession.selectList("freeboardSearchTitle",title);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<FreeboardDTO> freeboardSearchEmail(String search) {
		List<FreeboardDTO> list = null;
		try {
			list= sqlsession.selectList("freeboardSearchEmail",search);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
