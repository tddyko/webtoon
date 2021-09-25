package com.example.webtoon.model.favorite_wt.dao;

import java.util.List;

import com.example.webtoon.model.favorite_wt.dto.Favorite_wtDTO;

public interface Favorite_wtDAO {

	public int favoriteCheck(String title, int idx);

	public void favoriteInsert(String title, int idx);

	public List<Favorite_wtDTO> favorite_wtList(int idx);

	public void favoriteDelete(int idx);

}
