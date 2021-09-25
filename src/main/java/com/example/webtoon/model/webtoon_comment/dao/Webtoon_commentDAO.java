package com.example.webtoon.model.webtoon_comment.dao;

import java.util.List;
import java.util.Map;

import com.example.webtoon.model.webtoon_comment.dto.Webtoon_commentDTO;

public interface Webtoon_commentDAO {

	public List<Webtoon_commentDTO> wcList(Map<String, Object> map);

	public int count(Map<String, Object> map);

	public void wcInsert(Webtoon_commentDTO dto);
	
	public void wcDelete(int idx);
	
	public void wcDeleteAll(String title,int no);
	
	public void wcHeartUp(Map<String, Object> map);
	public void wcHeartDown(Map<String, Object> map);
	public void wcHateUp(Map<String, Object> map);
	public void wcHateDown(Map<String, Object> map);
	
}
