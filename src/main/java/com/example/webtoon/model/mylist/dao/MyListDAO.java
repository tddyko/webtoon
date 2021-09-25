package com.example.webtoon.model.mylist.dao;

import java.util.List;
import java.util.Map;

import com.example.webtoon.model.mylist.dto.MyListDTO;

public interface MyListDAO {

	public int Check(Map<String, Object> map);
  public void buyWebtoon(Map<String, Object> map);
  public List<MyListDTO> myList(int m_idx);
	
}
