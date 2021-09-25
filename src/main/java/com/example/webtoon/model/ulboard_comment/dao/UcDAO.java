package com.example.webtoon.model.ulboard_comment.dao;

import java.util.List;
import java.util.Map;

import com.example.webtoon.model.ulboard_comment.dto.UcDTO;

public interface UcDAO {

	public void ucInsert(UcDTO dto);

	public int count(int ulboard_idx);

	public List<UcDTO> ucList(Map<String, Object> map);

	public void ucDelete(int idx);


}
