package com.example.webtoon.model.ulboard.dao;

import java.util.List;
import java.util.Map;

import com.example.webtoon.model.ulboard.dto.UlboardDTO;

public interface UlboardDAO {
	public List<UlboardDTO> ulboardList(Map<String, Object> map);
	// 게시글 조회수 표시
	public int count();
	// 게시글 쓰기
	public void ulboardInsert(UlboardDTO dto);
	// 게시글 조회
	public UlboardDTO ulboardView(int idx);
	// 게시글 조회수관련
	public void hitUp(int idx);
	// 게시글 삭제
	public void ulboardDelete(int idx);
	// 게시글 수정
	public void ulboardUpdate(UlboardDTO dto);
	// 이미지 이름
	public String ulimg(int idx);	
	
	public void ulheartUp(int idx);
	public void ulheartDown(int idx);
}
