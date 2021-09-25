package com.example.webtoon.model.webtoon_image.dao;

import java.util.List;
import java.util.Map;

import com.example.webtoon.model.webtoon_image.dto.Webtoon_ImageDTO;

public interface Webtoon_ImageDAO {
	
	public List<Webtoon_ImageDTO> webtoonList(Map<String, Object> map);

	public void webtoonImageInsert(String title, int no, int image);

	public Webtoon_ImageDTO webtoonImageUpdate(int idx);

	public List<Integer> wt_imageList(String title, int no);

	public void wt_imageUpdateDo(Webtoon_ImageDTO dto);

	public void wt_imageDelete(int idx);


}
