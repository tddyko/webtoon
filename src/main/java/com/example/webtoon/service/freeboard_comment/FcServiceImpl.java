package com.example.webtoon.service.freeboard_comment;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.webtoon.model.freeboard_comment.dao.FcDAO;
import com.example.webtoon.model.freeboard_comment.dto.FcDTO;
import com.example.webtoon.model.freeboard_comment_reply.dao.Fc_replyDAO;
import com.example.webtoon.util.parser.HtmlParser;

@Service
public class FcServiceImpl implements FcService {

	@Inject
	FcDAO dao;
	@Inject
	Fc_replyDAO replydao;

	
	@Override
	public void fcInsert(FcDTO dto) {
		dao.fcInsert(dto);
	}

	@Override
	public int count(int freeboard_idx) {
		return dao.count(freeboard_idx);
		
	}

	@Override
	public List<FcDTO> fcList(int start, int end, int freeboard_idx) {
		Map<String, Object> map = new HashMap<>();
		map.put("freeboard_idx", freeboard_idx);
		map.put("start", start);
		map.put("end", end);
		List<FcDTO> list =null;
		list = dao.fcList(map);
		List<FcDTO> list2=new ArrayList<>();
		
		for (FcDTO fcDTO : list) {
			int fc_idx =fcDTO.getIdx();
			fcDTO.setReplyCount(replydao.count(fc_idx));
			fcDTO.setContent(HtmlParser.convertHtmlchars(fcDTO.getContent()));
			list2.add(fcDTO);
		}
		return list2;
	}

	@Override
	public void fcDelete(int idx) {
		dao.fcDelete(idx);
		replydao.fc_replyDeleteAll(idx);
	}

}
