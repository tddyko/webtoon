package com.example.webtoon.model.certification.dao;

import java.util.Map;

import com.example.webtoon.model.certification.dto.CertiDTO;

public interface CertiDAO {

	public void insert(Map<String, String> map);
	public int check(CertiDTO dto);
	public void delete(String email);
}
