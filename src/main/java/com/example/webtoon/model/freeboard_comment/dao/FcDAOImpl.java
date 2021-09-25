package com.example.webtoon.model.freeboard_comment.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.webtoon.model.freeboard_comment.dto.FcDTO;

@Repository
public class FcDAOImpl implements FcDAO {

	@Inject
	SqlSession sqlsession;

	@Override
	public void fcInsert(FcDTO dto) {
		try {
			sqlsession.insert("fcInsert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public int count(int freeboard_idx) {
		int result = 0;
		try {
			result = sqlsession.selectOne("fcCount", freeboard_idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<FcDTO> fcList(Map<String, Object> map) {
		List<FcDTO> list = null;
		try {
			list = sqlsession.selectList("fcList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void fcDelete(int idx) {
		try {

			sqlsession.delete("fcDelete", idx);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public void fcDeleteAll(int idx) {
		try {
			sqlsession.delete("fcDeleteAll", idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Integer> replyList(int idx) {
		List<Integer> list=null;
		try {
			list = sqlsession.selectList("replyList",idx);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

}
