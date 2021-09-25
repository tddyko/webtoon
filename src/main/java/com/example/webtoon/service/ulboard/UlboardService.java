package com.example.webtoon.service.ulboard;

import java.util.List;

import com.example.webtoon.model.ulboard.dto.UlboardDTO;

public interface UlboardService {
	public int count();
	
	public List<UlboardDTO> ulboardList(int start, int end);
	
	public void ulboardInsert(UlboardDTO dto);
	
	public UlboardDTO ulboardView(int idx);
	
	public void hitUp(int idx);
	
	public void ulboardDelete(int idx);
	
	public void ulboardUpdate(UlboardDTO dto);
	
	public String ulimg(int idx);
}
