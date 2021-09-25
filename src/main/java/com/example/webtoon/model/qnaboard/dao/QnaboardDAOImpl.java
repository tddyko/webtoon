package com.example.webtoon.model.qnaboard.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.webtoon.model.qnaboard.dto.QnaboardDTO;

@Repository
public class QnaboardDAOImpl implements QnaboardDAO {

	@Inject
	SqlSession sqlSession;
	@Override
	public List<QnaboardDTO> qnaboardList() {
		
		List<QnaboardDTO> list = null;
		try {
			list =  sqlSession.selectList("qnaboardList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public void qnaboardInsert(QnaboardDTO dto) {
		try {
			sqlSession.insert("qnaboardInsert",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Override
	public void qnaboardDelete(int idx) {
		try {
			sqlSession.delete("qnaboardDelete",idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Override
	public QnaboardDTO qnaboardView(int idx) {
		QnaboardDTO dto = null;
		try {
			dto = sqlSession.selectOne("qnaboardView",idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	@Override
	public void qnaboardUpdate(QnaboardDTO dto) {
		try {
			sqlSession.update("qnaboardUpdate",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
