package com.example.webtoon.model.freeboard_comment_reply.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.webtoon.model.freeboard_comment_reply.dto.Fc_replyDTO;

@Repository
public class Fc_replyDAOImpl implements Fc_replyDAO {

	@Inject
	SqlSession sqlsession;
	
	@Override
	public int count(int fc_idx) {
	int result = 0;
	try {
		result = sqlsession.selectOne("fc_replyCount",fc_idx);
	} catch (Exception e) {
		e.printStackTrace();
	}
		return result;
	}

	@Override
	public void fc_ReplyInsert(Fc_replyDTO dto) {
		try {
			sqlsession.insert("fc_replyInsert",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Fc_replyDTO> fc_replyList(int fc_idx) {
		List<Fc_replyDTO> list = null;
		try {
			list = sqlsession.selectList("fc_replyList",fc_idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void fc_replyDelete(int idx) {
		try {
			
			sqlsession.delete("fc_replyDelete",idx);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void fc_replyDeleteAll(int idx) {
		try {
			sqlsession.delete("fc_replyDeleteAll",idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
