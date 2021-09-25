package com.example.webtoon.service.webtoon_comment_like;

public interface WcLikeService {

	public void wclInsert(int m_idx,int c_idx);
	public boolean wclCheck(int m_idx, int c_idx);
	public void wclDelete(int m_idx,int c_idx);
	public int wclUpdown(int m_idx, int c_idx);
	public int count(int c_idx);
	public void wclDeleteAll(int idx);
	
}
