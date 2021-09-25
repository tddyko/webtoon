package com.example.webtoon.service.ulboard_like;

public interface Ul_likeService {
	public void ul_likeInsert(int m_idx,int u_idx);
	public boolean ul_likeCheck(int m_idx, int u_idx);
	public void ul_likeDelete(int m_idx,int u_idx);
	public int ul_likeUpdown(int m_idx, int u_idx);
	public int count(int u_idx);
	public void ul_likeDeleteAll(int u_idx);
	
}
