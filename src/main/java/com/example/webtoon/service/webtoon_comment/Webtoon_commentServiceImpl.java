package com.example.webtoon.service.webtoon_comment;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.webtoon.model.webtoon_comment.dao.Webtoon_commentDAO;
import com.example.webtoon.model.webtoon_comment.dto.Webtoon_commentDTO;
import com.example.webtoon.service.webtoon_comment_hate.WcHateService;
import com.example.webtoon.service.webtoon_comment_like.WcLikeService;
import com.example.webtoon.util.parser.HtmlParser;

@Service
public class Webtoon_commentServiceImpl implements Webtoon_commentService {

	@Inject
	Webtoon_commentDAO dao;
	@Inject
	WcLikeService likeService;
	@Inject
	WcHateService hateService;

	@Override
	public List<Webtoon_commentDTO> wcList(String title, int no, int start, int end) {
		Map<String, Object> map = new HashMap<>();
		map.put("title", title);
		map.put("no", no);
		map.put("start", start);
		map.put("end", end);
		List<Webtoon_commentDTO> list = dao.wcList(map);
		List<Webtoon_commentDTO> list2 = new ArrayList<>();

		for (Webtoon_commentDTO dto : list) {
			dto.setContent(HtmlParser.convertHtmlchars(dto.getContent()));
			list2.add(dto);
		}

		return list2;
	}

	@Override
	public int count(String title, int no) {
		Map<String, Object> map = new HashMap<>();
		map.put("title", title);
		map.put("no", no);
		return dao.count(map);
	}

	@Override
	public void wcInsert(Webtoon_commentDTO dto) {
		dao.wcInsert(dto);

	}

	@Override
	public void wcDelete(int idx) {
		likeService.wclDeleteAll(idx);
		hateService.wchDeleteAll(idx);
		dao.wcDelete(idx);
	}

	@Override
	public void wcDeleteAll(String title, int no) {
		// TODO Auto-generated method stub

	}

}
