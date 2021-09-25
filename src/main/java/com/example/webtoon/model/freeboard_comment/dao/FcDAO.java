package com.example.webtoon.model.freeboard_comment.dao;

import java.util.List;
import java.util.Map;

import com.example.webtoon.model.freeboard_comment.dto.FcDTO;

public interface FcDAO {

	public List<FcDTO> fcList(Map<String, Object> map);

	public int count(int freeboard_idx);

	public void fcInsert(FcDTO dto);
	
	public void fcDelete(int idx);
	
	public void fcDeleteAll(int idx);
	public List<Integer> replyList(int idx);

}
