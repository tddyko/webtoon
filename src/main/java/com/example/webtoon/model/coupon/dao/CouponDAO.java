package com.example.webtoon.model.coupon.dao;

import java.util.List;

import com.example.webtoon.model.coupon.dto.CouponDTO;

public interface CouponDAO {
	
	public void couponInsert(CouponDTO dto);
	public List<CouponDTO> couponList();
	public int couponCheck(String coupon);
	public void couponDelete(int idx);
	public void couponUpdate(CouponDTO dto);
	public CouponDTO couponDTO(String coupon);

}
