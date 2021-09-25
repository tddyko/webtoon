package com.example.webtoon.service.main_advertising;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.webtoon.model.main_advertising.dao.Main_AdvertisingDAO;
import com.example.webtoon.model.main_advertising.dto.Main_AdvertisingDTO;

@Service
public class Main_AdvertisingServiceImple implements Main_AdvertisingService {

	@Inject
	Main_AdvertisingDAO dao;

	@Override
	public List<Main_AdvertisingDTO> mainAdvertisingList() {
		
		return dao.mainAdvertisingList();
	}

	@Override
	public List<Main_AdvertisingDTO> mainAdvertisingListAll() {
		return dao.mainAdvertisingListAll();
	}

	@Override
	public Main_AdvertisingDTO mainAdvertisingUpdate(int idx) {
		return dao.mainAdvertisingUpdate(idx);
	}

	@Override
	public void main_ad_UpdateConfirm(Main_AdvertisingDTO dto) {
		System.out.println("서비스에서 dto보내");
		dao.mainAdvertisingUpdateConfirm(dto);
	}

	@Override
	public void main_advertisingDelete(int idx) {
		dao.mainAdvertisingDelete(idx);
	}

	@Override
	public void main_ad_Insert(Main_AdvertisingDTO dto) {
		dao.mainAdvertisingInsert(dto);
	}

	@Override
	public String mainImagename(int idx) {
		return dao.mainImagename(idx);
	}

	@Override
	public Double getFeeAvg(String start_day, String end_day) {
		
		return dao.getFeeAvg(start_day,end_day);
	}

	@Override
	public Double getFeeTotal(String start_day, String end_day) {
		
		return dao.getFeeTotal(start_day,end_day);
	}

	


}
