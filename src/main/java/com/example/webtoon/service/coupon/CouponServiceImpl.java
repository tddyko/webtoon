package com.example.webtoon.service.coupon;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.example.webtoon.model.coupon.dao.CouponDAO;
import com.example.webtoon.model.coupon.dto.CouponDTO;

@Repository
public class CouponServiceImpl implements CouponService {

	@Inject CouponDAO dao;
	
	@Override
	public void couponInsert(CouponDTO dto) {
		dao.couponInsert(dto);
		
	}

	@Override
	public List<CouponDTO> couponList() {
		return dao.couponList();
	}

	@Override
	public boolean couponCheck(String coupon) {
		boolean result = false;
		try {
			result = dao.couponCheck(coupon)>0?true:false;
//			있으면 트루 없으면 폴스
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void couponDelete(int idx) {
		dao.couponDelete(idx);
		
	}

	@Override
	public void couponUpdate(CouponDTO dto) {
		dao.couponUpdate(dto);
		
	}

	@Override
	public CouponDTO couponDTO(String coupon) {
		return dao.couponDTO(coupon);
	}

}
