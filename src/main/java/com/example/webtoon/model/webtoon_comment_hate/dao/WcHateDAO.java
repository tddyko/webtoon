package com.example.webtoon.model.webtoon_comment_hate.dao;

import java.util.Map;

public interface WcHateDAO {

	public void wchInsert(Map<String, Object> map);
	public void wchDelete(Map<String, Object> map);
	public boolean wchCheck(Map<String, Object> map);
	public int count(int c_idx);
	public void wchDeleteAll(int idx);
	
	
}
