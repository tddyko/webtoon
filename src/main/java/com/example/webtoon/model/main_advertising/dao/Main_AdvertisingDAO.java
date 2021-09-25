
package com.example.webtoon.model.main_advertising.dao;

import java.util.List;

import com.example.webtoon.model.main_advertising.dto.Main_AdvertisingDTO;

public interface Main_AdvertisingDAO {

	public List<Main_AdvertisingDTO> mainAdvertisingList();

	public List<Main_AdvertisingDTO> mainAdvertisingListAll();

	public Main_AdvertisingDTO mainAdvertisingUpdate(int idx);

	public void mainAdvertisingUpdateConfirm(Main_AdvertisingDTO dto);

	public void mainAdvertisingDelete(int idx);

	public void mainAdvertisingInsert(Main_AdvertisingDTO dto);

	public String mainImagename(int idx);

	public Double getFeeAvg(String start_day, String end_day);

	public Double getFeeTotal(String start_day, String end_day);

	
}
