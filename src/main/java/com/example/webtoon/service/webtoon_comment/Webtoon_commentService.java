package com.example.webtoon.service.webtoon_comment;

import java.util.List;

import com.example.webtoon.model.webtoon_comment.dto.Webtoon_commentDTO;

public interface Webtoon_commentService {

	public List<Webtoon_commentDTO> wcList(String title,int no,int start,int end);

	public int count(String title,int no);

	public void wcInsert(Webtoon_commentDTO dto);
	
	public void wcDelete(int idx);
	
	public void wcDeleteAll(String title,int no);
	
	
}
