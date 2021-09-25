package com.example.webtoon.model.ulboard_comment.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.webtoon.model.ulboard_comment.dto.UcDTO;

@Repository
public class UcDAOImpl implements UcDAO{

	@Inject
	SqlSession sqlSession;
	
	@Override
	public void ucInsert(UcDTO dto) {
		try {
			sqlSession.insert("ucInsert",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int count(int ulboard_idx) {
		int result = 0;
		try {
			result = sqlSession.selectOne("ucCount",ulboard_idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<UcDTO> ucList(Map<String, Object> map) {
		List<UcDTO> list = null;
		try {
			list = sqlSession.selectList("ucList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void ucDelete(int idx) {
		try {
			sqlSession.delete("ucDelete", idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
