package com.example.webtoon.model.ulboard_like.dao;

import java.util.Map;

public interface Ul_likeDAO {

	public void ul_likeInsert(Map<String, Object> map);
	public void ul_likeDelete(Map<String, Object> map);
	public boolean ul_likeheck(Map<String, Object> map);
	public int count(int u_idx);
	public void ul_likeDeleteAll(int idx);
	
	
}
