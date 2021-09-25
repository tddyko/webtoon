package com.example.webtoon.model.webtoon_image.dao;

import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.webtoon.model.webtoon_image.dto.Webtoon_ImageDTO;
@Repository
public class Webtoon_ImageDAOImpl implements Webtoon_ImageDAO {

	@Inject
	SqlSession sqlsession;
	@Override
	public List<Webtoon_ImageDTO> webtoonList(Map<String, Object> map) {
		
		List<Webtoon_ImageDTO> list =null;
		try {
			list = sqlsession.selectList("webtoonList",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public void webtoonImageInsert(String title, int no, int image) {
		Map<String,Object> map = new Hashtable<>();
		try {
			map.put("title", title);
			map.put("no", no);
			map.put("image", image);
			sqlsession.insert("wt_ImageInsert",map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Override
	public Webtoon_ImageDTO webtoonImageUpdate(int idx) {
		Webtoon_ImageDTO dto = null;
		try {
			dto = sqlsession.selectOne("wt_ImageUpdate",idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	@Override
	public List<Integer> wt_imageList(String title, int no) {
		List<Integer> list = null;
		Map<String,Object> map = new HashMap<>();
		map.put("title", title);
		map.put("no",no);
		try {
			System.out.println("이미지순뽑기 sql시작");
			 list =sqlsession.selectList("wt_ImageImageList", map);
			System.out.println("이미지순뽑기 sql완료");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	@Override
	public void wt_imageUpdateDo(Webtoon_ImageDTO dto) {
		try {
			sqlsession.update("wt_ImageUpdateDo",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Override
	public void wt_imageDelete(int idx) {
		try {
			sqlsession.delete("wt_ImageDelete",idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
