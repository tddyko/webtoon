package com.example.webtoon.model.freeboard.dao;

import java.util.List;
import java.util.Map;

import com.example.webtoon.model.freeboard.dto.FreeboardDTO;

public interface FreeboardDAO {
	public List<FreeboardDTO> freeboardList(Map<String, Object> map);
	public int count();
	public void freeboardInsert(FreeboardDTO dto);
	public FreeboardDTO freeboardView(int idx);
	public void hitUp(int idx);
	public void freeboardDelete(int idx);
	public void freeboardUpdate(Map<String,Object> map);
	public List<FreeboardDTO> freeboardSearchTitle(String title);
	public List<FreeboardDTO> freeboardSearchEmail(String search);

}
