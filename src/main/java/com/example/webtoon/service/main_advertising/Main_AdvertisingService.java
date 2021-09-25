package com.example.webtoon.service.main_advertising;

import java.util.List;

import com.example.webtoon.model.main_advertising.dto.Main_AdvertisingDTO;

public interface Main_AdvertisingService {

	public List<Main_AdvertisingDTO> mainAdvertisingList();

	public List<Main_AdvertisingDTO> mainAdvertisingListAll();

	public Main_AdvertisingDTO mainAdvertisingUpdate(int idx);

	public void main_ad_UpdateConfirm(Main_AdvertisingDTO dto);

	public void main_advertisingDelete(int idx);

	public void main_ad_Insert(Main_AdvertisingDTO dto);
	public String mainImagename(int idx);

	public Double getFeeAvg(String start_day, String end_day);

	public Double getFeeTotal(String start_day, String end_day);

	
}
