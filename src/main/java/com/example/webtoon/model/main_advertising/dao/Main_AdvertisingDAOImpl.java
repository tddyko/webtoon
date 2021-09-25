package com.example.webtoon.model.main_advertising.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.webtoon.model.main_advertising.dto.Main_AdvertisingDTO;

@Repository
public class Main_AdvertisingDAOImpl implements Main_AdvertisingDAO {

	@Inject
	SqlSession sqlsession;

	@Override
	public List<Main_AdvertisingDTO> mainAdvertisingList() {
		List<Main_AdvertisingDTO> list = null;
		try {
			list = sqlsession.selectList("main_ad_list");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Main_AdvertisingDTO> mainAdvertisingListAll() {
		List<Main_AdvertisingDTO> list = null;
		try {
			list = sqlsession.selectList("main_ad_listAll");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public Main_AdvertisingDTO mainAdvertisingUpdate(int idx) {
		Main_AdvertisingDTO dto = null;
		try {
			dto = sqlsession.selectOne("main_ad_update", idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void mainAdvertisingUpdateConfirm(Main_AdvertisingDTO dto) {
		try {
			sqlsession.update("main_ad_updateConfirm",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void mainAdvertisingDelete(int idx) {
		try {
			sqlsession.delete("main_ad_delete",idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void mainAdvertisingInsert(Main_AdvertisingDTO dto) {
		try {
			sqlsession.insert("main_ad_insert",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public String mainImagename(int idx) {
		String name = "";
		
		try {
			name = sqlsession.selectOne("main_ad_img", idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return name;
	}

	@Override
	public Double getFeeAvg(String start_day, String end_day) {
		Double avg = null;
		Map<String,String> map = new HashMap<>();
		map.put("start_day", start_day);
		map.put("end_day", end_day);
		
		try {
			avg = sqlsession.selectOne("getFeeAvg",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return avg;
	}

	@Override
	public Double getFeeTotal(String start_day, String end_day) {
		Double total = null;
		Map<String,String> map = new HashMap<>();
		map.put("start_day", start_day);
		map.put("end_day", end_day);
		
		try {
			total = sqlsession.selectOne("getFeeTotal",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return total;
	}

}
