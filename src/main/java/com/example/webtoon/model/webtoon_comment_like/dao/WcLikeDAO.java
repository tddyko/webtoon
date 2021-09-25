package com.example.webtoon.model.webtoon_comment_like.dao;

import java.util.Map;

public interface WcLikeDAO {

	public void wclInsert(Map<String, Object> map);
	public void wclDelete(Map<String, Object> map);
	public boolean wclCheck(Map<String, Object> map);
	public int count(int c_idx);
	public void wclDeleteAll(int idx);
	
	
}
