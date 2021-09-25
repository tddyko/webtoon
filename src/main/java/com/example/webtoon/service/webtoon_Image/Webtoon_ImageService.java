package com.example.webtoon.service.webtoon_Image;

import java.util.List;

import com.example.webtoon.model.webtoon_image.dto.Webtoon_ImageDTO;

public interface Webtoon_ImageService {

	public List<Webtoon_ImageDTO> webtoonList(String title, int no);
	public void wt_imageInsert(String title, int no, int image);
	public Webtoon_ImageDTO wt_imageUpdate(int idx);
	public List<Integer> wt_imageList(String title, int no);
	public void wt_imageUpdateDo(Webtoon_ImageDTO dto);
	public void wt_imageDelete(int idx);

}
