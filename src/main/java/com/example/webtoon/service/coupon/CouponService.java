package com.example.webtoon.service.coupon;

import java.util.List;

import com.example.webtoon.model.coupon.dto.CouponDTO;

public interface CouponService {

	public void couponInsert(CouponDTO dto);
	public List<CouponDTO> couponList();
	public boolean couponCheck(String coupon);
	public void couponDelete(int idx);
	public void couponUpdate(CouponDTO dto);
	public CouponDTO couponDTO(String coupon);
}
