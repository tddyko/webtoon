package com.example.webtoon.model.webtoon_comment.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.webtoon.model.webtoon_comment.dto.Webtoon_commentDTO;

@Repository
public class Webtoon_commentDAOImpl implements Webtoon_commentDAO {

	@Inject
	SqlSession sqlsession;
	
	@Override
	public List<Webtoon_commentDTO> wcList(Map<String, Object> map) {
	List<Webtoon_commentDTO> list = null;
	try {
		list=sqlsession.selectList("wcList", map);
	} catch (Exception e) {
		e.printStackTrace();
	}
		return list;
	}

	@Override
	public int count(Map<String, Object> map) {
		int result = 0;
		try {
			result = sqlsession.selectOne("wcCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void wcInsert(Webtoon_commentDTO dto) {
		try {
			sqlsession.insert("wcInsert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void wcDelete(int idx) {
		try {
			sqlsession.delete("wcDelete",idx);
		} catch (Exception e) {
		e.printStackTrace();
		}
		
	}

	@Override
	public void wcDeleteAll(String title, int no) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void wcHeartUp(Map<String, Object> map) {
		try {
			sqlsession.update("wcHeartUp", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void wcHeartDown(Map<String, Object> map) {
		try {
			sqlsession.update("wcHeartDown", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void wcHateUp(Map<String, Object> map) {
		try {
			sqlsession.update("wcHateUp", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void wcHateDown(Map<String, Object> map) {
		try {
			sqlsession.update("wcHateDown", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
