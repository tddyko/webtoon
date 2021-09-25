package com.example.webtoon.service.freeboard;

import java.util.List;

import com.example.webtoon.model.freeboard.dto.FreeboardDTO;

public interface FreeboardService {
	public int count();

	public List<FreeboardDTO> freeboardList(int start, int end);

	public void freeboardInsert(FreeboardDTO dto);

	public FreeboardDTO freeboardView(int idx);

	public void hitUp(int idx);
	
	public void freeboardDelete(int idx);
	
	public void freeboardUpdate(int idx,String content);
	
	public List<FreeboardDTO> freeboardSearchTitle(String title);

	public List<FreeboardDTO> freeboardSearchEmail(String search);
}
