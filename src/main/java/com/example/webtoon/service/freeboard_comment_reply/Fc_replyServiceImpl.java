package com.example.webtoon.service.freeboard_comment_reply;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.webtoon.model.freeboard_comment_reply.dao.Fc_replyDAO;
import com.example.webtoon.model.freeboard_comment_reply.dto.Fc_replyDTO;
import com.example.webtoon.util.parser.HtmlParser;

@Service
public class Fc_replyServiceImpl implements Fc_replyService {

	@Inject
	
	Fc_replyDAO dao;
	
	@Override
	public int count(int fc_idx) {
		return dao.count(fc_idx);
	}

	@Override
	public void fc_ReplyInsert(Fc_replyDTO dto) {
		dao.fc_ReplyInsert(dto);
		
	}

	@Override
	public List<Fc_replyDTO> fc_replyList(int fc_idx) {
		
		List<Fc_replyDTO> list =null;
		list = dao.fc_replyList(fc_idx);
		List<Fc_replyDTO> list2=new ArrayList<>();
		
		for (Fc_replyDTO dto : list) {
			dto.setContent(HtmlParser.convertHtmlchars(dto.getContent()));
			list2.add(dto);
		}
		
		// TODO Auto-generated method stub
		return list2;
	}

	@Override
	public void fc_replyDelete(int idx) {

		dao.fc_replyDelete(idx);
		
	}

}
