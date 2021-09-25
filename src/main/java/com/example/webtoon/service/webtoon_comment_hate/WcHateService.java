package com.example.webtoon.service.webtoon_comment_hate;

public interface WcHateService {

	public void wchInsert(int m_idx,int c_idx);
	public boolean wchCheck(int m_idx, int c_idx);
	public void wchDelete(int m_idx,int c_idx);
	public int wchUpdown(int m_idx, int c_idx);
	public int count(int c_idx);
	public void wchDeleteAll(int idx);
	
}
