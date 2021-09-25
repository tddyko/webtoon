package com.example.webtoon.service.freeboard_comment;

import java.util.List;

import com.example.webtoon.model.freeboard_comment.dto.FcDTO;

public interface FcService {

	public List<FcDTO> fcList(int start,int end,int freeboard_idx);
	public int count(int freeboard_idx);
	public void fcInsert(FcDTO dto);
	public void fcDelete(int idx);
	
}
