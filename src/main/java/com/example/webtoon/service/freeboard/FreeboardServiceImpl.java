package com.example.webtoon.service.freeboard;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.webtoon.model.freeboard.dao.FreeboardDAO;
import com.example.webtoon.model.freeboard.dto.FreeboardDTO;
import com.example.webtoon.model.freeboard_comment.dao.FcDAO;
import com.example.webtoon.model.freeboard_comment_reply.dao.Fc_replyDAO;


@Service
public class FreeboardServiceImpl implements FreeboardService {


	@Inject
	FreeboardDAO dao;
	@Inject
	FcDAO fcdao;
	@Inject
	Fc_replyDAO fc_replydao;

	@Override
	public List<FreeboardDTO> freeboardList(int start, int end) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("start", start);
		map.put("end", end);
		List<FreeboardDTO> list = dao.freeboardList(map);
		List<FreeboardDTO> list2 = new ArrayList<>();
		for (FreeboardDTO freeboardDTO : list) {
			int freeboard_idx=freeboardDTO.getIdx();
			freeboardDTO.setCommentCount(fcdao.count(freeboard_idx));
			list2.add(freeboardDTO);
		}
		return list2;
	}

	@Override
	public int count() {
		return dao.count();
	}

	@Override
	public void freeboardInsert(FreeboardDTO dto) {
		

		String content = dto.getContent().replace("<img", "<img class=\"img-responsive\"");
		dto.setContent(content);
		
		dao.freeboardInsert(dto);
		
	}
	
	@Override
	public FreeboardDTO freeboardView(int idx) {
		return dao.freeboardView(idx);
	}

	@Override
	public void hitUp(int idx) {
		dao.hitUp(idx);
	}

	@Override
	public void freeboardDelete(int idx) {
	
		List<Integer> list = fcdao.replyList(idx);
		fcdao.fcDeleteAll(idx);
		dao.freeboardDelete(idx);
		for (Integer integer : list) {
			idx= integer;
			fc_replydao.fc_replyDeleteAll(idx);
		}
		
	}

	@Override
	public void freeboardUpdate(int idx, String content) {
		Map<String,Object> map = new HashMap<>();
		map.put("idx", idx);
		map.put("content", content);
		dao.freeboardUpdate(map);
		
	}

	@Override
	public List<FreeboardDTO> freeboardSearchTitle(String title) {
		List<FreeboardDTO> list=dao.freeboardSearchTitle(title);
		List<FreeboardDTO> list2 = new ArrayList<>();
		for (FreeboardDTO freeboardDTO : list) {
			int freeboard_idx=freeboardDTO.getIdx();
			freeboardDTO.setCommentCount(fcdao.count(freeboard_idx));
			list2.add(freeboardDTO);
		}
		return list2;
	
	}

	@Override
	public List<FreeboardDTO> freeboardSearchEmail(String search) {
		List<FreeboardDTO> list = dao.freeboardSearchEmail(search);
		List<FreeboardDTO> list2 = new ArrayList<>();
		for (FreeboardDTO freeboardDTO : list) {
			int freeboard_idx=freeboardDTO.getIdx();
			freeboardDTO.setCommentCount(fcdao.count(freeboard_idx));
			list2.add(freeboardDTO);
		}
		return list2;
	}

}
