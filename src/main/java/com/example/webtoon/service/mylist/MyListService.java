package com.example.webtoon.service.mylist;

import java.util.List;

import com.example.webtoon.model.mylist.dto.MyListDTO;

public interface MyListService {

	public boolean Check(int m_idx,String title,int no);
	public void buyWebtoon(int m_idx,String title,int no,int coin);
	public List<MyListDTO> myList(int idx);
}
