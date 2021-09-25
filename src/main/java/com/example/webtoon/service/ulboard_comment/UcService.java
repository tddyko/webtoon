package com.example.webtoon.service.ulboard_comment;

import java.util.List;

import com.example.webtoon.model.ulboard_comment.dto.UcDTO;

public interface UcService {

	public void ucInsert(UcDTO dto);

	public int count(int ulboard_idx);

	public List<UcDTO> ucList(int start, int end, int ulboard_idx);

	public void ucDelete(int idx);

}
