package com.example.webtoon.service.certification;

import com.example.webtoon.model.certification.dto.CertiDTO;

public interface CertiService {

	public void insert(String email);
	public boolean check(CertiDTO dto);
	public void delete(String email);
}
