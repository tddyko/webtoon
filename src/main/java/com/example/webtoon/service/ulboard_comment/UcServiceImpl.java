package com.example.webtoon.service.ulboard_comment;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.webtoon.model.ulboard_comment.dao.UcDAO;
import com.example.webtoon.model.ulboard_comment.dto.UcDTO;
import com.example.webtoon.util.parser.HtmlParser;

@Service
public class UcServiceImpl implements UcService{

	@Inject UcDAO dao;
	
	@Override
	public void ucInsert(UcDTO dto) {
		dao.ucInsert(dto);
	}

	@Override
	public int count(int ulboard_idx) {
		return dao.count(ulboard_idx);
	}

	@Override
	public List<UcDTO> ucList(int start, int end, int ulboard_idx) {
		Map<String, Object> map = new HashMap<>();
		map.put("ulboard_idx", ulboard_idx);
		map.put("start", start);
		map.put("end", end);
		List<UcDTO> list =null;
		list = dao.ucList(map);
		List<UcDTO> list2=new ArrayList<>();
		
		for (UcDTO ucDTO : list) {
			//ucDTO.setReplyCount(replydao.count(fc_idx));
			ucDTO.setContent(HtmlParser.convertHtmlchars(ucDTO.getContent()));
			list2.add(ucDTO);
		}
		return list2;
	}

	@Override
	public void ucDelete(int idx) {
		dao.ucDelete(idx);
	}

}
